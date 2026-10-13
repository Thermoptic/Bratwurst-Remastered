# Ghidra-körning (hunk 0)
Ghidra 12.1.4 + Temurin JDK 21 ligger **utanför projektet** i `E:\Games\Bratwurst_Decomp\_tools\` (nedladdade 2026-10-13 med användarens godkännande; officiella releaser från github.com/NationalSecurityAgency/ghidra och api.adoptium.net).
Ghidra saknar Amiga-Hunk-loader och exe:n är skadad (docs/13), så hunk 0 (filoffset 56, 81 432 byte) extraherades till en scratch-fil och importerades som rå binär: processor `68000:BE:32:MC68020`, bas 0x0.
Därför är absoluta adresser i listningen **hunk-relativa och orelokerade** (0x4a14 = variabel i hunk 0, 0x9300 m.fl. = andra hunks).
Kommando (Git Bash):
    export JAVA_HOME=.../jdk-21.0.12.1+1
    analyzeHeadless.bat <projdir> B0 -import hunk0.bin -loader BinaryLoader -loader-baseAddr 0x0 -processor "68000:BE:32:MC68020" -scriptPath tools/ghidra -postScript ExportAll.java <outdir> tools/ghidra/seeds.txt
Utdata: `analysis/ghidra/hunk0_listing.txt`, `hunk0_decompiled.c` (härlett ur originalet — privat, se docs/09).
