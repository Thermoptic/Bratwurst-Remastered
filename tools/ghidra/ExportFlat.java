import ghidra.app.script.GhidraScript;
import ghidra.app.decompiler.*;
import ghidra.program.model.listing.*;
import ghidra.program.model.address.*;
import ghidra.app.cmd.disassemble.*;
import java.io.*;
import java.nio.file.*;

public class ExportFlat extends GhidraScript {
    @Override
    public void run() throws Exception {
        String out = getScriptArgs()[0];
        AddressSpace sp = currentProgram.getAddressFactory().getDefaultAddressSpace();
        Listing l = currentProgram.getListing();
        // seeds: jsr/jmp relocation targets
        for (String s : Files.readAllLines(Paths.get(getScriptArgs()[1]))) {
            s = s.trim(); if (s.isEmpty()) continue; if (s.contains("lea") && !s.contains("jsr") && !s.contains("other")) continue; s = s.split(" ")[0];
            Address a = sp.getAddress(Long.decode(s));
            disassemble(a);
        }
        // seeds: function-prologue patterns (movem.l ...,-(sp) = 48E7 ; link = 4E56) not yet code
        int added = 0;
        long end = 81432;
        for (long o = 0; o < end - 4; o += 2) {
            Address a = sp.getAddress(o);
            int w = (getByte(a) & 0xff) << 8 | (getByte(a.add(1)) & 0xff);
            if ((w == 0x48E7 || w == 0x4E56) && l.getInstructionAt(a) == null && l.getDefinedDataAt(a) == null) {
                if (disassemble(a)) added++;
            }
        }
        println("prologue seeds disassembled: " + added);
        // gap sweep: code that follows the end of a code run (after rts/jmp/bra) is usually a new routine
        for (int pass = 0; pass < 6; pass++) {
            int got = 0;
            Instruction prev = null;
            java.util.ArrayList<Address> seeds = new java.util.ArrayList<>();
            for (Instruction i : l.getInstructions(true)) {
                if (prev != null) {
                    Address e = prev.getMaxAddress().add(1);
                    if (e.getOffset() < i.getAddress().getOffset() && (e.getOffset() < 0x7fa8 || (e.getOffset() >= 0x112bc && e.getOffset() < 0x12e5e) || e.getOffset() >= 0x134f2) && e.getOffset() < 0x14000 && !(e.getOffset() >= 0x4980 && e.getOffset() < 0x5472) && e.getOffset() % 2 == 0) seeds.add(e);
                }
                prev = i;
            }
            for (Address a : seeds) if (l.getInstructionAt(a) == null && l.getDefinedDataAt(a) == null) { if (disassemble(a)) got++; }
            println("gap pass " + pass + ": " + got);
            if (got == 0) break;
        }
        for (int pass = 0; pass < 3; pass++) {
            for (Instruction i : l.getInstructions(true)) { /* flow already followed by disassemble */ }
        }
        // create functions at call targets
        AddressIterator ai = currentProgram.getReferenceManager().getReferenceDestinationIterator(currentProgram.getMemory(), true);
        int fcount = 0;
        for (Instruction i : l.getInstructions(true)) {
            if (i.getFlowType().isCall()) {
                for (Address t : i.getFlows()) {
                    if (l.getFunctionAt(t) == null && l.getInstructionAt(t) != null) {
                        createFunction(t, null); fcount++;
                    }
                }
            }
        }
        println("functions created from calls: " + fcount);
        PrintWriter lst = new PrintWriter(new File(out, "flat_listing.txt"));
        PrintWriter xr = new PrintWriter(new File(out, "flat_xrefs.txt"));
        for (long tgt : new long[]{0x7fb0L, 0x7fda, 0x7fa9}) {
            for (ghidra.program.model.symbol.Reference r : currentProgram.getReferenceManager().getReferencesTo(sp.getAddress(tgt))) xr.println(Long.toHexString(tgt) + " <- " + r.getFromAddress());
        }
        xr.close();
        long n = 0;
        for (Instruction i : l.getInstructions(true)) { if (i.getAddress().getOffset() >= 0x20000) break; lst.println(i.getAddress() + "  " + i.toString()); n++; }
        lst.close();
        println("instructions: " + n);
        DecompInterface di = new DecompInterface();
        di.openProgram(currentProgram);
        PrintWriter dec = new PrintWriter(new File(out, "flat_decompiled.c"));
        int fn = 0;
        for (Function f : currentProgram.getFunctionManager().getFunctions(true)) {
            DecompileResults r = di.decompileFunction(f, 30, monitor);
            dec.println("// ==== " + f.getName() + " @ " + f.getEntryPoint());
            if (r.decompileCompleted()) dec.println(r.getDecompiledFunction().getC()); else dec.println("// decompile failed");
            fn++;
        }
        dec.close();
        println("functions: " + fn);
    }
}
