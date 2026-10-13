// ==== FUN_00000076 @ 00000076

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined4 FUN_00000076(void)

{
  undefined2 uVar1;
  int iVar2;
  undefined *puVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  undefined4 uVar6;
  undefined4 uVar7;
  undefined4 uVar8;
  uint uVar9;
  undefined4 uVar10;
  short sVar11;
  undefined2 *puVar12;
  
  (**(code **)(DAT_00000004 + -0x84))();
  DAT_00094014 = (**(code **)(DAT_00000004 + -0x228))();
  if (DAT_00094014 != 0) {
    DAT_00094024 = (**(code **)(DAT_00000004 + -0x228))();
    if (DAT_00094024 != 0) {
      (**(code **)(DAT_00000004 + -0x288))();
      DAT_0000094c = *(undefined4 *)(DAT_00094014 + 0x22);
      puVar12 = (undefined2 *)0x7936e;
      sVar11 = 0xf;
      uVar9 = 0x793bc;
      do {
        *puVar12 = (short)(uVar9 >> 0x10);
        puVar12 = puVar12 + 2;
        sVar11 = sVar11 + -1;
        uVar9 = uVar9 << 0x10 | uVar9 >> 0x10;
      } while (sVar11 != -1);
      FUN_00004790();
      iVar2 = DAT_00094014;
      if (_LAB_00004aa4 != 0) {
        (**(code **)(DAT_00094014 + -0xde))();
        (**(code **)(iVar2 + -0x10e))();
        (**(code **)(iVar2 + -0x10e))();
        DAT_000a0006 = 0x2800;
        FUN_00000976();
        DAT_000a000a = 0;
        DAT_000a000c = 0;
        DAT_000a000e = 0x140;
        DAT_000a0010 = 0x100;
        DAT_000a0016 = 0;
        DAT_000a0012 = 0;
        DAT_000a0014 = 0;
        DAT_000a0018 = 0;
        FUN_00000996();
        _DAT_00079342 = 0;
        DAT_000a0422 = _DAT_00dff01c;
        DAT_000a0424 = _DAT_00dff002;
        _DAT_00dff09a = 0x7fff;
        do {
        } while ((_DAT_00dff004 & 0x1ff00) != 0);
        _DAT_00dff096 = 0x83e0;
        _DAT_000793b2 = 0x93b8;
        _DAT_000793ae = 7;
        _DAT_00dff080 = &DAT_00079300;
        _DAT_00dff088 = 7;
        _DAT_0000744e = 0;
        _LAB_0000744a_2 = 0;
        FUN_0000346e();
        DAT_000a0586 = DAT_00bfe301;
        DAT_00bfe301 = 0;
        FUN_00004670();
        FUN_0000734c();
        _DAT_00dff09a = 0xc028;
        FUN_00013a34();
        _DAT_000793b2 = 0x93b8;
        _DAT_000793ae = 7;
        uRam000110a8 = 4;
        uRam000110aa = 1;
        uRam000110ac = 5;
        uRam000110ae = 5;
        _LAB_000110b0 = 1;
        _LAB_000110b0_2 = 0;
        FUN_00003414();
        _DAT_000a0494 = 0;
        _DAT_000a0496 = 1;
        _DAT_000a0498 = 0;
        _DAT_000a049a = 1;
LAB_0000027a:
        _LAB_0000744a_2 = 0;
        func_0x00008598();
        if (DAT_000110b9 != '\x02') {
          FUN_000053ba();
          DAT_000a0006 = 0x2800;
          FUN_00000976();
          DAT_000a000a = 0;
          DAT_000a000c = 0xfffc;
          DAT_000a000e = 0x140;
          DAT_000a0010 = 0x100;
          DAT_000a0016 = 0;
          DAT_000a0012 = 0xfff8;
          DAT_000a0014 = 0xfff8;
          DAT_000a0018 = 7;
          FUN_00000996();
          _DAT_00079342 = 3;
          _DAT_000793b2 = 0x93c8;
          _DAT_000793ae = 7;
          FUN_00003492();
          DAT_000a049c = &DAT_000a9000;
          DAT_000a04a0 = (undefined *)0xab800;
          DAT_000a04a4 = 0xae000;
          DAT_000a04a8 = 0xb0800;
          DAT_000a04ac = 0xb3000;
          DAT_000a04b0 = 0xb5800;
          DAT_000a04b4 = 0xb8000;
          DAT_000a04b8 = 0xba800;
          DAT_000a04bc = 0xbd000;
          DAT_000a04c0 = 0xbf800;
          DAT_000a04c4 = 0xc2000;
          DAT_000a04c8 = 0xc4800;
          DAT_000a04cc = 0xc7000;
          DAT_000a04d0 = 0xc9800;
          DAT_000a04d4 = 0xcc000;
          DAT_000a04ec = 0;
          DAT_000a04ee = 0;
          DAT_000a045c = 0;
          _DAT_000a045e = 0;
          _DAT_000a046a = 0;
          _DAT_000a0476 = 0;
          _DAT_000a0482 = 0;
          DAT_00002ece = 0xffffffff;
          DAT_00002ed2 = 0xffffffff;
          FUN_000036aa();
          FUN_00003f12();
          FUN_00004032();
          FUN_00004152();
          FUN_00004276();
          FUN_00002f8e();
          FUN_000037de();
          DAT_000a0426 = 0xffff;
          _DAT_000a042a = 0;
          do {
          } while (((ushort)(_DAT_00dff004 >> 8) & 0x1ff) != 0x118);
          DAT_00007440 = 1;
          DAT_00007442 = 0;
          DAT_00007446 = 0;
          _LAB_0000744a_2 = 1;
          while( true ) {
            FUN_00005ba4();
            uVar8 = DAT_000a04cc;
            uVar7 = DAT_000a04c4;
            uVar6 = DAT_000a04bc;
            uVar5 = DAT_000a04b4;
            uVar4 = DAT_000a04ac;
            uVar10 = DAT_000a04a4;
            puVar3 = DAT_000a049c;
            uVar1 = DAT_00007440;
            do {
            } while (((ushort)(_DAT_00dff004 >> 8) & 0x1ff) != 300);
            _DAT_00dff180 = 0;
            if (DAT_000a048e == 1) break;
            DAT_00007446 = DAT_00007446 + 1;
            DAT_00007440 = 0;
            DAT_000a04d8 = uVar1;
            DAT_000a049c = DAT_000a04a0;
            DAT_000a04a0 = puVar3;
            DAT_0007930e = SUB42(puVar3,0);
            DAT_0007930a = (undefined2)((uint)puVar3 >> 0x10);
            DAT_000a04a4 = DAT_000a04a8;
            DAT_000a04a8 = uVar10;
            _DAT_00079316 = (undefined2)uVar10;
            _DAT_00079312 = (undefined2)((uint)uVar10 >> 0x10);
            DAT_000a04ac = DAT_000a04b0;
            DAT_000a04b0 = uVar4;
            _DAT_0007931e = (undefined2)uVar4;
            _DAT_0007931a = (undefined2)((uint)uVar4 >> 0x10);
            DAT_000a04b4 = DAT_000a04b8;
            DAT_000a04b8 = uVar5;
            _DAT_00079326 = (undefined2)uVar5;
            _DAT_00079322 = (undefined2)((uint)uVar5 >> 0x10);
            DAT_000a04bc = DAT_000a04c0;
            DAT_000a04c0 = uVar6;
            _DAT_0007932e = (undefined2)uVar6;
            _DAT_0007932a = (undefined2)((uint)uVar6 >> 0x10);
            DAT_000a04c4 = DAT_000a04c8;
            DAT_000a04c8 = uVar7;
            _DAT_00079336 = (undefined2)uVar7;
            _DAT_00079332 = (undefined2)((uint)uVar7 >> 0x10);
            DAT_000a04cc = DAT_000a04d0;
            DAT_000a04d0 = uVar8;
            DAT_00079306 = (undefined2)uVar8;
            DAT_00079302 = (undefined2)((uint)uVar8 >> 0x10);
            FUN_000036cc();
            FUN_00005c66();
            FUN_00001382();
            FUN_00002ac4();
            if (_LAB_000110b0 != 0) {
              FUN_00002c50();
            }
            FUN_000037de();
            FUN_00001670();
            if (DAT_000a0490 != '\0') {
              FUN_000036ee();
              FUN_00006766();
              FUN_00003824();
              if (_LAB_000110b0_2 != 0) {
                FUN_00006802();
              }
            }
            if (DAT_000a0491 != '\0') {
              FUN_0000372a();
              func_0x00006880();
              FUN_00003890();
              if (_LAB_000110b0_2 != 0) {
                FUN_0000691c();
              }
            }
            if (DAT_000a0492 != '\0') {
              FUN_00003766();
              func_0x0000699a();
              FUN_000038fc();
              if (_LAB_000110b0_2 != 0) {
                FUN_00006a36();
              }
            }
            if (DAT_000a0493 != '\0') {
              FUN_000037a2();
              func_0x00006ab4();
              FUN_00003968();
              if (_LAB_000110b0_2 != 0) {
                FUN_00006b50();
              }
            }
            FUN_000036cc();
            FUN_0000610c();
            FUN_00005e7c();
            func_0x0000242c();
            if (DAT_000a0578 < 1) {
              FUN_00003f12();
            }
            if (DAT_000a057a < 1) {
              FUN_00004032();
            }
            if (DAT_000a057c < 1) {
              FUN_00004152();
            }
            if (DAT_000a057e < 1) {
              FUN_00004276();
            }
            if (DAT_00004750 == '\0') {
              _DAT_000a042a = 0;
            }
            else if (_DAT_000a042a == 0) {
              DAT_000a0426 = DAT_000a0426 << 0x10 | DAT_000a0426 >> 0x10;
              _DAT_000a042a = 1;
            }
            if (DAT_00004711 != '\0') {
              DAT_000a0578 = -1;
            }
            if (DAT_00004712 != '\0') {
              DAT_000a057a = -1;
            }
            if (DAT_00004713 != '\0') {
              DAT_000a057c = -1;
            }
            if (DAT_00004714 != '\0') {
              DAT_000a057e = -1;
            }
            if (DAT_00004755 != '\0') goto LAB_0000027a;
            FUN_00005474();
            FUN_0000548e();
            FUN_000054a8();
            FUN_000054c2();
          }
          FUN_000052b2();
          goto LAB_0000027a;
        }
        _DAT_00dff09a = 0x4028;
        FUN_00007368();
        FUN_000046b4();
        DAT_00bfe301 = DAT_000a0586;
        FUN_00003480();
        FUN_000008e2();
      }
      FUN_00004960();
      FUN_00000950();
      if (DAT_00007442 != 0) {
        _LAB_0000744a = (undefined2)((DAT_00007446 * 0x32) / DAT_00007442);
      }
      return 0;
    }
    (**(code **)(DAT_00000004 + -0x19e))();
  }
  uVar10 = (**(code **)(DAT_00000004 + -0x8a))();
  return uVar10;
}


// ==== FUN_000008e2 @ 000008e2

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_000008e2(void)

{
  do {
  } while ((DAT_00dff002 & 0x40) != 0);
  _DAT_00dff080 = *(undefined4 *)(DAT_00094014 + 0x26);
  _DAT_00dff084 = *(undefined4 *)(DAT_00094014 + 0x30);
  _DAT_00dff09a = DAT_000a0422 | 0x8000;
  _DAT_00dff096 = DAT_000a0424 | 0x8000;
  (**(code **)(DAT_00094014 + -0xde))();
  return;
}


// ==== FUN_00000950 @ 00000950

void FUN_00000950(void)

{
  (**(code **)(DAT_00000004 + -0x19e))();
  (**(code **)(DAT_00000004 + -0x19e))();
  (**(code **)(DAT_00000004 + -0x8a))();
  return;
}


// ==== FUN_00000976 @ 00000976

void FUN_00000976(void)

{
  int in_D1;
  short sVar1;
  undefined2 *puVar2;
  
  puVar2 = &DAT_00079302;
  sVar1 = 7;
  do {
    puVar2[2] = (short)in_D1;
    *puVar2 = (short)((uint)in_D1 >> 0x10);
    in_D1 = DAT_000a0006 + in_D1;
    puVar2 = puVar2 + 4;
    sVar1 = sVar1 + -1;
  } while (sVar1 != -1);
  return;
}


// ==== FUN_00000996 @ 00000996

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00000996(void)

{
  ushort uVar1;
  short sVar2;
  
  if (DAT_000a0018 == 6) {
    _DAT_0007934e = 0x200;
  }
  uVar1 = DAT_000a0018;
  if (DAT_000a0018 == 8) {
    uVar1 = 0x100;
  }
  uVar1 = uVar1 << 0xc | uVar1 >> 4;
  if (DAT_000a0016 != 0) {
    uVar1 = uVar1 | 0x8000;
    if ((short)DAT_000a0018 < 5) {
      _DAT_00079342 = 0;
    }
    else {
      _DAT_00079342 = 1;
    }
  }
  _DAT_00079346 = uVar1 | 0x200;
  _DAT_0007934a = 0;
  _DAT_00079356 = DAT_000a0012;
  _DAT_0007935a = DAT_000a0014;
  DAT_0007935f = (char)DAT_000a000a + -0x7f;
  DAT_0007935e = (char)(DAT_000a000c + 0x2c);
  sVar2 = DAT_000a000c + 0x2c + DAT_000a0010;
  if (0xff < sVar2) {
    sVar2 = sVar2 + -0x100;
  }
  DAT_00079362 = (char)sVar2;
  DAT_00079363 = DAT_0007935f + (char)DAT_000a000e;
  _DAT_00079366 = ((ushort)(DAT_000a000a + 0x81U) >> 1) - 8;
  _DAT_0007936a = ((DAT_000a000e >> 4) - 1) * 8 + _DAT_00079366;
  _DAT_000a001a = (uint)DAT_000a0010 * (uint)(ushort)(DAT_000a0012 + (DAT_000a000e >> 3));
  _DAT_000a001e = (uint)DAT_000a0010 * (uint)(ushort)(DAT_000a0014 + (DAT_000a000e >> 3));
  return;
}


// ==== FUN_00000aae @ 00000aae

undefined8 FUN_00000aae(void)

{
  uint in_D0;
  uint uVar1;
  undefined4 in_D1;
  short sVar2;
  
  sVar2 = (ushort)(in_D0 != 0) * (short)LZCOUNT(in_D0);
  uVar1 = in_D0 >> (*(ushort *)(sVar2 * 4 + 0xaca) & 0x3f);
  return CONCAT44(CONCAT22((short)(uVar1 >> 0x10),
                           *(undefined2 *)(*(short *)(sVar2 * 4 + 0xacc) + 0xace + (short)uVar1 * 2)
                          ),in_D1);
}


// ==== FUN_00001382 @ 00001382

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00001382(void)

{
  bool bVar1;
  short sVar2;
  undefined1 *puVar3;
  
  _LAB_00006872 = DAT_00006858;
  _LAB_00006876 = DAT_0000685c;
  _DAT_0000687a = DAT_00006868;
  _LAB_0000698c = DAT_00006972;
  _LAB_00006990 = DAT_00006976;
  _DAT_00006994 = DAT_00006982;
  _LAB_00006aa6 = DAT_00006a8c;
  _LAB_00006aaa = DAT_00006a90;
  _DAT_00006aae = DAT_00006a9c;
  _LAB_00006bc0 = DAT_00006ba6;
  _LAB_00006bc4 = DAT_00006baa;
  _DAT_00006bc8 = DAT_00006bb6;
  _DAT_000016a2 = 0;
  if (DAT_000a0490 != '\0') {
    bVar1 = DAT_000a04f0 < DAT_000a04d8;
    DAT_000a04f0 = DAT_000a04f0 - DAT_000a04d8;
    if (bVar1) {
      DAT_000a04f0 = 0;
    }
    DAT_000a04da = DAT_000a04d8;
    puVar3 = &DAT_0000462a;
    do {
      LAB_0000466a = *puVar3;
      FUN_000016a4();
      sVar2 = DAT_000a04da + -1;
      bVar1 = 0 < DAT_000a04da;
      puVar3 = puVar3 + 1;
      DAT_000a04da = sVar2;
    } while (sVar2 != 0 && bVar1);
    if (_DAT_000016a2 == 0) {
      _DAT_000016a2 = 1;
      DAT_00006984 = DAT_0000686a;
      DAT_00006a9e = DAT_0000686a;
      DAT_00006bb8 = DAT_0000686a;
      DAT_00006986 = DAT_0000686c;
      DAT_00006988 = DAT_0000686e;
      DAT_00006aa0 = DAT_0000686c;
      DAT_00006aa2 = DAT_0000686e;
      DAT_00006bba = DAT_0000686c;
      DAT_00006bbc = DAT_0000686e;
    }
  }
  if (_DAT_000a0580 != 0) {
    DAT_00099642 = DAT_0009963e;
    DAT_0009963e = 0;
  }
  if (DAT_000a0491 != '\0') {
    bVar1 = DAT_000a04f2 < DAT_000a04d8;
    DAT_000a04f2 = DAT_000a04f2 - DAT_000a04d8;
    if (bVar1) {
      DAT_000a04f2 = 0;
    }
    DAT_000a04da = DAT_000a04d8;
    puVar3 = &DAT_0000463a;
    do {
      LAB_0000466a_1 = *puVar3;
      FUN_00001a08();
      sVar2 = DAT_000a04da + -1;
      bVar1 = 0 < DAT_000a04da;
      puVar3 = puVar3 + 1;
      DAT_000a04da = sVar2;
    } while (sVar2 != 0 && bVar1);
    if (_DAT_000016a2 == 0) {
      _DAT_000016a2 = 1;
      DAT_0000686a = DAT_00006984;
      DAT_00006a9e = DAT_00006984;
      DAT_00006bb8 = DAT_00006984;
      DAT_0000686c = DAT_00006986;
      DAT_0000686e = DAT_00006988;
      DAT_00006aa0 = DAT_00006986;
      DAT_00006aa2 = DAT_00006988;
      DAT_00006bba = DAT_00006986;
      DAT_00006bbc = DAT_00006988;
    }
  }
  if (DAT_000a0492 != '\0') {
    bVar1 = DAT_000a04f4 < DAT_000a04d8;
    DAT_000a04f4 = DAT_000a04f4 - DAT_000a04d8;
    if (bVar1) {
      DAT_000a04f4 = 0;
    }
    DAT_000a04da = DAT_000a04d8;
    puVar3 = &DAT_0000464a;
    do {
      LAB_0000466a_2 = *puVar3;
      FUN_00001d6c();
      sVar2 = DAT_000a04da + -1;
      bVar1 = 0 < DAT_000a04da;
      puVar3 = puVar3 + 1;
      DAT_000a04da = sVar2;
    } while (sVar2 != 0 && bVar1);
    if (_DAT_000016a2 == 0) {
      _DAT_000016a2 = 1;
      DAT_0000686a = DAT_00006a9e;
      DAT_00006984 = DAT_00006a9e;
      DAT_00006bb8 = DAT_00006a9e;
      DAT_0000686c = DAT_00006aa0;
      DAT_0000686e = DAT_00006aa2;
      DAT_00006986 = DAT_00006aa0;
      DAT_00006988 = DAT_00006aa2;
      DAT_00006bba = DAT_00006aa0;
      DAT_00006bbc = DAT_00006aa2;
    }
  }
  if (DAT_000a0493 != '\0') {
    bVar1 = DAT_000a04f6 < DAT_000a04d8;
    DAT_000a04f6 = DAT_000a04f6 - DAT_000a04d8;
    if (bVar1) {
      DAT_000a04f6 = 0;
    }
    DAT_000a04da = DAT_000a04d8;
    puVar3 = &DAT_0000465a;
    do {
      LAB_0000466a_3 = *puVar3;
      FUN_000020cc();
      sVar2 = DAT_000a04da + -1;
      bVar1 = 0 < DAT_000a04da;
      puVar3 = puVar3 + 1;
      DAT_000a04da = sVar2;
    } while (sVar2 != 0 && bVar1);
    if (_DAT_000016a2 == 0) {
      _DAT_000016a2 = 1;
      DAT_0000686a = DAT_00006bb8;
      DAT_00006984 = DAT_00006bb8;
      DAT_00006a9e = DAT_00006bb8;
      DAT_0000686c = DAT_00006bba;
      DAT_0000686e = DAT_00006bbc;
      DAT_00006986 = DAT_00006bba;
      DAT_00006988 = DAT_00006bbc;
      DAT_00006aa0 = DAT_00006bba;
      DAT_00006aa2 = DAT_00006bbc;
    }
  }
  if (_DAT_000a0580 != 0) {
    DAT_0009963e = DAT_00099642;
  }
  return;
}


// ==== FUN_00001670 @ 00001670

void FUN_00001670(void)

{
  if (DAT_000a0490 != '\0') {
    FUN_000018da();
  }
  if (DAT_000a0491 != '\0') {
    FUN_00001c3e();
  }
  if (DAT_000a0492 != '\0') {
    FUN_00001fa2();
  }
  if (DAT_000a0493 != '\0') {
    FUN_00002302();
  }
  return;
}


// ==== FUN_000016a4 @ 000016a4

void FUN_000016a4(void)

{
  int iVar1;
  ushort uVar2;
  short sVar3;
  undefined *puVar4;
  undefined *extraout_A0;
  undefined *extraout_A0_00;
  undefined *puVar5;
  undefined *extraout_A1;
  undefined *extraout_A1_00;
  undefined4 *puVar6;
  int *piVar7;
  undefined4 *puVar8;
  short *psVar9;
  bool bVar10;
  bool bVar11;
  
  bVar10 = (LAB_0000466a & 1) != 0;
  if (bVar10) {
    DAT_00006868 = DAT_00006868 - DAT_00001a06;
    DAT_00001a06 = DAT_000a0504 + DAT_00001a06;
  }
  bVar11 = (LAB_0000466a & 2) != 0;
  if (bVar11) {
    DAT_00006868 = DAT_00001a06 + DAT_00006868;
    DAT_00001a06 = DAT_000a0504 + DAT_00001a06;
  }
  DAT_00006868 = DAT_00006868 & 0xff;
  if (!bVar11 && !bVar10) {
    DAT_00001a06 = DAT_000a0500;
  }
  if (DAT_000a0502 < DAT_00001a06) {
    DAT_00001a06 = DAT_000a0502;
  }
  FUN_0000199c();
  bVar10 = SBORROW2(DAT_0000687c,1);
  DAT_0000687c = DAT_0000687c - 1;
  if (DAT_0000687c == 0 || bVar10 != (int)((uint)DAT_0000687c << 0x10) < 0) {
    DAT_0000687c = 0;
    puVar4 = &DAT_000a0022;
    puVar5 = &DAT_000a0222;
    if ((((LAB_0000466a & 4) != 0) && (DAT_000a04f0 < 1)) && (DAT_000a04ec < 600)) {
      puVar6 = (undefined4 *)(&DAT_00096828 + (short)(DAT_000a04ec << 4));
      puVar8 = &DAT_00095028;
      sVar3 = *(short *)(PTR_DAT_0009964a + 2);
      while (sVar3 = sVar3 + -1, sVar3 != -1) {
        if (DAT_000a043c == 0) goto LAB_000017d8;
        *puVar6 = *puVar8;
        psVar9 = (short *)(puVar8 + 2);
        puVar6[1] = puVar8[1];
        puVar8 = (undefined4 *)((int)puVar8 + 10);
        uVar2 = *psVar9 + DAT_00006868 & 0xff;
        iVar1 = ((int)*(short *)(&DAT_000a0222 + (short)uVar2 * 2) << (DAT_000a0506 & 0x3f)) +
                DAT_00006864;
        piVar7 = puVar6 + 3;
        puVar6[2] = DAT_00006860 -
                    ((int)*(short *)(&DAT_000a0022 + (short)uVar2 * 2) << (DAT_000a0506 & 0x3f));
        puVar6 = puVar6 + 4;
        *piVar7 = iVar1;
        DAT_000a04ec = DAT_000a04ec + 1;
        DAT_000a043c = DAT_000a043c + -1;
      }
      DAT_000a04f0 = DAT_000a0538;
      FUN_00005cf4();
      puVar4 = extraout_A0;
      puVar5 = extraout_A1;
    }
LAB_000017d8:
    bVar10 = SBORROW2(DAT_000a04f8,1);
    DAT_000a04f8 = DAT_000a04f8 - 1;
    if (((DAT_000a04f8 == 0 || bVar10 != (int)((uint)DAT_000a04f8 << 0x10) < 0) &&
        ((LAB_0000466a & 8) != 0)) && (DAT_000a0444 != 0)) {
      DAT_000a0444 = DAT_000a0444 + -1;
      DAT_000a04f8 = FUN_00006bce();
      puVar4 = extraout_A0_00;
      puVar5 = extraout_A1_00;
    }
    if ((LAB_0000466a & 0x10) != 0) {
      DAT_00006864 = ((int)*(short *)(puVar5 + (short)DAT_00006868 * 2) * (int)DAT_000a0530 >> 3) +
                     DAT_00006864;
      DAT_00006860 = DAT_00006860 -
                     ((int)*(short *)(puVar4 + (short)DAT_00006868 * 2) * (int)DAT_000a0530 >> 3);
    }
  }
  if (PTR_LAB_00002878_1_0000687e._0_2_ == 0) {
    DAT_00006860 = DAT_00006860 - ((int)(short)DAT_00006860 * (int)DAT_000a0528 >> 8);
    DAT_00006864 = (DAT_0009963e + DAT_00006864) -
                   ((int)(short)(DAT_0009963e + DAT_00006864) * (int)DAT_000a0528 >> 8);
    DAT_00006858 = DAT_00006860 + DAT_00006858;
    DAT_0000685c = DAT_00006864 + DAT_0000685c;
  }
  DAT_0000686a = (short)((uint)DAT_00006858 >> 8);
  DAT_0000686c = (short)((uint)DAT_0000685c >> 8);
  return;
}


// ==== FUN_000018da @ 000018da

void FUN_000018da(void)

{
  short sVar1;
  short sVar2;
  short sVar3;
  short sVar4;
  short sVar5;
  short *psVar6;
  short *psVar7;
  short *psVar8;
  
  psVar7 = *(short **)(PTR_DAT_0009964a + 6);
  psVar8 = &DAT_00094028;
  DAT_000a056a = DAT_000a055a;
  DAT_000a0568 = DAT_000a0558;
  DAT_000a055a = DAT_000a054a;
  DAT_000a0558 = DAT_000a0548;
  DAT_000a054a = 0;
  DAT_000a0548 = 0x7fff;
  sVar2 = *(short *)((int)&PTR_DAT_00099238 + DAT_00006868 * 2);
  sVar3 = *(short *)(&DAT_00099438 + DAT_00006868 * 2);
  sVar5 = *(short *)PTR_DAT_0009964a;
  while (sVar5 = sVar5 + -1, sVar5 != -1) {
    psVar6 = psVar7 + 1;
    sVar1 = *psVar7;
    psVar7 = psVar7 + 2;
    sVar1 = (short)((uint)((int)sVar1 * (int)DAT_000a04e8) >> 8) >> 8;
    sVar4 = (short)((uint)((int)*psVar6 * (int)DAT_000a04e8) >> 8) >> 8;
    psVar6 = psVar8 + 1;
    *psVar8 = (short)(sVar4 * sVar2 + sVar1 * sVar3) >> 8;
    sVar1 = (short)(sVar1 * sVar2 - sVar4 * sVar3) >> 8;
    psVar8 = psVar8 + 2;
    *psVar6 = sVar1;
    if (sVar1 < DAT_000a0548) {
      DAT_000a0548 = sVar1;
    }
    if (DAT_000a054a < sVar1) {
      DAT_000a054a = sVar1;
    }
  }
  return;
}


// ==== FUN_0000199c @ 0000199c

void FUN_0000199c(void)

{
  short sVar1;
  short sVar2;
  int iVar3;
  short sVar4;
  short *psVar5;
  short *psVar6;
  int *piVar7;
  int *piVar8;
  
  sVar1 = *(short *)((int)&PTR_DAT_00099238 + DAT_00006868 * 2);
  sVar2 = *(short *)(&DAT_00099438 + DAT_00006868 * 2);
  psVar6 = *(short **)(PTR_DAT_0009964a + 10);
  piVar7 = &DAT_00095028;
  sVar4 = *(short *)(PTR_DAT_0009964a + 2) + 1;
  while (sVar4 = sVar4 + -1, sVar4 != -1) {
    psVar5 = psVar6 + 2;
    iVar3 = DAT_0000685c + ((int)*psVar6 * (int)sVar1 - (int)psVar6[1] * (int)sVar2 >> 8) * 0x80;
    *piVar7 = DAT_00006858 + ((int)psVar6[1] * (int)sVar1 + (int)*psVar6 * (int)sVar2 >> 8) * 0x80;
    piVar8 = piVar7 + 2;
    piVar7[1] = iVar3;
    psVar6 = psVar6 + 3;
    piVar7 = (int *)((int)piVar7 + 10);
    *(short *)piVar8 = *psVar5;
  }
  return;
}


// ==== FUN_00001a08 @ 00001a08

void FUN_00001a08(void)

{
  int iVar1;
  ushort uVar2;
  short sVar3;
  undefined *puVar4;
  undefined *extraout_A0;
  undefined *extraout_A0_00;
  undefined *puVar5;
  undefined *extraout_A1;
  undefined *extraout_A1_00;
  undefined4 *puVar6;
  int *piVar7;
  undefined4 *puVar8;
  short *psVar9;
  bool bVar10;
  bool bVar11;
  
  bVar10 = (LAB_0000466a_1 & 1) != 0;
  if (bVar10) {
    DAT_00006982 = DAT_00006982 - DAT_00001d6a;
    DAT_00001d6a = DAT_000a050e + DAT_00001d6a;
  }
  bVar11 = (LAB_0000466a_1 & 2) != 0;
  if (bVar11) {
    DAT_00006982 = DAT_00001d6a + DAT_00006982;
    DAT_00001d6a = DAT_000a050e + DAT_00001d6a;
  }
  DAT_00006982 = DAT_00006982 & 0xff;
  if (!bVar11 && !bVar10) {
    DAT_00001d6a = DAT_000a050a;
  }
  if (DAT_000a050c < DAT_00001d6a) {
    DAT_00001d6a = DAT_000a050c;
  }
  FUN_00001d00();
  bVar10 = SBORROW2(DAT_00006996,1);
  DAT_00006996 = DAT_00006996 - 1;
  if (DAT_00006996 == 0 || bVar10 != (int)((uint)DAT_00006996 << 0x10) < 0) {
    DAT_00006996 = 0;
    puVar4 = &DAT_000a0022;
    puVar5 = &DAT_000a0222;
    if ((((LAB_0000466a_1 & 4) != 0) && (DAT_000a04f2 < 1)) && (DAT_000a04ec < 600)) {
      puVar6 = (undefined4 *)(&DAT_00096828 + (short)(DAT_000a04ec << 4));
      puVar8 = &DAT_00095328;
      sVar3 = *(short *)(PTR_DAT_0009964e + 2);
      while (sVar3 = sVar3 + -1, sVar3 != -1) {
        if (DAT_000a043e == 0) goto LAB_00001b3c;
        *puVar6 = *puVar8;
        psVar9 = (short *)(puVar8 + 2);
        puVar6[1] = puVar8[1];
        puVar8 = (undefined4 *)((int)puVar8 + 10);
        uVar2 = *psVar9 + DAT_00006982 & 0xff;
        iVar1 = ((int)*(short *)(&DAT_000a0222 + (short)uVar2 * 2) << (DAT_000a0510 & 0x3f)) +
                DAT_0000697e;
        piVar7 = puVar6 + 3;
        puVar6[2] = DAT_0000697a -
                    ((int)*(short *)(&DAT_000a0022 + (short)uVar2 * 2) << (DAT_000a0510 & 0x3f));
        puVar6 = puVar6 + 4;
        *piVar7 = iVar1;
        DAT_000a04ec = DAT_000a04ec + 1;
        DAT_000a043e = DAT_000a043e + -1;
      }
      DAT_000a04f2 = DAT_000a053a;
      FUN_00005cf4();
      puVar4 = extraout_A0;
      puVar5 = extraout_A1;
    }
LAB_00001b3c:
    bVar10 = SBORROW2(DAT_000a04fa,1);
    DAT_000a04fa = DAT_000a04fa - 1;
    if (((DAT_000a04fa == 0 || bVar10 != (int)((uint)DAT_000a04fa << 0x10) < 0) &&
        ((LAB_0000466a_1 & 8) != 0)) && (DAT_000a0446 != 0)) {
      DAT_000a0446 = DAT_000a0446 + -1;
      DAT_000a04fa = FUN_00006bce();
      puVar4 = extraout_A0_00;
      puVar5 = extraout_A1_00;
    }
    if ((LAB_0000466a_1 & 0x10) != 0) {
      DAT_0000697e = ((int)*(short *)(puVar5 + (short)DAT_00006982 * 2) * (int)DAT_000a0532 >> 3) +
                     DAT_0000697e;
      DAT_0000697a = DAT_0000697a -
                     ((int)*(short *)(puVar4 + (short)DAT_00006982 * 2) * (int)DAT_000a0532 >> 3);
    }
  }
  if (PTR_LAB_00002878_1_00006998._0_2_ == 0) {
    DAT_0000697a = DAT_0000697a - ((int)(short)DAT_0000697a * (int)DAT_000a052a >> 8);
    DAT_0000697e = (DAT_0009963e + DAT_0000697e) -
                   ((int)(short)(DAT_0009963e + DAT_0000697e) * (int)DAT_000a052a >> 8);
    DAT_00006972 = DAT_0000697a + DAT_00006972;
    DAT_00006976 = DAT_0000697e + DAT_00006976;
  }
  DAT_00006984 = (short)((uint)DAT_00006972 >> 8);
  DAT_00006986 = (short)((uint)DAT_00006976 >> 8);
  return;
}


// ==== FUN_00001c3e @ 00001c3e

void FUN_00001c3e(void)

{
  short sVar1;
  short sVar2;
  short sVar3;
  short sVar4;
  short sVar5;
  short *psVar6;
  short *psVar7;
  short *psVar8;
  
  psVar7 = *(short **)(PTR_DAT_0009964e + 6);
  psVar8 = &DAT_00094428;
  DAT_000a056e = DAT_000a055e;
  DAT_000a056c = DAT_000a055c;
  DAT_000a055e = DAT_000a054e;
  DAT_000a055c = DAT_000a054c;
  DAT_000a054e = 0;
  DAT_000a054c = 0x7fff;
  sVar2 = *(short *)((int)&PTR_DAT_00099238 + DAT_00006982 * 2);
  sVar3 = *(short *)(&DAT_00099438 + DAT_00006982 * 2);
  sVar5 = *(short *)PTR_DAT_0009964e;
  while (sVar5 = sVar5 + -1, sVar5 != -1) {
    psVar6 = psVar7 + 1;
    sVar1 = *psVar7;
    psVar7 = psVar7 + 2;
    sVar1 = (short)((uint)((int)sVar1 * (int)DAT_000a04e8) >> 8) >> 8;
    sVar4 = (short)((uint)((int)*psVar6 * (int)DAT_000a04e8) >> 8) >> 8;
    psVar6 = psVar8 + 1;
    *psVar8 = (short)(sVar4 * sVar2 + sVar1 * sVar3) >> 8;
    sVar1 = (short)(sVar1 * sVar2 - sVar4 * sVar3) >> 8;
    psVar8 = psVar8 + 2;
    *psVar6 = sVar1;
    if (sVar1 < DAT_000a054c) {
      DAT_000a054c = sVar1;
    }
    if (DAT_000a054e < sVar1) {
      DAT_000a054e = sVar1;
    }
  }
  return;
}


// ==== FUN_00001d00 @ 00001d00

void FUN_00001d00(void)

{
  short sVar1;
  short sVar2;
  int iVar3;
  short sVar4;
  short *psVar5;
  short *psVar6;
  int *piVar7;
  int *piVar8;
  
  sVar1 = *(short *)((int)&PTR_DAT_00099238 + DAT_00006982 * 2);
  sVar2 = *(short *)(&DAT_00099438 + DAT_00006982 * 2);
  psVar6 = *(short **)(PTR_DAT_0009964e + 10);
  piVar7 = &DAT_00095328;
  sVar4 = *(short *)(PTR_DAT_0009964e + 2) + 1;
  while (sVar4 = sVar4 + -1, sVar4 != -1) {
    psVar5 = psVar6 + 2;
    iVar3 = DAT_00006976 + ((int)*psVar6 * (int)sVar1 - (int)psVar6[1] * (int)sVar2 >> 8) * 0x80;
    *piVar7 = DAT_00006972 + ((int)psVar6[1] * (int)sVar1 + (int)*psVar6 * (int)sVar2 >> 8) * 0x80;
    piVar8 = piVar7 + 2;
    piVar7[1] = iVar3;
    psVar6 = psVar6 + 3;
    piVar7 = (int *)((int)piVar7 + 10);
    *(short *)piVar8 = *psVar5;
  }
  return;
}


// ==== FUN_00001d6c @ 00001d6c

void FUN_00001d6c(void)

{
  int iVar1;
  ushort uVar2;
  short sVar3;
  undefined *puVar4;
  undefined *extraout_A0;
  undefined *extraout_A0_00;
  undefined *puVar5;
  undefined *extraout_A1;
  undefined *extraout_A1_00;
  undefined4 *puVar6;
  int *piVar7;
  undefined4 *puVar8;
  short *psVar9;
  bool bVar10;
  bool bVar11;
  
  bVar10 = (LAB_0000466a_2 & 1) != 0;
  if (bVar10) {
    DAT_00006a9c = DAT_00006a9c - DAT_000020ca;
    DAT_000020ca = DAT_000a0518 + DAT_000020ca;
  }
  bVar11 = (LAB_0000466a_2 & 2) != 0;
  if (bVar11) {
    DAT_00006a9c = DAT_000020ca + DAT_00006a9c;
    DAT_000020ca = DAT_000a0518 + DAT_000020ca;
  }
  DAT_00006a9c = DAT_00006a9c & 0xff;
  if (!bVar11 && !bVar10) {
    DAT_000020ca = DAT_000a0514;
  }
  if (DAT_000a0516 < DAT_000020ca) {
    DAT_000020ca = DAT_000a0516;
  }
  FUN_00002060();
  bVar10 = SBORROW2(DAT_00006ab0,1);
  DAT_00006ab0 = DAT_00006ab0 - 1;
  if (DAT_00006ab0 == 0 || bVar10 != (int)((uint)DAT_00006ab0 << 0x10) < 0) {
    DAT_00006ab0 = 0;
    puVar4 = &DAT_000a0022;
    puVar5 = &DAT_000a0222;
    if ((((LAB_0000466a_2 & 4) != 0) && (DAT_000a04f4 < 1)) && (DAT_000a04ec < 600)) {
      puVar6 = (undefined4 *)(&DAT_00096828 + (short)(DAT_000a04ec << 4));
      puVar8 = &DAT_00095628;
      sVar3 = *(short *)(PTR_DAT_00099652 + 2);
      while (sVar3 = sVar3 + -1, sVar3 != -1) {
        if (DAT_000a0440 == 0) goto LAB_00001ea0;
        *puVar6 = *puVar8;
        psVar9 = (short *)(puVar8 + 2);
        puVar6[1] = puVar8[1];
        puVar8 = (undefined4 *)((int)puVar8 + 10);
        uVar2 = *psVar9 + DAT_00006a9c & 0xff;
        iVar1 = ((int)*(short *)(&DAT_000a0222 + (short)uVar2 * 2) << (DAT_000a051a & 0x3f)) +
                DAT_00006a98;
        piVar7 = puVar6 + 3;
        puVar6[2] = DAT_00006a94 -
                    ((int)*(short *)(&DAT_000a0022 + (short)uVar2 * 2) << (DAT_000a051a & 0x3f));
        puVar6 = puVar6 + 4;
        *piVar7 = iVar1;
        DAT_000a04ec = DAT_000a04ec + 1;
        DAT_000a0440 = DAT_000a0440 + -1;
      }
      DAT_000a04f4 = DAT_000a053c;
      FUN_00005cf4();
      puVar4 = extraout_A0;
      puVar5 = extraout_A1;
    }
LAB_00001ea0:
    bVar10 = SBORROW2(DAT_000a04fc,1);
    DAT_000a04fc = DAT_000a04fc - 1;
    if (((DAT_000a04fc == 0 || bVar10 != (int)((uint)DAT_000a04fc << 0x10) < 0) &&
        ((LAB_0000466a_2 & 8) != 0)) && (DAT_000a0448 != 0)) {
      DAT_000a0448 = DAT_000a0448 + -1;
      DAT_000a04fc = FUN_00006bce();
      puVar4 = extraout_A0_00;
      puVar5 = extraout_A1_00;
    }
    if ((LAB_0000466a_2 & 0x10) != 0) {
      DAT_00006a94 = DAT_00006a94 -
                     ((int)*(short *)(puVar4 + (short)DAT_00006a9c * 2) * (int)DAT_000a0534 >> 3);
      DAT_00006a98 = ((int)*(short *)(puVar5 + (short)DAT_00006a9c * 2) * (int)DAT_000a0534 >> 3) +
                     DAT_00006a98;
    }
  }
  if (PTR_LAB_00002878_1_00006ab2._0_2_ == 0) {
    DAT_00006a94 = DAT_00006a94 - ((int)(short)DAT_00006a94 * (int)DAT_000a052c >> 8);
    DAT_00006a98 = (DAT_0009963e + DAT_00006a98) -
                   ((int)(short)(DAT_0009963e + DAT_00006a98) * (int)DAT_000a052c >> 8);
    DAT_00006a8c = DAT_00006a94 + DAT_00006a8c;
    DAT_00006a90 = DAT_00006a98 + DAT_00006a90;
  }
  DAT_00006a9e = (short)((uint)DAT_00006a8c >> 8);
  DAT_00006aa0 = (short)((uint)DAT_00006a90 >> 8);
  return;
}


// ==== FUN_00001fa2 @ 00001fa2

void FUN_00001fa2(void)

{
  short sVar1;
  short sVar2;
  short sVar3;
  short sVar4;
  short sVar5;
  short *psVar6;
  short *psVar7;
  short *psVar8;
  
  psVar7 = *(short **)(PTR_DAT_00099652 + 6);
  psVar8 = &DAT_00094828;
  DAT_000a0572 = DAT_000a0562;
  DAT_000a0570 = DAT_000a0560;
  DAT_000a0562 = DAT_000a0552;
  DAT_000a0560 = DAT_000a0550;
  DAT_000a0552 = 0;
  DAT_000a0550 = 0x7fff;
  sVar2 = *(short *)((int)&PTR_DAT_00099238 + DAT_00006a9c * 2);
  sVar3 = *(short *)(&DAT_00099438 + DAT_00006a9c * 2);
  sVar5 = *(short *)PTR_DAT_00099652;
  while (sVar5 = sVar5 + -1, sVar5 != -1) {
    psVar6 = psVar7 + 1;
    sVar1 = *psVar7;
    psVar7 = psVar7 + 2;
    sVar1 = (short)((uint)((int)sVar1 * (int)DAT_000a04e8) >> 8) >> 8;
    sVar4 = (short)((uint)((int)*psVar6 * (int)DAT_000a04e8) >> 8) >> 8;
    psVar6 = psVar8 + 1;
    *psVar8 = (short)(sVar4 * sVar2 + sVar1 * sVar3) >> 8;
    sVar1 = (short)(sVar1 * sVar2 - sVar4 * sVar3) >> 8;
    psVar8 = psVar8 + 2;
    *psVar6 = sVar1;
    if (sVar1 < DAT_000a0550) {
      DAT_000a0550 = sVar1;
    }
    if (DAT_000a0552 < sVar1) {
      DAT_000a0552 = sVar1;
    }
  }
  return;
}


// ==== FUN_00002060 @ 00002060

void FUN_00002060(void)

{
  short sVar1;
  short sVar2;
  int iVar3;
  short sVar4;
  short *psVar5;
  short *psVar6;
  int *piVar7;
  int *piVar8;
  
  sVar1 = *(short *)((int)&PTR_DAT_00099238 + DAT_00006a9c * 2);
  sVar2 = *(short *)(&DAT_00099438 + DAT_00006a9c * 2);
  psVar6 = *(short **)(PTR_DAT_00099652 + 10);
  piVar7 = &DAT_00095628;
  sVar4 = *(short *)(PTR_DAT_00099652 + 2) + 1;
  while (sVar4 = sVar4 + -1, sVar4 != -1) {
    psVar5 = psVar6 + 2;
    iVar3 = DAT_00006a90 + ((int)*psVar6 * (int)sVar1 - (int)psVar6[1] * (int)sVar2 >> 8) * 0x80;
    *piVar7 = DAT_00006a8c + ((int)psVar6[1] * (int)sVar1 + (int)*psVar6 * (int)sVar2 >> 8) * 0x80;
    piVar8 = piVar7 + 2;
    piVar7[1] = iVar3;
    psVar6 = psVar6 + 3;
    piVar7 = (int *)((int)piVar7 + 10);
    *(short *)piVar8 = *psVar5;
  }
  return;
}


// ==== FUN_000020cc @ 000020cc

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_000020cc(void)

{
  int iVar1;
  ushort uVar2;
  short sVar3;
  undefined *puVar4;
  undefined *extraout_A0;
  undefined *extraout_A0_00;
  undefined *puVar5;
  undefined *extraout_A1;
  undefined *extraout_A1_00;
  undefined4 *puVar6;
  int *piVar7;
  undefined4 *puVar8;
  short *psVar9;
  bool bVar10;
  bool bVar11;
  
  bVar10 = (LAB_0000466a_3 & 1) != 0;
  if (bVar10) {
    DAT_00006bb6 = DAT_00006bb6 - PTR_LAB_00002c78_1_0000242a._0_2_;
    PTR_LAB_00002c78_1_0000242a._0_2_ = DAT_000a0522 + PTR_LAB_00002c78_1_0000242a._0_2_;
  }
  bVar11 = (LAB_0000466a_3 & 2) != 0;
  if (bVar11) {
    DAT_00006bb6 = PTR_LAB_00002c78_1_0000242a._0_2_ + DAT_00006bb6;
    PTR_LAB_00002c78_1_0000242a._0_2_ = DAT_000a0522 + PTR_LAB_00002c78_1_0000242a._0_2_;
  }
  DAT_00006bb6 = DAT_00006bb6 & 0xff;
  if (!bVar11 && !bVar10) {
    PTR_LAB_00002c78_1_0000242a._0_2_ = DAT_000a051e;
  }
  if (DAT_000a0520 < PTR_LAB_00002c78_1_0000242a._0_2_) {
    PTR_LAB_00002c78_1_0000242a._0_2_ = DAT_000a0520;
  }
  FUN_000023c0();
  bVar10 = SBORROW2(DAT_00006bca,1);
  DAT_00006bca = DAT_00006bca - 1;
  if (DAT_00006bca == 0 || bVar10 != (int)((uint)DAT_00006bca << 0x10) < 0) {
    DAT_00006bca = 0;
    puVar4 = &DAT_000a0022;
    puVar5 = &DAT_000a0222;
    if ((((LAB_0000466a_3 & 4) != 0) && (DAT_000a04f6 < 1)) && (DAT_000a04ec < 600)) {
      puVar6 = (undefined4 *)(&DAT_00096828 + (short)(DAT_000a04ec << 4));
      puVar8 = &DAT_00095928;
      sVar3 = *(short *)(PTR_DAT_00099656 + 2);
      while (sVar3 = sVar3 + -1, sVar3 != -1) {
        if (DAT_000a0442 == 0) goto LAB_00002200;
        *puVar6 = *puVar8;
        psVar9 = (short *)(puVar8 + 2);
        puVar6[1] = puVar8[1];
        puVar8 = (undefined4 *)((int)puVar8 + 10);
        uVar2 = *psVar9 + DAT_00006bb6 & 0xff;
        iVar1 = ((int)*(short *)(&DAT_000a0222 + (short)uVar2 * 2) << (DAT_000a0524 & 0x3f)) +
                DAT_00006bb2;
        piVar7 = puVar6 + 3;
        puVar6[2] = DAT_00006bae -
                    ((int)*(short *)(&DAT_000a0022 + (short)uVar2 * 2) << (DAT_000a0524 & 0x3f));
        puVar6 = puVar6 + 4;
        *piVar7 = iVar1;
        DAT_000a04ec = DAT_000a04ec + 1;
        DAT_000a0442 = DAT_000a0442 + -1;
      }
      DAT_000a04f6 = DAT_000a053e;
      FUN_00005cf4();
      puVar4 = extraout_A0;
      puVar5 = extraout_A1;
    }
LAB_00002200:
    bVar10 = SBORROW2(DAT_000a04fe,1);
    DAT_000a04fe = DAT_000a04fe - 1;
    if (((DAT_000a04fe == 0 || bVar10 != (int)((uint)DAT_000a04fe << 0x10) < 0) &&
        ((LAB_0000466a_3 & 8) != 0)) && (DAT_000a044a != 0)) {
      DAT_000a044a = DAT_000a044a + -1;
      DAT_000a04fe = FUN_00006bce();
      puVar4 = extraout_A0_00;
      puVar5 = extraout_A1_00;
    }
    if ((LAB_0000466a_3 & 0x10) != 0) {
      DAT_00006bae = DAT_00006bae -
                     ((int)*(short *)(puVar4 + (short)DAT_00006bb6 * 2) * (int)DAT_000a0536 >> 3);
      DAT_00006bb2 = ((int)*(short *)(puVar5 + (short)DAT_00006bb6 * 2) * (int)DAT_000a0536 >> 3) +
                     DAT_00006bb2;
    }
  }
  if (_DAT_00006bcc == 0) {
    DAT_00006bae = DAT_00006bae - ((int)(short)DAT_00006bae * (int)DAT_000a052e >> 8);
    DAT_00006bb2 = (DAT_0009963e + DAT_00006bb2) -
                   ((int)(short)(DAT_0009963e + DAT_00006bb2) * (int)DAT_000a052e >> 8);
    DAT_00006ba6 = DAT_00006bae + DAT_00006ba6;
    DAT_00006baa = DAT_00006bb2 + DAT_00006baa;
  }
  DAT_00006bb8 = (short)((uint)DAT_00006ba6 >> 8);
  DAT_00006bba = (short)((uint)DAT_00006baa >> 8);
  return;
}


// ==== FUN_00002302 @ 00002302

void FUN_00002302(void)

{
  short sVar1;
  short sVar2;
  short sVar3;
  short sVar4;
  short sVar5;
  short *psVar6;
  short *psVar7;
  short *psVar8;
  
  psVar7 = *(short **)(PTR_DAT_00099656 + 6);
  psVar8 = &DAT_00094c28;
  DAT_000a0576 = DAT_000a0566;
  DAT_000a0574 = DAT_000a0564;
  DAT_000a0566 = DAT_000a0556;
  DAT_000a0564 = DAT_000a0554;
  DAT_000a0556 = 0;
  DAT_000a0554 = 0x7fff;
  sVar2 = *(short *)((int)&PTR_DAT_00099238 + DAT_00006bb6 * 2);
  sVar3 = *(short *)(&DAT_00099438 + DAT_00006bb6 * 2);
  sVar5 = *(short *)PTR_DAT_00099656;
  while (sVar5 = sVar5 + -1, sVar5 != -1) {
    psVar6 = psVar7 + 1;
    sVar1 = *psVar7;
    psVar7 = psVar7 + 2;
    sVar1 = (short)((uint)((int)sVar1 * (int)DAT_000a04e8) >> 8) >> 8;
    sVar4 = (short)((uint)((int)*psVar6 * (int)DAT_000a04e8) >> 8) >> 8;
    psVar6 = psVar8 + 1;
    *psVar8 = (short)(sVar4 * sVar2 + sVar1 * sVar3) >> 8;
    sVar1 = (short)(sVar1 * sVar2 - sVar4 * sVar3) >> 8;
    psVar8 = psVar8 + 2;
    *psVar6 = sVar1;
    if (sVar1 < DAT_000a0554) {
      DAT_000a0554 = sVar1;
    }
    if (DAT_000a0556 < sVar1) {
      DAT_000a0556 = sVar1;
    }
  }
  return;
}


// ==== FUN_000023c0 @ 000023c0

void FUN_000023c0(void)

{
  short sVar1;
  short sVar2;
  int iVar3;
  short sVar4;
  short *psVar5;
  short *psVar6;
  int *piVar7;
  int *piVar8;
  
  sVar1 = *(short *)((int)&PTR_DAT_00099238 + DAT_00006bb6 * 2);
  sVar2 = *(short *)(&DAT_00099438 + DAT_00006bb6 * 2);
  psVar6 = *(short **)(PTR_DAT_00099656 + 10);
  piVar7 = &DAT_00095928;
  sVar4 = *(short *)(PTR_DAT_00099656 + 2) + 1;
  while (sVar4 = sVar4 + -1, sVar4 != -1) {
    psVar5 = psVar6 + 2;
    iVar3 = DAT_00006baa + ((int)*psVar6 * (int)sVar1 - (int)psVar6[1] * (int)sVar2 >> 8) * 0x80;
    *piVar7 = DAT_00006ba6 + ((int)psVar6[1] * (int)sVar1 + (int)*psVar6 * (int)sVar2 >> 8) * 0x80;
    piVar8 = piVar7 + 2;
    piVar7[1] = iVar3;
    psVar6 = psVar6 + 3;
    piVar7 = (int *)((int)piVar7 + 10);
    *(short *)piVar8 = *psVar5;
  }
  return;
}


// ==== FUN_000024d8 @ 000024d8

void FUN_000024d8(void)

{
  byte bVar1;
  short sVar2;
  short sVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  short extraout_D1w;
  short extraout_D1w_00;
  short extraout_D1w_01;
  short sVar7;
  short sVar8;
  short *psVar9;
  short *psVar10;
  short *extraout_A0;
  short *extraout_A0_00;
  short *extraout_A0_01;
  short *extraout_A0_02;
  int extraout_A1;
  int extraout_A1_00;
  int extraout_A1_01;
  int extraout_A1_02;
  int iVar11;
  
  iVar6 = DAT_000a04bc;
  iVar5 = DAT_000a04b4;
  iVar4 = DAT_000a04ac;
  sVar3 = DAT_00006870;
  sVar2 = DAT_0000686e;
  psVar9 = &DAT_00094028;
  sVar8 = *(short *)PTR_DAT_0009964a;
  do {
    iVar11 = DAT_000a049c;
  } while ((DAT_00dff002 & 0x40) != 0);
  while (sVar8 = sVar8 + -1, sVar8 != -1) {
    psVar10 = psVar9 + 1;
    sVar7 = *psVar9;
    psVar9 = psVar9 + 2;
    bVar1 = (byte)(sVar2 + sVar7) & 7 ^ 7;
    sVar7 = ((ushort)(sVar2 + sVar7) >> 3) + (sVar3 + *psVar10) * 0x28;
    if ((*(byte *)(iVar11 + sVar7) & '\x01' << bVar1) != 0) {
      FUN_00002728();
      sVar7 = extraout_D1w;
      psVar9 = extraout_A0;
      iVar11 = extraout_A1;
    }
    if ((*(byte *)(iVar4 + sVar7) & '\x01' << bVar1) != 0) {
      FUN_00002920();
      sVar7 = extraout_D1w_00;
      psVar9 = extraout_A0_00;
      iVar11 = extraout_A1_00;
    }
    if ((*(byte *)(iVar5 + sVar7) & '\x01' << bVar1) != 0) {
      FUN_00002964();
      sVar7 = extraout_D1w_01;
      psVar9 = extraout_A0_01;
      iVar11 = extraout_A1_01;
    }
    if ((*(byte *)(iVar6 + sVar7) & '\x01' << bVar1) != 0) {
      FUN_000029a8();
      psVar9 = extraout_A0_02;
      iVar11 = extraout_A1_02;
    }
  }
  return;
}


// ==== FUN_0000256c @ 0000256c

void FUN_0000256c(void)

{
  byte bVar1;
  short sVar2;
  short sVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  short extraout_D1w;
  short extraout_D1w_00;
  short extraout_D1w_01;
  short sVar7;
  short sVar8;
  short *psVar9;
  short *psVar10;
  short *extraout_A0;
  short *extraout_A0_00;
  short *extraout_A0_01;
  short *extraout_A0_02;
  int extraout_A1;
  int extraout_A1_00;
  int extraout_A1_01;
  int extraout_A1_02;
  int iVar11;
  
  iVar6 = DAT_000a04bc;
  iVar5 = DAT_000a04b4;
  iVar4 = DAT_000a04a4;
  sVar3 = DAT_0000698a;
  sVar2 = DAT_00006988;
  psVar9 = &DAT_00094428;
  sVar8 = *(short *)PTR_DAT_0009964e;
  do {
    iVar11 = DAT_000a049c;
  } while ((DAT_00dff002 & 0x40) != 0);
  while (sVar8 = sVar8 + -1, sVar8 != -1) {
    psVar10 = psVar9 + 1;
    sVar7 = *psVar9;
    psVar9 = psVar9 + 2;
    bVar1 = (byte)(sVar2 + sVar7) & 7 ^ 7;
    sVar7 = ((ushort)(sVar2 + sVar7) >> 3) + (sVar3 + *psVar10) * 0x28;
    if ((*(byte *)(iVar11 + sVar7) & '\x01' << bVar1) != 0) {
      FUN_000027a6();
      sVar7 = extraout_D1w;
      psVar9 = extraout_A0;
      iVar11 = extraout_A1;
    }
    if ((*(byte *)(iVar4 + sVar7) & '\x01' << bVar1) != 0) {
      FUN_00002920();
      sVar7 = extraout_D1w_00;
      psVar9 = extraout_A0_00;
      iVar11 = extraout_A1_00;
    }
    if ((*(byte *)(iVar5 + sVar7) & '\x01' << bVar1) != 0) {
      FUN_000029ec();
      sVar7 = extraout_D1w_01;
      psVar9 = extraout_A0_01;
      iVar11 = extraout_A1_01;
    }
    if ((*(byte *)(iVar6 + sVar7) & '\x01' << bVar1) != 0) {
      FUN_00002a30();
      psVar9 = extraout_A0_02;
      iVar11 = extraout_A1_02;
    }
  }
  return;
}


// ==== FUN_00002600 @ 00002600

void FUN_00002600(void)

{
  byte bVar1;
  short sVar2;
  short sVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  short extraout_D1w;
  short extraout_D1w_00;
  short extraout_D1w_01;
  short sVar7;
  short sVar8;
  short *psVar9;
  short *psVar10;
  short *extraout_A0;
  short *extraout_A0_00;
  short *extraout_A0_01;
  short *extraout_A0_02;
  int extraout_A1;
  int extraout_A1_00;
  int extraout_A1_01;
  int extraout_A1_02;
  int iVar11;
  
  iVar6 = DAT_000a04bc;
  iVar5 = DAT_000a04ac;
  iVar4 = DAT_000a04a4;
  sVar3 = DAT_00006aa4;
  sVar2 = DAT_00006aa2;
  psVar9 = &DAT_00094828;
  sVar8 = *(short *)PTR_DAT_00099652;
  do {
    iVar11 = DAT_000a049c;
  } while ((DAT_00dff002 & 0x40) != 0);
  while (sVar8 = sVar8 + -1, sVar8 != -1) {
    psVar10 = psVar9 + 1;
    sVar7 = *psVar9;
    psVar9 = psVar9 + 2;
    bVar1 = (byte)(sVar2 + sVar7) & 7 ^ 7;
    sVar7 = ((ushort)(sVar2 + sVar7) >> 3) + (sVar3 + *psVar10) * 0x28;
    if ((*(byte *)(iVar11 + sVar7) & '\x01' << bVar1) != 0) {
      FUN_00002824();
      sVar7 = extraout_D1w;
      psVar9 = extraout_A0;
      iVar11 = extraout_A1;
    }
    if ((*(byte *)(iVar4 + sVar7) & '\x01' << bVar1) != 0) {
      FUN_00002964();
      sVar7 = extraout_D1w_00;
      psVar9 = extraout_A0_00;
      iVar11 = extraout_A1_00;
    }
    if ((*(byte *)(iVar5 + sVar7) & '\x01' << bVar1) != 0) {
      FUN_000029ec();
      sVar7 = extraout_D1w_01;
      psVar9 = extraout_A0_01;
      iVar11 = extraout_A1_01;
    }
    if ((*(byte *)(iVar6 + sVar7) & '\x01' << bVar1) != 0) {
      FUN_00002a74();
      psVar9 = extraout_A0_02;
      iVar11 = extraout_A1_02;
    }
  }
  return;
}


// ==== FUN_00002694 @ 00002694

void FUN_00002694(void)

{
  byte bVar1;
  short sVar2;
  short sVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  short extraout_D1w;
  short extraout_D1w_00;
  short extraout_D1w_01;
  short sVar7;
  short sVar8;
  short *psVar9;
  short *psVar10;
  short *extraout_A0;
  short *extraout_A0_00;
  short *extraout_A0_01;
  short *extraout_A0_02;
  int extraout_A1;
  int extraout_A1_00;
  int extraout_A1_01;
  int extraout_A1_02;
  int iVar11;
  
  iVar6 = DAT_000a04b4;
  iVar5 = DAT_000a04ac;
  iVar4 = DAT_000a04a4;
  sVar3 = DAT_00006bbe;
  sVar2 = DAT_00006bbc;
  psVar9 = &DAT_00094c28;
  sVar8 = *(short *)PTR_DAT_00099656;
  do {
    iVar11 = DAT_000a049c;
  } while ((DAT_00dff002 & 0x40) != 0);
  while (sVar8 = sVar8 + -1, sVar8 != -1) {
    psVar10 = psVar9 + 1;
    sVar7 = *psVar9;
    psVar9 = psVar9 + 2;
    bVar1 = (byte)(sVar2 + sVar7) & 7 ^ 7;
    sVar7 = ((ushort)(sVar2 + sVar7) >> 3) + (sVar3 + *psVar10) * 0x28;
    if ((*(byte *)(iVar11 + sVar7) & '\x01' << bVar1) != 0) {
      FUN_000028a2();
      sVar7 = extraout_D1w;
      psVar9 = extraout_A0;
      iVar11 = extraout_A1;
    }
    if ((*(byte *)(iVar4 + sVar7) & '\x01' << bVar1) != 0) {
      FUN_000029a8();
      sVar7 = extraout_D1w_00;
      psVar9 = extraout_A0_00;
      iVar11 = extraout_A1_00;
    }
    if ((*(byte *)(iVar5 + sVar7) & '\x01' << bVar1) != 0) {
      FUN_00002a30();
      sVar7 = extraout_D1w_01;
      psVar9 = extraout_A0_01;
      iVar11 = extraout_A1_01;
    }
    if ((*(byte *)(iVar6 + sVar7) & '\x01' << bVar1) != 0) {
      FUN_00002a74();
      psVar9 = extraout_A0_02;
      iVar11 = extraout_A1_02;
    }
  }
  return;
}


// ==== FUN_00002728 @ 00002728

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00002728(void)

{
  int iVar1;
  int iVar2;
  
  iVar1 = DAT_00006864;
  if (PTR_LAB_00002878_1_0000687e._0_2_ == 0) {
    DAT_00006858 = _LAB_00006872;
    DAT_0000685c = _LAB_00006876;
    DAT_00006868 = _DAT_0000687a;
    DAT_000a0578 = DAT_000a0578 -
                   (DAT_000a04d8 +
                   (short)((int)(short)DAT_00006864 * (int)(short)DAT_00006864 +
                           (int)(short)DAT_00006860 * (int)(short)DAT_00006860 >> 0x16));
    iVar2 = FUN_00005dc4();
    DAT_00006860 = -iVar2 >> 2;
    DAT_00006864 = -iVar1 >> 2;
    DAT_0000687c = 1;
    PTR_LAB_00002878_1_0000687e._0_2_ = 1;
  }
  return;
}


// ==== FUN_000027a6 @ 000027a6

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_000027a6(void)

{
  int iVar1;
  int iVar2;
  
  iVar1 = DAT_0000697e;
  if (PTR_LAB_00002878_1_00006998._0_2_ == 0) {
    DAT_00006972 = _LAB_0000698c;
    DAT_00006976 = _LAB_00006990;
    DAT_00006982 = _DAT_00006994;
    DAT_000a057a = DAT_000a057a -
                   (DAT_000a04d8 +
                   (short)((int)(short)DAT_0000697e * (int)(short)DAT_0000697e +
                           (int)(short)DAT_0000697a * (int)(short)DAT_0000697a >> 0x16));
    iVar2 = FUN_00005dc4();
    DAT_0000697a = -iVar2 >> 2;
    DAT_0000697e = -iVar1 >> 2;
    DAT_00006996 = 1;
    PTR_LAB_00002878_1_00006998._0_2_ = 1;
  }
  return;
}


// ==== FUN_00002824 @ 00002824

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00002824(void)

{
  int iVar1;
  int iVar2;
  
  iVar1 = DAT_00006a98;
  if (PTR_LAB_00002878_1_00006ab2._0_2_ == 0) {
    DAT_00006a8c = _LAB_00006aa6;
    DAT_00006a90 = _LAB_00006aaa;
    DAT_00006a9c = _DAT_00006aae;
    DAT_000a057c = DAT_000a057c -
                   (DAT_000a04d8 +
                   (short)((int)(short)DAT_00006a98 * (int)(short)DAT_00006a98 +
                           (int)(short)DAT_00006a94 * (int)(short)DAT_00006a94 >> 0x16));
    iVar2 = FUN_00005dc4();
    DAT_00006a94 = -iVar2 >> 2;
    DAT_00006a98 = -iVar1 >> 2;
    DAT_00006ab0 = 1;
    PTR_LAB_00002878_1_00006ab2._0_2_ = 1;
  }
  return;
}


// ==== FUN_000028a2 @ 000028a2

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_000028a2(void)

{
  int iVar1;
  int iVar2;
  
  iVar1 = DAT_00006bb2;
  if (_DAT_00006bcc == 0) {
    DAT_00006ba6 = _LAB_00006bc0;
    DAT_00006baa = _LAB_00006bc4;
    DAT_00006bb6 = _DAT_00006bc8;
    DAT_000a057e = DAT_000a057e -
                   (DAT_000a04d8 +
                   (short)((int)(short)DAT_00006bb2 * (int)(short)DAT_00006bb2 +
                           (int)(short)DAT_00006bae * (int)(short)DAT_00006bae >> 0x16));
    iVar2 = FUN_00005dc4();
    DAT_00006bae = -iVar2 >> 2;
    DAT_00006bb2 = -iVar1 >> 2;
    DAT_00006bca = 1;
    _DAT_00006bcc = 1;
  }
  return;
}


// ==== FUN_00002920 @ 00002920

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00002920(void)

{
  undefined4 uVar1;
  undefined4 uVar2;
  
  if (_LAB_00002ab8 < 1) {
    FUN_00005e14();
    uVar2 = DAT_00006864;
    uVar1 = DAT_00006860;
    _LAB_00002ab8 = 10;
    DAT_00006860 = DAT_0000697a;
    DAT_0000697a = uVar1;
    DAT_00006864 = DAT_0000697e;
    DAT_0000697e = uVar2;
  }
  return;
}


// ==== FUN_00002964 @ 00002964

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00002964(void)

{
  undefined4 uVar1;
  undefined4 uVar2;
  
  if (_LAB_00002ab8_2 < 1) {
    FUN_00005e14();
    uVar2 = DAT_00006864;
    uVar1 = DAT_00006860;
    _LAB_00002ab8_2 = 10;
    DAT_00006860 = DAT_00006a94;
    DAT_00006a94 = uVar1;
    DAT_00006864 = DAT_00006a98;
    DAT_00006a98 = uVar2;
  }
  return;
}


// ==== FUN_000029a8 @ 000029a8

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_000029a8(void)

{
  undefined4 uVar1;
  undefined4 uVar2;
  
  if (_LAB_00002abc < 1) {
    FUN_00005e14();
    uVar2 = DAT_00006864;
    uVar1 = DAT_00006860;
    _LAB_00002abc = 10;
    DAT_00006860 = DAT_00006bae;
    DAT_00006bae = uVar1;
    DAT_00006864 = DAT_00006bb2;
    DAT_00006bb2 = uVar2;
  }
  return;
}


// ==== FUN_000029ec @ 000029ec

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_000029ec(void)

{
  undefined4 uVar1;
  undefined4 uVar2;
  
  if (_LAB_00002abc_2 < 1) {
    FUN_00005e14();
    uVar2 = DAT_0000697e;
    uVar1 = DAT_0000697a;
    _LAB_00002abc_2 = 10;
    DAT_0000697a = DAT_00006a94;
    DAT_00006a94 = uVar1;
    DAT_0000697e = DAT_00006a98;
    DAT_00006a98 = uVar2;
  }
  return;
}


// ==== FUN_00002a30 @ 00002a30

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00002a30(void)

{
  undefined4 uVar1;
  undefined4 uVar2;
  
  if (_LAB_00002ac0 < 1) {
    FUN_00005e14();
    uVar2 = DAT_0000697e;
    uVar1 = DAT_0000697a;
    _LAB_00002ac0 = 10;
    DAT_0000697a = DAT_00006bae;
    DAT_00006bae = uVar1;
    DAT_0000697e = DAT_00006bb2;
    DAT_00006bb2 = uVar2;
  }
  return;
}


// ==== FUN_00002a74 @ 00002a74

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00002a74(void)

{
  undefined4 uVar1;
  undefined4 uVar2;
  
  if (_LAB_00002ac0_2 < 1) {
    FUN_00005e14();
    uVar2 = DAT_00006a98;
    uVar1 = DAT_00006a94;
    _LAB_00002ac0_2 = 10;
    DAT_00006a94 = DAT_00006bae;
    DAT_00006bae = uVar1;
    DAT_00006a98 = DAT_00006bb2;
    DAT_00006bb2 = uVar2;
  }
  return;
}


// ==== FUN_00002ac4 @ 00002ac4

undefined8 FUN_00002ac4(void)

{
  short sVar1;
  undefined2 uVar2;
  undefined4 in_D0;
  int iVar3;
  short sVar5;
  short sVar6;
  undefined4 uVar4;
  undefined4 in_D1;
  undefined4 uVar7;
  undefined4 unaff_D2;
  undefined4 unaff_D3;
  undefined4 unaff_D6;
  short sVar8;
  short sVar9;
  short *psVar10;
  short *psVar11;
  short *psVar12;
  short *psVar13;
  undefined4 unaff_A2;
  undefined2 *puVar14;
  undefined4 unaff_A5;
  undefined4 uVar15;
  
  DAT_00002c48 = DAT_0000686a;
  uVar2 = (short)((uint)in_D0 >> 0x10);
  if (DAT_0000686a <= DAT_00006984) {
    DAT_00002c48 = DAT_00006984;
    uVar2 = (short)((uint)in_D1 >> 0x10);
  }
  if (DAT_00002c48 <= DAT_00006a9e) {
    DAT_00002c48 = DAT_00006a9e;
    uVar2 = (short)((uint)unaff_D2 >> 0x10);
  }
  if (DAT_00002c48 <= DAT_00006bb8) {
    DAT_00002c48 = DAT_00006bb8;
    uVar2 = (short)((uint)unaff_D3 >> 0x10);
  }
  DAT_00002c4a = 0;
  DAT_000a04e8 = (short)(0x960000 / (ushort)(DAT_0009963c + DAT_00002c48));
  DAT_00002c4c = DAT_0000686c;
  if (DAT_0000686c <= DAT_00006986) {
    DAT_00002c4c = DAT_00006986;
    uVar2 = (short)(0x960000 % (uint)(ushort)(DAT_0009963c + DAT_00002c48));
  }
  if (DAT_00002c4c <= DAT_00006aa0) {
    DAT_00002c4c = DAT_00006aa0;
    uVar2 = 0;
  }
  if (DAT_00002c4c <= DAT_00006bba) {
    DAT_00002c4c = DAT_00006bba;
    uVar2 = 0;
  }
  DAT_00002c4e = 0;
  sVar9 = (short)(0x6c0000 / (ushort)(DAT_0009963c + DAT_00002c4c));
  if (sVar9 <= DAT_000a04e8) {
    DAT_000a04e8 = sVar9;
  }
  sVar9 = DAT_000a04e8;
  uVar7 = CONCAT22((short)(0x6c0000 % (uint)(ushort)(DAT_0009963c + DAT_00002c4c)),DAT_000a04e8);
  DAT_000a04dc = CONCAT22(uVar2,DAT_00002c48 >> 1);
  iVar3 = (int)(DAT_00002c48 >> 1) * (int)DAT_000a04e8;
  sVar5 = (short)(iVar3 >> 0xf);
  DAT_000a04e0 = CONCAT22((short)(char)((uint)iVar3 >> 0x18) >> 7,DAT_00002c4c >> 1);
  sVar6 = (short)((int)(DAT_00002c4c >> 1) * (int)DAT_000a04e8 >> 0xf);
  psVar10 = &DAT_00098f08;
  psVar12 = &DAT_00099128;
  sVar8 = 0x43;
  DAT_000a04e4 = sVar5;
  DAT_000a04e6 = sVar6;
  do {
    psVar11 = psVar10 + 1;
    psVar13 = psVar12 + 1;
    *psVar12 = ((short)((int)*psVar10 * (int)sVar9 >> 0xf) - sVar5) + 0xa0;
    psVar10 = psVar10 + 2;
    iVar3 = (int)*psVar11 * (int)sVar9;
    sVar1 = ((short)(iVar3 >> 0xf) - sVar6) + 0x76;
    uVar4 = CONCAT22((short)(char)((uint)iVar3 >> 0x18) >> 7,sVar1);
    psVar12 = psVar12 + 2;
    *psVar13 = sVar1;
    sVar8 = sVar8 + -1;
  } while (sVar8 != -1);
  uVar15 = 0xdff000;
  puVar14 = &DAT_00099128;
  psVar10 = &DAT_00099018;
  sVar9 = 0x43;
  do {
    psVar11 = psVar10 + 1;
    sVar5 = *psVar10;
    psVar10 = psVar10 + 2;
    sVar6 = *psVar11;
    uVar4 = CONCAT22((short)((uint)uVar4 >> 0x10),puVar14[sVar5 * 2]);
    uVar7 = CONCAT22((short)((uint)uVar7 >> 0x10),puVar14[sVar5 * 2 + 1]);
    FUN_000039d4(uVar4,uVar7,puVar14[sVar6 * 2],puVar14[sVar6 * 2 + 1],sVar5,sVar6,unaff_D6,sVar9,
                 DAT_000a049c,psVar12,unaff_A2,puVar14,psVar10,unaff_A5,uVar15);
    sVar9 = sVar9 + -1;
  } while (sVar9 != -1);
  return CONCAT44(uVar4,uVar7);
}


// ==== FUN_00002c50 @ 00002c50

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00002c50(void)

{
  ushort uVar2;
  undefined4 uVar1;
  ushort uVar3;
  ushort uVar5;
  undefined4 uVar4;
  int iVar6;
  uint uVar7;
  uint uVar8;
  uint unaff_D6;
  undefined4 unaff_D7;
  undefined4 *puVar9;
  undefined4 in_A1;
  undefined4 unaff_A2;
  undefined4 unaff_A3;
  undefined4 unaff_A4;
  undefined4 unaff_A5;
  undefined4 uVar10;
  
  DAT_00002eb2 = (int)(short)-((ushort)DAT_000a04dc & 0xff) * (int)DAT_000a04e8 >> 7;
  DAT_00002eb6 = (int)(short)-((ushort)DAT_000a04e0 & 0xff) * (int)DAT_000a04e8 >> 7;
  DAT_00002eca = DAT_000a04e8 * 0xff >> 7;
  if (DAT_000a04e8 < 0x1f41) {
    DAT_00002eca = 0xffffffff;
    _DAT_000793d2 = 0;
    _DAT_000793da = 0;
  }
  else {
    uVar5 = DAT_000a04e8 + 0xe0c0;
    uVar2 = (ushort)(((uint)uVar5 * 0xa3) / 10000);
    uVar3 = (ushort)(((uint)uVar5 * 5) / 10000);
    uVar5 = (ushort)(((uint)uVar5 * 0x87) / 10000);
    _DAT_000793d2 = uVar5 >> 4 | uVar3 & 0xf0 | (uVar2 & 0xf0) << 4;
    unaff_D6 = CONCAT22((short)(unaff_D6 >> 0x10),uVar5) & 0xffff000f;
    _DAT_000793da = uVar5 & 0xf | (uVar3 & 0xf) << 4 | (uVar2 & 0xf) << 8;
  }
  if (-1 < (int)DAT_00002ed2) {
    uVar10 = 0xdff000;
    uVar7 = (DAT_00002ec2 + 0xa000) - (0xa000 / DAT_00002ed2) * (DAT_00002ed2 & 0xffff);
    uVar1 = 0;
    uVar4 = 0xeb;
    uVar8 = DAT_00002ed2;
    do {
      if (-1 < (int)uVar7) {
        if (0x13fff < (int)uVar7) goto LAB_00002d78;
        FUN_00002ed6((int)uVar7 >> 8,uVar1,uVar7 >> 8 & 0xffff,uVar4,uVar7,uVar8,unaff_D6,unaff_D7,
                     DAT_000a04cc,in_A1,unaff_A2,unaff_A3,unaff_A4,unaff_A5,uVar10);
      }
      uVar7 = uVar8 + uVar7;
    } while( true );
  }
LAB_00002dd0:
  if ((int)DAT_00002eca < 0) {
    DAT_00002ec2 = DAT_00002eba;
    DAT_00002ec6 = DAT_00002ebe;
    DAT_00002eba = DAT_00002eb2;
    DAT_00002ebe = DAT_00002eb6;
    DAT_00002ed2 = DAT_00002ece;
    DAT_00002ece = DAT_00002eca;
    return;
  }
  uVar10 = 0xdff000;
  uVar7 = (DAT_00002eb2 + 0xa000) - (0xa000 / DAT_00002eca) * (DAT_00002eca & 0xffff);
  uVar1 = 0;
  uVar4 = 0xeb;
  uVar8 = DAT_00002eca;
  do {
    if (-1 < (int)uVar7) {
      if (0x13fff < (int)uVar7) {
        iVar6 = (DAT_00002eb6 + 0x7600) - (0x7600 / uVar8) * (uVar8 & 0xffff);
        do {
          DAT_00002ed2 = DAT_00002ece;
          DAT_00002ec6 = DAT_00002ebe;
          DAT_00002ec2 = DAT_00002eba;
          if (-1 < iVar6) {
            if (0xebff < iVar6) {
              DAT_00002eba = DAT_00002eb2;
              DAT_00002ebe = DAT_00002eb6;
              DAT_00002ece = DAT_00002eca;
              return;
            }
            puVar9 = (undefined4 *)((iVar6 >> 8 & 0xffffU) * 0x28 + DAT_000a04cc);
            *puVar9 = 0xffffffff;
            puVar9[1] = 0xffffffff;
            puVar9[2] = 0xffffffff;
            puVar9[3] = 0xffffffff;
            puVar9[4] = 0xffffffff;
            puVar9[5] = 0xffffffff;
            puVar9[6] = 0xffffffff;
            puVar9[7] = 0xffffffff;
            puVar9[8] = 0xffffffff;
            puVar9[9] = 0xffffffff;
          }
          iVar6 = uVar8 + iVar6;
        } while( true );
      }
      FUN_00002ed6((int)uVar7 >> 8,uVar1,uVar7 >> 8 & 0xffff,uVar4,uVar7,uVar8,unaff_D6,unaff_D7,
                   DAT_000a04cc,in_A1,unaff_A2,unaff_A3,unaff_A4,unaff_A5,uVar10);
    }
    uVar7 = uVar8 + uVar7;
  } while( true );
LAB_00002d78:
  do {
  } while ((DAT_00dff002 & 0x40) != 0);
  iVar6 = (DAT_00002ec6 + 0x7600) - (0x7600 / uVar8) * (uVar8 & 0xffff);
  do {
    if (-1 < iVar6) {
      if (0xebff < iVar6) goto LAB_00002dd0;
      puVar9 = (undefined4 *)((iVar6 >> 8 & 0xffffU) * 0x28 + DAT_000a04cc);
      *puVar9 = 0;
      puVar9[1] = 0;
      puVar9[2] = 0;
      puVar9[3] = 0;
      puVar9[4] = 0;
      puVar9[5] = 0;
      puVar9[6] = 0;
      puVar9[7] = 0;
      puVar9[8] = 0;
      puVar9[9] = 0;
    }
    iVar6 = uVar8 + iVar6;
  } while( true );
}


// ==== FUN_00002ed6 @ 00002ed6

void FUN_00002ed6(void)

{
  short in_D0w;
  short sVar1;
  short sVar2;
  short in_D1w;
  short sVar3;
  short unaff_D2w;
  ushort uVar4;
  short unaff_D3w;
  int in_A0;
  byte *pbVar5;
  int unaff_A6;
  
  if (unaff_D3w != in_D1w) {
    sVar3 = in_D1w;
    sVar1 = in_D0w;
    if (in_D1w < unaff_D3w) {
      sVar3 = unaff_D3w;
      unaff_D3w = in_D1w;
      sVar1 = unaff_D2w;
      unaff_D2w = in_D0w;
    }
    sVar1 = sVar1 - unaff_D2w;
    sVar3 = sVar3 - unaff_D3w;
    pbVar5 = (byte *)((int)(unaff_D2w >> 3) + unaff_D3w * 0x28 + in_A0);
    sVar2 = sVar3;
    if (sVar1 < 0) {
      sVar1 = -sVar1;
      if (sVar1 < sVar3) {
        uVar4 = 0x49;
        sVar3 = sVar1;
      }
      else {
        uVar4 = 0x55;
        sVar2 = sVar1;
      }
    }
    else if (sVar1 < sVar3) {
      uVar4 = 0x41;
      sVar3 = sVar1;
    }
    else {
      uVar4 = 0x51;
      sVar2 = sVar1;
    }
    sVar3 = sVar3 * 2;
    sVar1 = sVar3 - sVar2;
    if (sVar1 != 0 && sVar2 <= sVar3) {
      uVar4 = uVar4 & 0xffbf;
    }
    do {
    } while ((*(byte *)(unaff_A6 + 2) & 0x40) != 0);
    *pbVar5 = *pbVar5 ^ '\x01' << (((byte)unaff_D2w & 0xf ^ 0xf) & 7);
    *(uint *)(unaff_A6 + 0x40) = CONCAT22(unaff_D2w << 0xc,uVar4) | 0xb4a0002;
    *(undefined4 *)(unaff_A6 + 0x44) = 0xffffffff;
    *(byte **)(unaff_A6 + 0x48) = pbVar5;
    *(short *)(unaff_A6 + 0x52) = sVar1;
    *(byte **)(unaff_A6 + 0x54) = pbVar5;
    *(undefined2 *)(unaff_A6 + 0x60) = 0x28;
    *(short *)(unaff_A6 + 0x62) = sVar3;
    *(short *)(unaff_A6 + 100) = sVar1 - sVar2;
    *(undefined2 *)(unaff_A6 + 0x66) = 0x28;
    *(undefined4 *)(unaff_A6 + 0x72) = 0xffff8000;
    *(short *)(unaff_A6 + 0x58) = sVar2 * 0x40 + 0x42;
  }
  return;
}


// ==== FUN_00002f8e @ 00002f8e

undefined8 FUN_00002f8e(void)

{
  uint uVar1;
  short sVar3;
  undefined4 uVar2;
  uint uVar4;
  int iVar5;
  bool bVar6;
  undefined4 unaff_D6;
  short sVar7;
  short sVar8;
  short *psVar9;
  short *psVar10;
  short *psVar11;
  short *psVar12;
  undefined4 unaff_A2;
  undefined2 *puVar13;
  undefined4 unaff_A5;
  undefined4 uVar14;
  
  sVar8 = 0;
  bVar6 = true;
  sVar7 = 0x43;
  psVar9 = &DAT_00098f08;
  do {
    bVar6 = (bool)(bVar6 ^ 1);
    sVar3 = *psVar9;
    if (sVar3 < 0) {
      sVar3 = -sVar3;
    }
    if (sVar8 < sVar3) {
      sVar8 = sVar3;
    }
    sVar7 = sVar7 + -1;
    psVar9 = psVar9 + 1;
  } while (sVar7 != -1);
  if (bVar6) {
    uVar4 = 0x800000;
  }
  else {
    uVar4 = 0xa00000;
  }
  uVar1 = (uint)(ushort)(DAT_0009963c + sVar8 * 2);
  iVar5 = uVar4 % uVar1 << 0x10;
  sVar8 = (short)(uVar4 / uVar1);
  psVar9 = &DAT_00098f08;
  psVar11 = &DAT_00099128;
  sVar7 = 0x43;
  DAT_000a04ea = sVar8;
  do {
    psVar10 = psVar9 + 1;
    psVar12 = psVar11 + 1;
    *psVar11 = (short)((int)*psVar9 * (int)sVar8 >> 0xf) + 0xa0;
    psVar9 = psVar9 + 2;
    sVar3 = (short)((int)*psVar10 * (int)sVar8 >> 0xf) + 0x80;
    uVar2 = CONCAT22((short)(char)((uint)((int)*psVar10 * (int)sVar8) >> 0x18) >> 7,sVar3);
    psVar11 = psVar11 + 2;
    *psVar12 = sVar3;
    sVar7 = sVar7 + -1;
  } while (sVar7 != -1);
  uVar14 = 0xdff000;
  puVar13 = &DAT_00099128;
  psVar9 = &DAT_00099018;
  sVar8 = 0x43;
  do {
    psVar10 = psVar9 + 1;
    sVar7 = *psVar9;
    psVar9 = psVar9 + 2;
    sVar3 = *psVar10;
    uVar2 = CONCAT22((short)((uint)uVar2 >> 0x10),puVar13[sVar7 * 2]);
    iVar5 = CONCAT22((short)((uint)iVar5 >> 0x10),puVar13[sVar7 * 2 + 1]);
    FUN_0000308e(uVar2,iVar5,puVar13[sVar3 * 2],puVar13[sVar3 * 2 + 1],sVar7,sVar3,unaff_D6,sVar8,
                 DAT_000a04d4,psVar11,unaff_A2,puVar13,psVar9,unaff_A5,uVar14);
    sVar8 = sVar8 + -1;
  } while (sVar8 != -1);
  return CONCAT44(uVar2,iVar5);
}


// ==== FUN_0000308e @ 0000308e

void FUN_0000308e(void)

{
  short in_D0w;
  short in_D1w;
  short unaff_D2w;
  short unaff_D3w;
  
  if (unaff_D2w < in_D0w) {
    if (unaff_D3w < in_D1w) {
      while( true ) {
        while( true ) {
          while (unaff_D2w < 0) {
            if (in_D0w < 0) {
              return;
            }
            unaff_D3w = (short)(((uint)(ushort)(in_D1w - unaff_D3w) * (uint)(ushort)-unaff_D2w) /
                               (uint)(ushort)(-unaff_D2w + in_D0w)) + unaff_D3w;
            unaff_D2w = 0;
          }
          if (-1 < unaff_D3w) break;
          if (in_D1w < 0) {
            return;
          }
          unaff_D2w = (short)(((uint)(ushort)(in_D0w - unaff_D2w) * (uint)(ushort)-unaff_D3w) /
                             (uint)(ushort)(-unaff_D3w + in_D1w)) + unaff_D2w;
          unaff_D3w = 0;
        }
        if (in_D1w < 0x100) {
          if (in_D0w < 0x140) {
            FUN_0000335c();
            return;
          }
          if (unaff_D2w < 0x140) {
            FUN_0000335c();
            FUN_0000335c();
            return;
          }
          FUN_0000335c();
          return;
        }
        if (0xff < unaff_D3w) break;
        in_D0w = in_D0w - (short)(((uint)(ushort)(in_D0w - unaff_D2w) *
                                  (uint)(ushort)(in_D1w - 0xff)) /
                                 (uint)(ushort)(in_D1w - unaff_D3w));
        in_D1w = 0xff;
      }
    }
    else {
      while( true ) {
        while( true ) {
          while (unaff_D2w < 0) {
            if (in_D0w < 0) {
              return;
            }
            unaff_D3w = unaff_D3w -
                        (short)(((uint)(ushort)(unaff_D3w - in_D1w) * (uint)(ushort)-unaff_D2w) /
                               (uint)(ushort)(-unaff_D2w + in_D0w));
            unaff_D2w = 0;
          }
          if (-1 < in_D1w) break;
          if (unaff_D3w < 0) {
            return;
          }
          in_D0w = in_D0w - (short)(((uint)(ushort)(in_D0w - unaff_D2w) * (uint)(ushort)-in_D1w) /
                                   (uint)(ushort)(-in_D1w + unaff_D3w));
          in_D1w = 0;
        }
        if (unaff_D3w < 0x100) {
          if (in_D0w < 0x140) {
            FUN_0000335c();
            return;
          }
          if (unaff_D2w < 0x140) {
            FUN_0000335c();
            FUN_0000335c();
            return;
          }
          FUN_0000335c();
          return;
        }
        if (0xff < in_D1w) break;
        unaff_D2w = (short)(((uint)(ushort)(in_D0w - unaff_D2w) * (uint)(ushort)(unaff_D3w - 0xff))
                           / (uint)(ushort)(unaff_D3w - in_D1w)) + unaff_D2w;
        unaff_D3w = 0xff;
      }
    }
  }
  else if (unaff_D3w < in_D1w) {
    while( true ) {
      while( true ) {
        while (in_D0w < 0) {
          if (unaff_D2w < 0) {
            return;
          }
          in_D1w = in_D1w - (short)(((uint)(ushort)(in_D1w - unaff_D3w) * (uint)(ushort)-in_D0w) /
                                   (uint)(ushort)(-in_D0w + unaff_D2w));
          in_D0w = 0;
        }
        if (-1 < unaff_D3w) break;
        if (in_D1w < 0) {
          return;
        }
        unaff_D2w = unaff_D2w -
                    (short)(((uint)(ushort)(unaff_D2w - in_D0w) * (uint)(ushort)-unaff_D3w) /
                           (uint)(ushort)(-unaff_D3w + in_D1w));
        unaff_D3w = 0;
      }
      if (in_D1w < 0x100) {
        if (unaff_D2w < 0x140) {
          FUN_0000335c();
          return;
        }
        if (in_D0w < 0x140) {
          FUN_0000335c();
          FUN_0000335c();
          return;
        }
        FUN_0000335c();
        return;
      }
      if (0xff < unaff_D3w) break;
      in_D0w = (short)(((uint)(ushort)(unaff_D2w - in_D0w) * (uint)(ushort)(in_D1w - 0xff)) /
                      (uint)(ushort)(in_D1w - unaff_D3w)) + in_D0w;
      in_D1w = 0xff;
    }
  }
  else {
    while( true ) {
      while( true ) {
        while (in_D0w < 0) {
          if (unaff_D2w < 0) {
            return;
          }
          in_D1w = (short)(((uint)(ushort)(unaff_D3w - in_D1w) * (uint)(ushort)-in_D0w) /
                          (uint)(ushort)(-in_D0w + unaff_D2w)) + in_D1w;
          in_D0w = 0;
        }
        if (-1 < in_D1w) break;
        if (unaff_D3w < 0) {
          return;
        }
        in_D0w = (short)(((uint)(ushort)(unaff_D2w - in_D0w) * (uint)(ushort)-in_D1w) /
                        (uint)(ushort)(-in_D1w + unaff_D3w)) + in_D0w;
        in_D1w = 0;
      }
      if (unaff_D3w < 0x100) {
        if (unaff_D2w < 0x140) {
          FUN_0000335c();
          return;
        }
        if (in_D0w < 0x140) {
          FUN_0000335c();
          FUN_0000335c();
          return;
        }
        FUN_0000335c();
        return;
      }
      if (0xff < in_D1w) break;
      unaff_D2w = unaff_D2w -
                  (short)(((uint)(ushort)(unaff_D2w - in_D0w) * (uint)(ushort)(unaff_D3w - 0xff)) /
                         (uint)(ushort)(unaff_D3w - in_D1w));
      unaff_D3w = 0xff;
    }
  }
  return;
}


// ==== FUN_0000335c @ 0000335c

void FUN_0000335c(void)

{
  short in_D0w;
  short sVar1;
  short sVar2;
  short in_D1w;
  short sVar3;
  short unaff_D2w;
  ushort uVar4;
  short unaff_D3w;
  int in_A0;
  byte *pbVar5;
  int unaff_A6;
  
  if (unaff_D3w != in_D1w) {
    sVar3 = in_D1w;
    sVar1 = in_D0w;
    if (in_D1w < unaff_D3w) {
      sVar3 = unaff_D3w;
      unaff_D3w = in_D1w;
      sVar1 = unaff_D2w;
      unaff_D2w = in_D0w;
    }
    sVar1 = sVar1 - unaff_D2w;
    sVar3 = sVar3 - unaff_D3w;
    pbVar5 = (byte *)((int)(unaff_D2w >> 3) + unaff_D3w * 0x28 + in_A0);
    sVar2 = sVar3;
    if (sVar1 < 0) {
      sVar1 = -sVar1;
      if (sVar1 < sVar3) {
        uVar4 = 0x49;
        sVar3 = sVar1;
      }
      else {
        uVar4 = 0x55;
        sVar2 = sVar1;
      }
    }
    else if (sVar1 < sVar3) {
      uVar4 = 0x41;
      sVar3 = sVar1;
    }
    else {
      uVar4 = 0x51;
      sVar2 = sVar1;
    }
    sVar3 = sVar3 * 2;
    sVar1 = sVar3 - sVar2;
    if (sVar1 != 0 && sVar2 <= sVar3) {
      uVar4 = uVar4 & 0xffbf;
    }
    do {
    } while ((*(byte *)(unaff_A6 + 2) & 0x40) != 0);
    *pbVar5 = *pbVar5 ^ '\x01' << (((byte)unaff_D2w & 0xf ^ 0xf) & 7);
    *(uint *)(unaff_A6 + 0x40) = CONCAT22(unaff_D2w << 0xc,uVar4) | 0xb4a0002;
    *(undefined4 *)(unaff_A6 + 0x44) = 0xffffffff;
    *(byte **)(unaff_A6 + 0x48) = pbVar5;
    *(short *)(unaff_A6 + 0x52) = sVar1;
    *(byte **)(unaff_A6 + 0x54) = pbVar5;
    *(undefined2 *)(unaff_A6 + 0x60) = 0x28;
    *(short *)(unaff_A6 + 0x62) = sVar3;
    *(short *)(unaff_A6 + 100) = sVar1 - sVar2;
    *(undefined2 *)(unaff_A6 + 0x66) = 0x28;
    *(undefined4 *)(unaff_A6 + 0x72) = 0xffff8000;
    *(short *)(unaff_A6 + 0x58) = sVar2 * 0x40 + 0x42;
  }
  return;
}


// ==== FUN_00003414 @ 00003414

void FUN_00003414(void)

{
  short sVar1;
  short sVar2;
  undefined **ppuVar3;
  short *psVar4;
  undefined2 *puVar5;
  undefined2 *puVar6;
  
  sVar2 = 0xff;
  ppuVar3 = &PTR_DAT_00099238;
  psVar4 = (short *)&DAT_00099438;
  puVar5 = (undefined2 *)&DAT_000a0022;
  puVar6 = (undefined2 *)&DAT_000a0222;
  do {
    sVar1 = *psVar4;
    *puVar5 = (short)(*(short *)ppuVar3 * 0x14 >> 5);
    *puVar6 = (short)(sVar1 * 0x14 >> 5);
    sVar2 = sVar2 + -1;
    ppuVar3 = (undefined **)((int)ppuVar3 + 2);
    psVar4 = psVar4 + 1;
    puVar5 = puVar5 + 1;
    puVar6 = puVar6 + 1;
  } while (sVar2 != -1);
  DAT_0009963e = (int)((DAT_0009963e & 0xffff) * 0x14) >> 5;
  DAT_00099646 = (int)((DAT_00099646 & 0xffff) * 0x14) >> 5;
  return;
}


// ==== FUN_0000346e @ 0000346e

void FUN_0000346e(void)

{
  (**(code **)(DAT_00000004 + -0x288))();
  return;
}


// ==== FUN_00003480 @ 00003480

void FUN_00003480(void)

{
  (**(code **)(DAT_00000004 + -0x288))();
  return;
}


// ==== FUN_00003492 @ 00003492

void FUN_00003492(void)

{
  DAT_000a0454 = 0;
  DAT_000a0456 = 0;
  DAT_000a0458 = 0;
  DAT_000a045a = 0;
  DAT_000a044c = 6;
  DAT_000a044e = 6;
  DAT_000a0450 = 6;
  DAT_000a0452 = 6;
  DAT_000a0528 = *(undefined2 *)(PTR_DAT_0009964a + 0x12);
  DAT_000a052a = *(undefined2 *)(PTR_DAT_0009964e + 0x12);
  DAT_000a052c = *(undefined2 *)(PTR_DAT_00099652 + 0x12);
  DAT_000a052e = *(undefined2 *)(PTR_DAT_00099656 + 0x12);
  DAT_000a0530 = *(undefined2 *)(PTR_DAT_0009964a + 0x14);
  DAT_000a0532 = *(undefined2 *)(PTR_DAT_0009964e + 0x14);
  DAT_000a0534 = *(undefined2 *)(PTR_DAT_00099652 + 0x14);
  DAT_000a0536 = *(undefined2 *)(PTR_DAT_00099656 + 0x14);
  DAT_000a0538 = *(undefined2 *)(PTR_DAT_0009964a + 0x16);
  DAT_000a053a = *(undefined2 *)(PTR_DAT_0009964e + 0x16);
  DAT_000a053c = *(undefined2 *)(PTR_DAT_00099652 + 0x16);
  DAT_000a053e = *(undefined2 *)(PTR_DAT_00099656 + 0x16);
  DAT_000a0540 = *(undefined2 *)(PTR_DAT_0009964a + 0x18);
  DAT_000a0542 = *(undefined2 *)(PTR_DAT_0009964e + 0x18);
  DAT_000a0544 = *(undefined2 *)(PTR_DAT_00099652 + 0x18);
  DAT_000a0546 = *(undefined2 *)(PTR_DAT_00099656 + 0x18);
  DAT_000a0500 = *(undefined2 *)(PTR_DAT_0009964a + 0x1a);
  DAT_000a050a = *(undefined2 *)(PTR_DAT_0009964e + 0x1a);
  DAT_000a0514 = *(undefined2 *)(PTR_DAT_00099652 + 0x1a);
  DAT_000a051e = *(undefined2 *)(PTR_DAT_00099656 + 0x1a);
  DAT_000a0502 = *(undefined2 *)(PTR_DAT_0009964a + 0x1c);
  DAT_000a050c = *(undefined2 *)(PTR_DAT_0009964e + 0x1c);
  DAT_000a0516 = *(undefined2 *)(PTR_DAT_00099652 + 0x1c);
  DAT_000a0520 = *(undefined2 *)(PTR_DAT_00099656 + 0x1c);
  DAT_000a0504 = *(undefined2 *)(PTR_DAT_0009964a + 0x1e);
  DAT_000a050e = *(undefined2 *)(PTR_DAT_0009964e + 0x1e);
  DAT_000a0518 = *(undefined2 *)(PTR_DAT_00099652 + 0x1e);
  DAT_000a0522 = *(undefined2 *)(PTR_DAT_00099656 + 0x1e);
  DAT_000a0506 = *(undefined2 *)(PTR_DAT_0009964a + 0x20);
  DAT_000a0510 = *(undefined2 *)(PTR_DAT_0009964e + 0x20);
  DAT_000a051a = *(undefined2 *)(PTR_DAT_00099652 + 0x20);
  DAT_000a0524 = *(undefined2 *)(PTR_DAT_00099656 + 0x20);
  DAT_000a0508 = *(undefined2 *)(PTR_DAT_0009964a + 0x22);
  DAT_000a0512 = *(undefined2 *)(PTR_DAT_0009964e + 0x22);
  DAT_000a051c = *(undefined2 *)(PTR_DAT_00099652 + 0x22);
  DAT_000a0526 = *(undefined2 *)(PTR_DAT_00099656 + 0x22);
  DAT_00099638 = PTR_DAT_0009964a[0x25];
  DAT_00099639 = PTR_DAT_0009964e[0x25];
  DAT_0009963a = PTR_DAT_00099652[0x25];
  DAT_0009963b = PTR_DAT_00099656[0x25];
  DAT_000a042c = *(undefined2 *)(PTR_DAT_0009964a + 0x26);
  DAT_000a042e = *(undefined2 *)(PTR_DAT_0009964e + 0x26);
  DAT_000a0430 = *(undefined2 *)(PTR_DAT_00099652 + 0x26);
  DAT_000a0432 = *(undefined2 *)(PTR_DAT_00099656 + 0x26);
  DAT_000a0434 = (short)(((uint)*(ushort *)(PTR_DAT_0009964a + 0x28) *
                         (uint)*(ushort *)
                                (s_NOTHING_MISSILE_GUIDED_MISSILE_T_00099828 +
                                *(short *)(PTR_DAT_0009964a + 0x24) * 4 + 0x6c)) /
                        (uint)*(ushort *)(&DAT_00099896 + *(short *)(PTR_DAT_0009964a + 0x24) * 4));
  DAT_000a0436 = (short)(((uint)*(ushort *)(PTR_DAT_0009964e + 0x28) *
                         (uint)*(ushort *)
                                (s_NOTHING_MISSILE_GUIDED_MISSILE_T_00099828 +
                                *(short *)(PTR_DAT_0009964e + 0x24) * 4 + 0x6c)) /
                        (uint)*(ushort *)(&DAT_00099896 + *(short *)(PTR_DAT_0009964e + 0x24) * 4));
  DAT_000a0438 = (short)(((uint)*(ushort *)(PTR_DAT_00099652 + 0x28) *
                         (uint)*(ushort *)
                                (s_NOTHING_MISSILE_GUIDED_MISSILE_T_00099828 +
                                *(short *)(PTR_DAT_00099652 + 0x24) * 4 + 0x6c)) /
                        (uint)*(ushort *)(&DAT_00099896 + *(short *)(PTR_DAT_00099652 + 0x24) * 4));
  DAT_000a043a = (short)(((uint)*(ushort *)(PTR_DAT_00099656 + 0x28) *
                         (uint)*(ushort *)
                                (s_NOTHING_MISSILE_GUIDED_MISSILE_T_00099828 +
                                *(short *)(PTR_DAT_00099656 + 0x24) * 4 + 0x6c)) /
                        (uint)*(ushort *)(&DAT_00099896 + *(short *)(PTR_DAT_00099656 + 0x24) * 4));
  return;
}


// ==== FUN_000036aa @ 000036aa

void FUN_000036aa(void)

{
  short unaff_D7w;
  short sVar1;
  undefined4 *in_A0;
  undefined4 *puVar2;
  
  sVar1 = unaff_D7w * 0x100;
  while (sVar1 = sVar1 + -1, sVar1 != -1) {
    *in_A0 = 0;
    in_A0[1] = 0;
    in_A0[2] = 0;
    in_A0[3] = 0;
    in_A0[4] = 0;
    in_A0[5] = 0;
    in_A0[6] = 0;
    in_A0[7] = 0;
    puVar2 = in_A0 + 9;
    in_A0[8] = 0;
    in_A0 = in_A0 + 10;
    *puVar2 = 0;
  }
  return;
}


// ==== FUN_000036cc @ 000036cc

void FUN_000036cc(void)

{
  undefined4 *in_D0;
  short sVar1;
  undefined4 *puVar2;
  
  sVar1 = 0xeb;
  do {
    *in_D0 = 0;
    in_D0[1] = 0;
    in_D0[2] = 0;
    in_D0[3] = 0;
    in_D0[4] = 0;
    in_D0[5] = 0;
    in_D0[6] = 0;
    in_D0[7] = 0;
    puVar2 = in_D0 + 9;
    in_D0[8] = 0;
    in_D0 = in_D0 + 10;
    *puVar2 = 0;
    sVar1 = sVar1 + -1;
  } while (sVar1 != -1);
  return;
}


// ==== FUN_000036ee @ 000036ee

void FUN_000036ee(void)

{
  short sVar1;
  undefined4 *puVar2;
  undefined4 *puVar3;
  
  sVar1 = DAT_000a056a - DAT_000a0568;
  puVar2 = (undefined4 *)((uint)DAT_000a0568 * 0x28 + DAT_000a04a4);
  while (sVar1 = sVar1 + -1, sVar1 != -1) {
    *puVar2 = 0;
    puVar2[1] = 0;
    puVar2[2] = 0;
    puVar2[3] = 0;
    puVar2[4] = 0;
    puVar2[5] = 0;
    puVar2[6] = 0;
    puVar2[7] = 0;
    puVar3 = puVar2 + 9;
    puVar2[8] = 0;
    puVar2 = puVar2 + 10;
    *puVar3 = 0;
  }
  return;
}


// ==== FUN_0000372a @ 0000372a

void FUN_0000372a(void)

{
  short sVar1;
  undefined4 *puVar2;
  undefined4 *puVar3;
  
  sVar1 = DAT_000a056e - DAT_000a056c;
  puVar2 = (undefined4 *)((uint)DAT_000a056c * 0x28 + DAT_000a04ac);
  while (sVar1 = sVar1 + -1, sVar1 != -1) {
    *puVar2 = 0;
    puVar2[1] = 0;
    puVar2[2] = 0;
    puVar2[3] = 0;
    puVar2[4] = 0;
    puVar2[5] = 0;
    puVar2[6] = 0;
    puVar2[7] = 0;
    puVar3 = puVar2 + 9;
    puVar2[8] = 0;
    puVar2 = puVar2 + 10;
    *puVar3 = 0;
  }
  return;
}


// ==== FUN_00003766 @ 00003766

void FUN_00003766(void)

{
  short sVar1;
  undefined4 *puVar2;
  undefined4 *puVar3;
  
  sVar1 = DAT_000a0572 - DAT_000a0570;
  puVar2 = (undefined4 *)((uint)DAT_000a0570 * 0x28 + DAT_000a04b4);
  while (sVar1 = sVar1 + -1, sVar1 != -1) {
    *puVar2 = 0;
    puVar2[1] = 0;
    puVar2[2] = 0;
    puVar2[3] = 0;
    puVar2[4] = 0;
    puVar2[5] = 0;
    puVar2[6] = 0;
    puVar2[7] = 0;
    puVar3 = puVar2 + 9;
    puVar2[8] = 0;
    puVar2 = puVar2 + 10;
    *puVar3 = 0;
  }
  return;
}


// ==== FUN_000037a2 @ 000037a2

void FUN_000037a2(void)

{
  short sVar1;
  undefined4 *puVar2;
  undefined4 *puVar3;
  
  sVar1 = DAT_000a0576 - DAT_000a0574;
  puVar2 = (undefined4 *)((uint)DAT_000a0574 * 0x28 + DAT_000a04bc);
  while (sVar1 = sVar1 + -1, sVar1 != -1) {
    *puVar2 = 0;
    puVar2[1] = 0;
    puVar2[2] = 0;
    puVar2[3] = 0;
    puVar2[4] = 0;
    puVar2[5] = 0;
    puVar2[6] = 0;
    puVar2[7] = 0;
    puVar3 = puVar2 + 9;
    puVar2[8] = 0;
    puVar2 = puVar2 + 10;
    *puVar3 = 0;
  }
  return;
}


// ==== FUN_000037de @ 000037de

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_000037de(void)

{
  int in_D0;
  
  do {
  } while ((DAT_00dff002 & 0x40) != 0);
  _DAT_00dff044 = 0xffffffff;
  _DAT_00dff040 = 0x9f00012;
  _DAT_00dff064 = 0;
  _DAT_00dff054 = in_D0 + 0x24de;
  _DAT_00dff050 = in_D0 + 0x24de;
  _DAT_00dff058 = 0x3b14;
  return;
}


// ==== FUN_00003824 @ 00003824

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00003824(void)

{
  DAT_000a054a = DAT_000a054a + 1;
  _DAT_00dff054 = (uint)DAT_000a054a * 0x28 + DAT_000a04a4 + -2;
  do {
  } while ((DAT_00dff002 & 0x40) != 0);
  _DAT_00dff044 = 0xffffffff;
  _DAT_00dff040 = 0x9f0000a;
  _DAT_00dff064 = 0;
  _DAT_00dff050 = _DAT_00dff054;
  _DAT_00dff058 = (DAT_000a054a - DAT_000a0548) * 0x40 + 0x14;
  return;
}


// ==== FUN_00003890 @ 00003890

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00003890(void)

{
  DAT_000a054e = DAT_000a054e + 1;
  _DAT_00dff054 = (uint)DAT_000a054e * 0x28 + DAT_000a04ac + -2;
  do {
  } while ((DAT_00dff002 & 0x40) != 0);
  _DAT_00dff044 = 0xffffffff;
  _DAT_00dff040 = 0x9f0000a;
  _DAT_00dff064 = 0;
  _DAT_00dff050 = _DAT_00dff054;
  _DAT_00dff058 = (DAT_000a054e - DAT_000a054c) * 0x40 + 0x14;
  return;
}


// ==== FUN_000038fc @ 000038fc

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_000038fc(void)

{
  DAT_000a0552 = DAT_000a0552 + 1;
  _DAT_00dff054 = (uint)DAT_000a0552 * 0x28 + DAT_000a04b4 + -2;
  do {
  } while ((DAT_00dff002 & 0x40) != 0);
  _DAT_00dff044 = 0xffffffff;
  _DAT_00dff040 = 0x9f0000a;
  _DAT_00dff064 = 0;
  _DAT_00dff050 = _DAT_00dff054;
  _DAT_00dff058 = (DAT_000a0552 - DAT_000a0550) * 0x40 + 0x14;
  return;
}


// ==== FUN_00003968 @ 00003968

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00003968(void)

{
  DAT_000a0556 = DAT_000a0556 + 1;
  _DAT_00dff054 = (uint)DAT_000a0556 * 0x28 + DAT_000a04bc + -2;
  do {
  } while ((DAT_00dff002 & 0x40) != 0);
  _DAT_00dff044 = 0xffffffff;
  _DAT_00dff040 = 0x9f0000a;
  _DAT_00dff064 = 0;
  _DAT_00dff050 = _DAT_00dff054;
  _DAT_00dff058 = (DAT_000a0556 - DAT_000a0554) * 0x40 + 0x14;
  return;
}


// ==== FUN_000039d4 @ 000039d4

void FUN_000039d4(void)

{
  short in_D0w;
  short in_D1w;
  short unaff_D2w;
  short unaff_D3w;
  
  if (unaff_D2w < in_D0w) {
    if (unaff_D3w < in_D1w) {
      while( true ) {
        while( true ) {
          while (unaff_D2w < 0) {
            if (in_D0w < 0) {
              return;
            }
            unaff_D3w = (short)(((uint)(ushort)(in_D1w - unaff_D3w) * (uint)(ushort)-unaff_D2w) /
                               (uint)(ushort)(-unaff_D2w + in_D0w)) + unaff_D3w;
            unaff_D2w = 0;
          }
          if (-1 < unaff_D3w) break;
          if (in_D1w < 0) {
            return;
          }
          unaff_D2w = (short)(((uint)(ushort)(in_D0w - unaff_D2w) * (uint)(ushort)-unaff_D3w) /
                             (uint)(ushort)(-unaff_D3w + in_D1w)) + unaff_D2w;
          unaff_D3w = 0;
        }
        if (in_D1w < 0xec) {
          if (in_D0w < 0x140) {
            FUN_00003ca2();
            return;
          }
          if (unaff_D2w < 0x140) {
            FUN_00003ca2();
            FUN_00003ca2();
            return;
          }
          FUN_00003ca2();
          return;
        }
        if (0xeb < unaff_D3w) break;
        in_D0w = in_D0w - (short)(((uint)(ushort)(in_D0w - unaff_D2w) *
                                  (uint)(ushort)(in_D1w - 0xeb)) /
                                 (uint)(ushort)(in_D1w - unaff_D3w));
        in_D1w = 0xeb;
      }
    }
    else {
      while( true ) {
        while( true ) {
          while (unaff_D2w < 0) {
            if (in_D0w < 0) {
              return;
            }
            unaff_D3w = unaff_D3w -
                        (short)(((uint)(ushort)(unaff_D3w - in_D1w) * (uint)(ushort)-unaff_D2w) /
                               (uint)(ushort)(-unaff_D2w + in_D0w));
            unaff_D2w = 0;
          }
          if (-1 < in_D1w) break;
          if (unaff_D3w < 0) {
            return;
          }
          in_D0w = in_D0w - (short)(((uint)(ushort)(in_D0w - unaff_D2w) * (uint)(ushort)-in_D1w) /
                                   (uint)(ushort)(-in_D1w + unaff_D3w));
          in_D1w = 0;
        }
        if (unaff_D3w < 0xec) {
          if (in_D0w < 0x140) {
            FUN_00003ca2();
            return;
          }
          if (unaff_D2w < 0x140) {
            FUN_00003ca2();
            FUN_00003ca2();
            return;
          }
          FUN_00003ca2();
          return;
        }
        if (0xeb < in_D1w) break;
        unaff_D2w = (short)(((uint)(ushort)(in_D0w - unaff_D2w) * (uint)(ushort)(unaff_D3w - 0xeb))
                           / (uint)(ushort)(unaff_D3w - in_D1w)) + unaff_D2w;
        unaff_D3w = 0xeb;
      }
    }
  }
  else if (unaff_D3w < in_D1w) {
    while( true ) {
      while( true ) {
        while (in_D0w < 0) {
          if (unaff_D2w < 0) {
            return;
          }
          in_D1w = in_D1w - (short)(((uint)(ushort)(in_D1w - unaff_D3w) * (uint)(ushort)-in_D0w) /
                                   (uint)(ushort)(-in_D0w + unaff_D2w));
          in_D0w = 0;
        }
        if (-1 < unaff_D3w) break;
        if (in_D1w < 0) {
          return;
        }
        unaff_D2w = unaff_D2w -
                    (short)(((uint)(ushort)(unaff_D2w - in_D0w) * (uint)(ushort)-unaff_D3w) /
                           (uint)(ushort)(-unaff_D3w + in_D1w));
        unaff_D3w = 0;
      }
      if (in_D1w < 0xec) {
        if (unaff_D2w < 0x140) {
          FUN_00003ca2();
          return;
        }
        if (in_D0w < 0x140) {
          FUN_00003ca2();
          FUN_00003ca2();
          return;
        }
        FUN_00003ca2();
        return;
      }
      if (0xeb < unaff_D3w) break;
      in_D0w = (short)(((uint)(ushort)(unaff_D2w - in_D0w) * (uint)(ushort)(in_D1w - 0xeb)) /
                      (uint)(ushort)(in_D1w - unaff_D3w)) + in_D0w;
      in_D1w = 0xeb;
    }
  }
  else {
    while( true ) {
      while( true ) {
        while (in_D0w < 0) {
          if (unaff_D2w < 0) {
            return;
          }
          in_D1w = (short)(((uint)(ushort)(unaff_D3w - in_D1w) * (uint)(ushort)-in_D0w) /
                          (uint)(ushort)(-in_D0w + unaff_D2w)) + in_D1w;
          in_D0w = 0;
        }
        if (-1 < in_D1w) break;
        if (unaff_D3w < 0) {
          return;
        }
        in_D0w = (short)(((uint)(ushort)(unaff_D2w - in_D0w) * (uint)(ushort)-in_D1w) /
                        (uint)(ushort)(-in_D1w + unaff_D3w)) + in_D0w;
        in_D1w = 0;
      }
      if (unaff_D3w < 0xec) {
        if (unaff_D2w < 0x140) {
          FUN_00003ca2();
          return;
        }
        if (in_D0w < 0x140) {
          FUN_00003ca2();
          FUN_00003ca2();
          return;
        }
        FUN_00003ca2();
        return;
      }
      if (0xeb < in_D1w) break;
      unaff_D2w = unaff_D2w -
                  (short)(((uint)(ushort)(unaff_D2w - in_D0w) * (uint)(ushort)(unaff_D3w - 0xeb)) /
                         (uint)(ushort)(unaff_D3w - in_D1w));
      unaff_D3w = 0xeb;
    }
  }
  return;
}


// ==== FUN_00003ca2 @ 00003ca2

void FUN_00003ca2(void)

{
  short in_D0w;
  short sVar1;
  short sVar2;
  short in_D1w;
  short sVar3;
  short unaff_D2w;
  ushort uVar4;
  short unaff_D3w;
  int in_A0;
  byte *pbVar5;
  int unaff_A6;
  
  if (unaff_D3w != in_D1w) {
    sVar3 = in_D1w;
    sVar1 = in_D0w;
    if (in_D1w < unaff_D3w) {
      sVar3 = unaff_D3w;
      unaff_D3w = in_D1w;
      sVar1 = unaff_D2w;
      unaff_D2w = in_D0w;
    }
    sVar1 = sVar1 - unaff_D2w;
    sVar3 = sVar3 - unaff_D3w;
    pbVar5 = (byte *)((int)(unaff_D2w >> 3) + unaff_D3w * 0x28 + in_A0);
    sVar2 = sVar3;
    if (sVar1 < 0) {
      sVar1 = -sVar1;
      if (sVar1 < sVar3) {
        uVar4 = 0x49;
        sVar3 = sVar1;
      }
      else {
        uVar4 = 0x55;
        sVar2 = sVar1;
      }
    }
    else if (sVar1 < sVar3) {
      uVar4 = 0x41;
      sVar3 = sVar1;
    }
    else {
      uVar4 = 0x51;
      sVar2 = sVar1;
    }
    sVar3 = sVar3 * 2;
    sVar1 = sVar3 - sVar2;
    if (sVar1 != 0 && sVar2 <= sVar3) {
      uVar4 = uVar4 & 0xffbf;
    }
    do {
    } while ((*(byte *)(unaff_A6 + 2) & 0x40) != 0);
    *pbVar5 = *pbVar5 ^ '\x01' << (((byte)unaff_D2w & 0xf ^ 0xf) & 7);
    *(uint *)(unaff_A6 + 0x40) = CONCAT22(unaff_D2w << 0xc,uVar4) | 0xb4a0002;
    *(undefined4 *)(unaff_A6 + 0x44) = 0xffffffff;
    *(byte **)(unaff_A6 + 0x48) = pbVar5;
    *(short *)(unaff_A6 + 0x52) = sVar1;
    *(byte **)(unaff_A6 + 0x54) = pbVar5;
    *(undefined2 *)(unaff_A6 + 0x60) = 0x28;
    *(short *)(unaff_A6 + 0x62) = sVar3;
    *(short *)(unaff_A6 + 100) = sVar1 - sVar2;
    *(undefined2 *)(unaff_A6 + 0x66) = 0x28;
    *(undefined4 *)(unaff_A6 + 0x72) = 0xffff8000;
    *(short *)(unaff_A6 + 0x58) = sVar2 * 0x40 + 0x42;
  }
  return;
}


// ==== FUN_00003d5a @ 00003d5a

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined8 FUN_00003d5a(void)

{
  short sVar1;
  uint in_D0;
  uint in_D1;
  short unaff_D2w;
  short sVar2;
  short unaff_D3w;
  short sVar3;
  int in_A0;
  
  sVar3 = unaff_D2w - (short)in_D0;
  if (sVar3 < 0) {
    sVar3 = -sVar3;
    sVar1 = unaff_D3w - (short)in_D1;
    sVar2 = sVar3;
    if (sVar1 < 0) {
      if ((short)(sVar3 + sVar1) < 0) {
        _DAT_00dff042 = 0xd;
        sVar2 = -sVar1;
      }
      else {
        _DAT_00dff042 = 0x1d;
        sVar3 = -sVar1;
      }
    }
    else if ((short)(sVar3 - sVar1) < 0) {
      _DAT_00dff042 = 9;
      sVar2 = sVar1;
    }
    else {
      _DAT_00dff042 = 0x15;
      sVar3 = sVar1;
    }
  }
  else {
    sVar1 = unaff_D3w - (short)in_D1;
    sVar2 = sVar3;
    if (sVar1 < 0) {
      if ((short)(sVar3 + sVar1) < 0) {
        _DAT_00dff042 = 5;
        sVar2 = -sVar1;
      }
      else {
        _DAT_00dff042 = 0x19;
        sVar3 = -sVar1;
      }
    }
    else if ((short)(sVar3 - sVar1) < 0) {
      _DAT_00dff042 = 1;
      sVar2 = sVar1;
    }
    else {
      _DAT_00dff042 = 0x11;
      sVar3 = sVar1;
    }
  }
  _DAT_00dff048 = (int)(short)((short)(in_D0 >> 4) * 2) + (in_D1 & 0xffff) * 0x28 + in_A0;
  do {
  } while ((DAT_00dff002 & 0x40) != 0);
  _DAT_00dff062 = sVar3 * 4;
  sVar3 = sVar3 * 4 + sVar2 * -2;
  _DAT_00dff050 = (int)sVar3;
  if (sVar3 < 0) {
    _DAT_00dff042 = _DAT_00dff042 | 0x40;
  }
  _DAT_00dff040 = (ushort)((in_D0 << 0x1c) >> 0x10) | (ushort)(in_D0 >> 0x14) | 0xbfa;
  _DAT_00dff060 = 0x28;
  _DAT_00dff066 = 0x28;
  _DAT_00dff064 = sVar3 + sVar2 * -2;
  _DAT_00dff074 = 0x8000;
  _DAT_00dff044 = 0xffffffff;
  _DAT_00dff054 = _DAT_00dff048;
  _DAT_00dff058 = sVar2 * 0x40 + 0x42;
  return CONCAT44(in_D0,in_D1);
}


// ==== FUN_00003e44 @ 00003e44

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00003e44(void)

{
  ushort in_D0w;
  short sVar1;
  undefined4 *puVar2;
  
  _DAT_00dff048 = (undefined4 *)((int)&DAT_00025270 + (in_D0w >> 3 & 0xfffe));
  sVar1 = 0x11;
  puVar2 = _DAT_00dff048;
  do {
    *puVar2 = 0;
    puVar2[1] = 0;
    *(undefined2 *)(puVar2 + 2) = 0;
    puVar2[10] = 0;
    puVar2[0xb] = 0;
    *(undefined2 *)(puVar2 + 0xc) = 0;
    puVar2[0x14] = 0;
    puVar2[0x15] = 0;
    *(undefined2 *)(puVar2 + 0x16) = 0;
    puVar2[0x1e] = 0;
    puVar2[0x1f] = 0;
    *(undefined2 *)(puVar2 + 0x20) = 0;
    puVar2[0x28] = 0;
    puVar2[0x29] = 0;
    *(undefined2 *)(puVar2 + 0x2a) = 0;
    puVar2 = puVar2 + 0x32;
    sVar1 = sVar1 + -1;
  } while (sVar1 != -1);
  do {
  } while ((DAT_00dff002 & 0x40) != 0);
  _DAT_00dff050 = &DAT_000216ac;
  _DAT_00dff04c = &DAT_000216ac;
  _DAT_00dff054 = _DAT_00dff048;
  _DAT_00dff042 = in_D0w << 0xc;
  _DAT_00dff040 = in_D0w << 0xc | 0xfca;
  _DAT_00dff044 = 0xffffffff;
  _DAT_00dff064 = 0;
  _DAT_00dff062 = 0;
  _DAT_00dff060 = 0x1e;
  _DAT_00dff066 = 0x1e;
  _DAT_00dff058 = 0x1685;
  return;
}


// ==== FUN_00003f12 @ 00003f12

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00003f12(void)

{
  short sVar1;
  undefined4 uVar2;
  
  if (DAT_000a0490 != '\0') {
    sVar1 = DAT_000a044c + -1;
    if (sVar1 == 0 || DAT_000a044c < 1) {
      DAT_000a0568 = DAT_000a0548;
      DAT_000a056a = DAT_000a054a;
      DAT_000a044c = sVar1;
      FUN_000036ee();
      uVar2 = DAT_000a04a4;
      DAT_000a0568 = DAT_000a0558;
      DAT_000a056a = DAT_000a055a;
      DAT_000a04a4 = DAT_000a04a8;
      DAT_000a04a8 = uVar2;
      FUN_000036ee();
      DAT_000a0490 = '\0';
      DAT_000a048e = DAT_000a048e + -1;
      FUN_00003e44();
    }
    else {
      DAT_00006858 = 0xfffb6c20;
      _LAB_00006872 = 0xfffb6c20;
      DAT_0000686a = 0;
      DAT_0000686c = 0;
      DAT_0000685c = 0xfffbe150;
      _LAB_00006876 = 0xfffbe150;
      DAT_00006860 = 0;
      DAT_00006864 = 0;
      DAT_00006868 = 0x60;
      _DAT_0000687a = 0x60;
      DAT_000a0578 = DAT_000a0540;
      DAT_00005b8c = 0;
      DAT_0000687c = 0;
      _LAB_00002ab8 = 0;
      _LAB_00002ab8_2 = 0;
      _LAB_00002abc = 0;
      DAT_000a04f0 = 0;
      DAT_000a04f8 = 0;
      DAT_000a043c = DAT_000a042c;
      DAT_000a0444 = DAT_000a0434;
      DAT_000a044c = sVar1;
    }
  }
  return;
}


// ==== FUN_00004032 @ 00004032

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00004032(void)

{
  short sVar1;
  undefined4 uVar2;
  
  if (DAT_000a0491 != '\0') {
    sVar1 = DAT_000a044e + -1;
    if (sVar1 == 0 || DAT_000a044e < 1) {
      DAT_000a056c = DAT_000a054c;
      DAT_000a056e = DAT_000a054e;
      DAT_000a044e = sVar1;
      FUN_0000372a();
      uVar2 = DAT_000a04ac;
      DAT_000a056c = DAT_000a055c;
      DAT_000a056e = DAT_000a055e;
      DAT_000a04ac = DAT_000a04b0;
      DAT_000a04b0 = uVar2;
      FUN_0000372a();
      DAT_000a0491 = '\0';
      DAT_000a048e = DAT_000a048e + -1;
      FUN_00003e44();
    }
    else {
      DAT_00006972 = 300000;
      _LAB_0000698c = 300000;
      DAT_00006984 = 0;
      DAT_00006986 = 0;
      DAT_00006976 = 0xfffbe150;
      _LAB_00006990 = 0xfffbe150;
      DAT_0000697a = 0;
      DAT_0000697e = 0;
      DAT_00006982 = 0xa0;
      _DAT_00006994 = 0xa0;
      DAT_000a057a = DAT_000a0542;
      DAT_00005b8e = 0;
      DAT_00006996 = 0;
      _LAB_00002ab8 = 0;
      _LAB_00002abc_2 = 0;
      _LAB_00002ac0 = 0;
      DAT_000a04f2 = 0;
      DAT_000a04fa = 0;
      DAT_000a043e = DAT_000a042e;
      DAT_000a0446 = DAT_000a0436;
      DAT_000a044e = sVar1;
    }
  }
  return;
}


// ==== FUN_00004152 @ 00004152

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00004152(void)

{
  short sVar1;
  undefined4 uVar2;
  
  if (DAT_000a0492 != '\0') {
    sVar1 = DAT_000a0450 + -1;
    if (sVar1 == 0 || DAT_000a0450 < 1) {
      DAT_000a0570 = DAT_000a0550;
      DAT_000a0572 = DAT_000a0552;
      DAT_000a0450 = sVar1;
      FUN_00003766();
      uVar2 = DAT_000a04b4;
      DAT_000a0570 = DAT_000a0560;
      DAT_000a0572 = DAT_000a0562;
      DAT_000a04b4 = DAT_000a04b8;
      DAT_000a04b8 = uVar2;
      FUN_00003766();
      DAT_000a0492 = '\0';
      DAT_000a048e = DAT_000a048e + -1;
      FUN_00003e44();
    }
    else {
      DAT_00006a8c = 0xfffb6c20;
      _LAB_00006aa6 = 0xfffb6c20;
      DAT_00006a9e = 0;
      DAT_00006aa0 = 0;
      DAT_00006a90 = 270000;
      _LAB_00006aaa = 270000;
      DAT_00006a94 = 0;
      DAT_00006a98 = 0;
      DAT_00006a9c = 0x40;
      _DAT_00006aae = 0x40;
      DAT_000a057c = DAT_000a0544;
      DAT_00005b90 = 0;
      DAT_00006ab0 = 0;
      _LAB_00002ab8_2 = 0;
      _LAB_00002abc_2 = 0;
      _LAB_00002ac0_2 = 0;
      DAT_000a04f4 = 0;
      DAT_000a04fc = 0;
      DAT_000a0440 = DAT_000a0430;
      DAT_000a0448 = DAT_000a0438;
      DAT_000a0450 = sVar1;
    }
  }
  return;
}


// ==== FUN_00004276 @ 00004276

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00004276(void)

{
  short sVar1;
  undefined4 uVar2;
  
  if (DAT_000a0493 != '\0') {
    sVar1 = DAT_000a0452 + -1;
    if (sVar1 == 0 || DAT_000a0452 < 1) {
      DAT_000a0574 = DAT_000a0554;
      DAT_000a0576 = DAT_000a0556;
      DAT_000a0452 = sVar1;
      FUN_000037a2();
      uVar2 = DAT_000a04bc;
      DAT_000a0574 = DAT_000a0564;
      DAT_000a0576 = DAT_000a0566;
      DAT_000a04bc = DAT_000a04c0;
      DAT_000a04c0 = uVar2;
      FUN_000037a2();
      DAT_000a0493 = '\0';
      DAT_000a048e = DAT_000a048e + -1;
      FUN_00003e44();
    }
    else {
      DAT_00006ba6 = 300000;
      _LAB_00006bc0 = 300000;
      DAT_00006bb8 = 0;
      DAT_00006bba = 0;
      DAT_00006baa = 270000;
      _LAB_00006bc4 = 270000;
      DAT_00006bae = 0;
      DAT_00006bb2 = 0;
      DAT_00006bb6 = 0xc0;
      _DAT_00006bc8 = 0xc0;
      DAT_000a057e = DAT_000a0546;
      DAT_00005b92 = 0;
      DAT_00006bca = 0;
      _LAB_00002abc = 0;
      _LAB_00002ac0 = 0;
      _LAB_00002ac0_2 = 0;
      DAT_000a04f6 = 0;
      DAT_000a04fe = 0;
      DAT_000a0442 = DAT_000a0432;
      DAT_000a044a = DAT_000a043a;
      DAT_000a0452 = sVar1;
    }
  }
  return;
}


// ==== FUN_0000439a @ 0000439a

undefined8 FUN_0000439a(void)

{
  undefined4 in_D0;
  undefined4 in_D1;
  
  FUN_000043a8();
  return CONCAT44(in_D0,in_D1);
}


// ==== FUN_000043a8 @ 000043a8

undefined4 FUN_000043a8(void)

{
  undefined4 uVar1;
  undefined2 uVar2;
  int iVar3;
  ushort uVar5;
  ushort uVar6;
  ushort uVar7;
  short sVar8;
  int in_A1;
  ushort *puVar9;
  undefined1 *unaff_A2;
  undefined1 *puVar10;
  code *UNRECOVERED_JUMPTABLE;
  bool bVar11;
  uint uVar4;
  
  puVar10 = unaff_A2 + *(int *)(in_A1 + 8);
  puVar9 = (ushort *)(*(int *)(in_A1 + 0xc) + in_A1 + 0xc);
  iVar3 = (int)(short)puVar9[1];
  uVar6 = puVar9[2];
LAB_000043ec:
  bVar11 = unaff_A2 < puVar10;
  if (bVar11) {
    uVar7 = uVar6 - 1;
    goto joined_r0x000043ee;
  }
  do {
    if (!bVar11) {
      return 1;
    }
    puVar9 = puVar9 + -1;
    iVar3 = CONCAT22((short)((uint)iVar3 >> 0x10),*puVar9);
    uVar7 = 0xf;
    do {
      uVar5 = (ushort)iVar3;
      uVar2 = (undefined2)((uint)iVar3 >> 0x10);
      uVar4 = CONCAT22(uVar2,uVar5 * 2);
      if (CARRY2(uVar5,uVar5)) {
        sVar8 = uVar7 - 1;
        if (sVar8 == -1) {
          puVar9 = puVar9 + -1;
          uVar4 = (uint)*puVar9;
          sVar8 = 0xf;
        }
        uVar7 = (ushort)uVar4;
        uVar6 = uVar7 * 2;
        if (CARRY2(uVar7,uVar7)) {
          UNRECOVERED_JUMPTABLE = (code *)&LAB_00004454;
        }
        else {
          sVar8 = sVar8 + -1;
          if (sVar8 == -1) {
            puVar9 = puVar9 + -1;
            uVar6 = *puVar9;
            sVar8 = 0xf;
          }
          uVar7 = uVar6 * 2;
          if (!CARRY2(uVar6,uVar6)) {
            if (sVar8 == 0) {
              uVar7 = puVar9[-1];
            }
            if (CARRY2(uVar7,uVar7)) {
              UNRECOVERED_JUMPTABLE = (code *)&LAB_0000442e;
              goto LAB_000044a0;
            }
          }
          UNRECOVERED_JUMPTABLE = (code *)&LAB_00004448;
        }
LAB_000044a0:
                    /* WARNING: Could not recover jumptable at 0x000044b8. Too many branches */
                    /* WARNING: Treating indirect jump as call */
        uVar1 = (*UNRECOVERED_JUMPTABLE)();
        return uVar1;
      }
      uVar6 = uVar7 - 8;
      if (-1 < (short)uVar6) {
        uVar7 = (uVar5 & 0x7fff) >> 7;
        iVar3 = CONCAT22(uVar2,uVar5 << 9 | uVar7);
        puVar10 = puVar10 + -1;
        *puVar10 = (char)uVar7;
        goto LAB_000043ec;
      }
      puVar9 = puVar9 + -1;
      iVar3 = CONCAT22((short)((uVar4 << (uVar7 & 0x3f)) >> 0x10),*puVar9) << (-uVar6 & 0x3f);
      puVar10 = puVar10 + -1;
      *puVar10 = (char)((uint)iVar3 >> 0x10);
      bVar11 = unaff_A2 < puVar10;
      if (!bVar11) break;
      uVar7 = uVar7 + 7;
joined_r0x000043ee:
    } while (uVar7 != 0xffff);
  } while( true );
}


// ==== FUN_000044e6 @ 000044e6

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

uint FUN_000044e6(void)

{
  byte bVar1;
  byte bVar2;
  undefined4 in_D0;
  uint uVar3;
  byte bVar4;
  
  bVar2 = (byte)((ushort)_DAT_00dff00a >> 8);
  bVar1 = (bVar2 & 2) >> 1;
  bVar4 = ((byte)_DAT_00dff00a & 2) >> 1;
  uVar3 = CONCAT31((int3)(CONCAT22((short)((uint)in_D0 >> 0x10),_DAT_00dff00a) >> 8),
                   (bVar1 ^ bVar2 & 1) << 2 |
                   bVar4 << 1 | bVar1 | (bVar4 ^ (byte)_DAT_00dff00a & 1) << 3);
  if ((DAT_00bfe001 & 0x40) == 0) {
    uVar3 = uVar3 | 0x10;
  }
  return uVar3;
}


// ==== FUN_00004528 @ 00004528

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

uint FUN_00004528(void)

{
  byte bVar1;
  byte bVar2;
  undefined4 in_D0;
  uint uVar3;
  byte bVar4;
  
  bVar2 = (byte)((ushort)_DAT_00dff00c >> 8);
  bVar1 = (bVar2 & 2) >> 1;
  bVar4 = ((byte)_DAT_00dff00c & 2) >> 1;
  uVar3 = CONCAT31((int3)(CONCAT22((short)((uint)in_D0 >> 0x10),_DAT_00dff00c) >> 8),
                   (bVar1 ^ bVar2 & 1) << 2 |
                   bVar4 << 1 | bVar1 | (bVar4 ^ (byte)_DAT_00dff00c & 1) << 3);
  if ((DAT_00bfe001 & 0x80) == 0) {
    uVar3 = uVar3 | 0x10;
  }
  return uVar3;
}


// ==== FUN_0000456a @ 0000456a

uint FUN_0000456a(void)

{
  uint uVar1;
  
  uVar1 = 0;
  if (DAT_0000475e != '\0') {
    uVar1 = 2;
  }
  if (DAT_0000475f != '\0') {
    uVar1 = uVar1 | 1;
  }
  if (DAT_0000475c != '\0') {
    uVar1 = uVar1 | 4;
  }
  if (DAT_0000475d != '\0') {
    uVar1 = uVar1 | 8;
  }
  if (DAT_00004770 != '\0') {
    uVar1 = uVar1 | 0x10;
  }
  return uVar1;
}


// ==== FUN_000045a6 @ 000045a6

byte FUN_000045a6(void)

{
  byte bVar1;
  
  bVar1 = (DAT_0000466e & 4) == 0;
  if ((DAT_0000466e & 8) == 0) {
    bVar1 = bVar1 | 2;
  }
  if ((DAT_0000466e & 1) == 0) {
    bVar1 = bVar1 | 4;
  }
  if ((DAT_0000466e & 2) == 0) {
    bVar1 = bVar1 | 8;
  }
  if ((DAT_0000466f & 4) == 0) {
    bVar1 = bVar1 | 0x10;
  }
  return bVar1;
}


// ==== FUN_000045e8 @ 000045e8

byte FUN_000045e8(void)

{
  byte bVar1;
  
  bVar1 = (DAT_0000466e & 0x40) == 0;
  if ((DAT_0000466e & 0x80) == 0) {
    bVar1 = bVar1 | 2;
  }
  if ((DAT_0000466e & 0x10) == 0) {
    bVar1 = bVar1 | 4;
  }
  if ((DAT_0000466e & 0x20) == 0) {
    bVar1 = bVar1 | 8;
  }
  if ((DAT_0000466f & 1) == 0) {
    bVar1 = bVar1 | 0x10;
  }
  return bVar1;
}


// ==== FUN_00004670 @ 00004670

void FUN_00004670(void)

{
  short sVar1;
  undefined1 *puVar2;
  int *piVar3;
  
  sVar1 = 0x7f;
  puVar2 = &DAT_00004710;
  do {
    *puVar2 = 0;
    sVar1 = sVar1 + -1;
    puVar2 = puVar2 + 1;
  } while (sVar1 != -1);
  piVar3 = (int *)(DAT_00000004 + 0x150);
  do {
    piVar3 = (int *)*piVar3;
  } while (**(int **)((int)piVar3 + 10) != 0x63696161);
  DAT_0000470c = piVar3 + 0x1a;
  uRam00004708 = *DAT_0000470c;
  *DAT_0000470c = 0x46c2;
  return;
}


// ==== FUN_000046b4 @ 000046b4

void FUN_000046b4(void)

{
  *DAT_0000470c = uRam00004708;
  return;
}


// ==== FUN_000046c2 @ 000046c2

/* WARNING: Control flow encountered bad instruction data */

void FUN_000046c2(void)

{
  byte bVar1;
  ushort uVar2;
  
  bVar1 = DAT_00bfec01;
  if ((DAT_00bfec01 & 1) != 0) {
    DAT_00bfec01 = 0;
  }
  if (bVar1 != 0) {
    uVar2 = (ushort)(byte)((bVar1 ^ 0xff) >> 1);
    if ((bVar1 & 1) == 0) {
      (&DAT_00004710)[(short)uVar2] = 0;
    }
    else {
      (&DAT_00004710)[(short)uVar2] = 1;
    }
  }
                    /* WARNING: Bad instruction - Truncating control flow here */
  halt_baddata();
}


// ==== FUN_00004790 @ 00004790

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00004790(void)

{
  char cVar1;
  int iVar2;
  short sVar3;
  char *pcVar4;
  char *pcVar5;
  int *piVar6;
  int *piVar7;
  
  _LAB_00004aa4 = 0;
  _LAB_00004aac = 0;
  _LAB_0000498c = (**(code **)(DAT_00094024 + -0x54))();
  if (_LAB_0000498c != 0) {
    _LAB_00004990 = (**(code **)(DAT_00094024 + -0x7e))();
    iVar2 = (**(code **)(DAT_00094024 + -0x66))();
    piVar6 = &DAT_00004ab2;
    if (iVar2 != 0) {
LAB_000047f8:
      iVar2 = (**(code **)(DAT_00094024 + -0x6c))();
      if (iVar2 != 0) {
        pcVar4 = (char *)0x49a0;
        do {
          iVar2 = CONCAT31((int3)((uint)iVar2 >> 8),*pcVar4);
          if (*(char *)(uint)LAB_0000498a <= iVar2 && iVar2 <= ((char *)(uint)LAB_0000498a)[1]) {
            *pcVar4 = *pcVar4 + -0x20;
          }
          cVar1 = *pcVar4;
          pcVar4 = pcVar4 + 1;
        } while (cVar1 != '\0');
        sVar3 = 0x6b;
        pcVar4 = (char *)0x49a0;
        while (*pcVar4 != '.') {
          if ((*pcVar4 == '\0') || (sVar3 = sVar3 + -1, pcVar4 = pcVar4 + 1, sVar3 == -1))
          goto LAB_000047f8;
        }
        if ((((pcVar4[1] == 'S') && (pcVar4[2] == 'O')) && (pcVar4[3] == 'B')) &&
           (pcVar4[4] == '\0')) {
          _LAB_00004994 = (**(code **)(DAT_00094024 + -0x1e))();
          if (_LAB_00004994 == 0) goto LAB_0000493e;
          (**(code **)(DAT_00094024 + -0x2a))();
          piVar7 = piVar6;
          if ((iRam00004a9c != 0x53686f62) || (iRam00004aa0 != 0x6a656374)) goto LAB_00004922;
          piVar6[0x100] = iRam00004a14 + 0x20;
          iVar2 = (**(code **)(DAT_00000004 + -0xc6))();
          piVar7 = piVar6 + 1;
          *piVar6 = iVar2;
          if (iVar2 == 0) {
            (**(code **)(DAT_00094024 + -0x24))();
            goto LAB_0000493e;
          }
          (**(code **)(DAT_00094024 + -0x2a))();
          sVar3 = 0x1f;
          pcVar4 = (char *)0x49a0;
          pcVar5 = (char *)*piVar6;
          goto LAB_00004910;
        }
        goto LAB_000047f8;
      }
      _LAB_00004aa4 = 1;
    }
LAB_0000493e:
    (**(code **)(DAT_00094024 + -0x7e))();
    (**(code **)(DAT_00094024 + -0x5a))();
  }
  return;
  while( true ) {
    *pcVar5 = *pcVar4;
    sVar3 = sVar3 + -1;
    pcVar4 = pcVar4 + 1;
    pcVar5 = pcVar5 + 1;
    if (sVar3 == -1) break;
LAB_00004910:
    if (*pcVar4 == '.') break;
  }
  _LAB_00004aac = _LAB_00004aac + 1;
LAB_00004922:
  (**(code **)(DAT_00094024 + -0x24))();
  piVar6 = piVar7;
  goto LAB_000047f8;
}


// ==== FUN_00004960 @ 00004960

undefined4 FUN_00004960(void)

{
  int *piVar1;
  undefined4 *puVar2;
  
  puVar2 = &DAT_00004ab2;
  while( true ) {
    piVar1 = puVar2 + 0x100;
    puVar2 = puVar2 + 1;
    if (*piVar1 == 0) break;
    (**(code **)(DAT_00000004 + -0xd2))();
  }
  return 0;
}


// ==== FUN_00004a06 @ 00004a06

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00004a06(void)

{
  ushort uVar1;
  byte bVar2;
  short sVar3;
  
  FUN_00005c66();
  do {
  } while ((_DAT_00dff004 & 0x1ff00) != 0);
  FUN_00005454();
  _LAB_0000744a_2 = 0;
  do {
    do {
    } while (((ushort)(_DAT_00dff004 >> 8) & 0x1ff) != 300);
    FUN_00008ea0();
  } while ((DAT_000110b8 & 0x10) != 0);
  sVar3 = 0x32;
  do {
    do {
      uVar1 = (ushort)(_DAT_00dff004 >> 8);
    } while ((uVar1 & 0x1ff) != 300);
    do {
    } while ((uVar1 & 0x1ff) != 0x12d);
    sVar3 = sVar3 + -1;
  } while (sVar3 != -1);
  do {
    DAT_0000466e = DAT_00bfe101;
    DAT_0000466f = DAT_00bfd002;
    DAT_000110b8 = FUN_000045a6();
    bVar2 = FUN_000045e8();
    DAT_000110b8 = bVar2 | DAT_000110b8;
    bVar2 = FUN_00004528();
    DAT_000110b8 = bVar2 | DAT_000110b8;
    bVar2 = FUN_0000456a();
    DAT_000110b8 = bVar2 | DAT_000110b8;
    bVar2 = FUN_000044e6();
    DAT_000110b8 = bVar2 | DAT_000110b8;
  } while ((DAT_000110b8 & 0x10) == 0);
  return;
}


// ==== FUN_000052b2 @ 000052b2

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_000052b2(void)

{
  ushort uVar1;
  byte bVar2;
  short sVar3;
  
  FUN_00005c66();
  do {
  } while ((_DAT_00dff004 & 0x1ff00) != 0);
  FUN_00005454();
  _LAB_0000744a_2 = 0;
  do {
    do {
    } while (((ushort)(_DAT_00dff004 >> 8) & 0x1ff) != 300);
    FUN_00008ea0();
  } while ((DAT_000110b8 & 0x10) != 0);
  sVar3 = 0x32;
  do {
    do {
      uVar1 = (ushort)(_DAT_00dff004 >> 8);
    } while ((uVar1 & 0x1ff) != 300);
    do {
    } while ((uVar1 & 0x1ff) != 0x12d);
    sVar3 = sVar3 + -1;
  } while (sVar3 != -1);
  do {
    DAT_0000466e = DAT_00bfe101;
    DAT_0000466f = DAT_00bfd002;
    DAT_000110b8 = FUN_000045a6();
    bVar2 = FUN_000045e8();
    DAT_000110b8 = bVar2 | DAT_000110b8;
    bVar2 = FUN_00004528();
    DAT_000110b8 = bVar2 | DAT_000110b8;
    bVar2 = FUN_0000456a();
    DAT_000110b8 = bVar2 | DAT_000110b8;
    bVar2 = FUN_000044e6();
    DAT_000110b8 = bVar2 | DAT_000110b8;
  } while ((DAT_000110b8 & 0x10) == 0);
  return;
}


// ==== FUN_000053ba @ 000053ba

void FUN_000053ba(void)

{
  short sVar1;
  undefined4 *puVar2;
  undefined4 *puVar3;
  
  FUN_00005454();
  sVar1 = 899;
  puVar2 = &DAT_0002089c;
  puVar3 = &DAT_00025270;
  do {
    *puVar3 = *puVar2;
    sVar1 = sVar1 + -1;
    puVar2 = puVar2 + 1;
    puVar3 = puVar3 + 1;
  } while (sVar1 != -1);
  if (DAT_000a0490 == '\0') {
    FUN_0000543c();
  }
  if (DAT_000a0491 == '\0') {
    FUN_0000543c();
  }
  if (DAT_000a0492 == '\0') {
    FUN_0000543c();
  }
  if (DAT_000a0493 == '\0') {
    FUN_0000543c();
  }
  return;
}


// ==== FUN_0000543c @ 0000543c

void FUN_0000543c(void)

{
  short sVar1;
  undefined2 *in_A0;
  undefined2 *puVar2;
  undefined2 *in_A1;
  
  sVar1 = 0x59;
  do {
    *in_A1 = *in_A0;
    in_A1[1] = in_A0[1];
    in_A1[2] = in_A0[2];
    puVar2 = in_A0 + 4;
    in_A1[3] = in_A0[3];
    in_A0 = in_A0 + 5;
    in_A1[4] = *puVar2;
    in_A1 = in_A1 + 0x14;
    sVar1 = sVar1 + -1;
  } while (sVar1 != -1);
  return;
}


// ==== FUN_00005454 @ 00005454

void FUN_00005454(void)

{
  int in_D1;
  short sVar1;
  undefined2 *puVar2;
  
  puVar2 = &DAT_000796f6;
  sVar1 = 4;
  do {
    puVar2[2] = (short)in_D1;
    *puVar2 = (short)((uint)in_D1 >> 0x10);
    in_D1 = in_D1 + 0x28;
    puVar2 = puVar2 + 4;
    sVar1 = sVar1 + -1;
  } while (sVar1 != -1);
  return;
}


// ==== FUN_00005474 @ 00005474

void FUN_00005474(void)

{
  if (DAT_000a0490 != '\0') {
    FUN_000054dc();
    FUN_00005674();
    FUN_0000580c();
    FUN_000059a4();
  }
  return;
}


// ==== FUN_0000548e @ 0000548e

void FUN_0000548e(void)

{
  if (DAT_000a0491 != '\0') {
    FUN_0000550e();
    FUN_000056da();
    FUN_00005872();
    FUN_00005a0a();
  }
  return;
}


// ==== FUN_000054a8 @ 000054a8

void FUN_000054a8(void)

{
  if (DAT_000a0492 != '\0') {
    FUN_00005544();
    FUN_00005740();
    FUN_000058d8();
    FUN_00005a70();
  }
  return;
}


// ==== FUN_000054c2 @ 000054c2

void FUN_000054c2(void)

{
  if (DAT_000a0493 != '\0') {
    FUN_0000557a();
    FUN_000057a6();
    FUN_0000593e();
    FUN_00005ad6();
  }
  return;
}


// ==== FUN_000054dc @ 000054dc

void FUN_000054dc(void)

{
  if (DAT_000a0454 != DAT_000a044c) {
    DAT_000a0454 = DAT_000a044c;
    FUN_000055b0();
  }
  return;
}


// ==== FUN_0000550e @ 0000550e

void FUN_0000550e(void)

{
  if (DAT_000a0456 != DAT_000a044e) {
    DAT_000a0456 = DAT_000a044e;
    FUN_000055b0();
  }
  return;
}


// ==== FUN_00005544 @ 00005544

void FUN_00005544(void)

{
  if (DAT_000a0458 != DAT_000a0450) {
    DAT_000a0458 = DAT_000a0450;
    FUN_000055b0();
  }
  return;
}


// ==== FUN_0000557a @ 0000557a

void FUN_0000557a(void)

{
  if (DAT_000a045a != DAT_000a0452) {
    DAT_000a045a = DAT_000a0452;
    FUN_000055b0();
  }
  return;
}


// ==== FUN_000055b0 @ 000055b0

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_000055b0(void)

{
  ushort in_D0w;
  uint in_D1;
  undefined4 unaff_D2;
  short sVar1;
  uint *puVar2;
  
  _DAT_00dff048 = (uint *)((int)&DAT_00025270 + (in_D0w >> 3 & 0xfffe) + (in_D1 & 0xffff) * 200);
  sVar1 = 0xb;
  puVar2 = _DAT_00dff048;
  do {
    *puVar2 = *puVar2 & 0xfff80007;
    puVar2[10] = puVar2[10] & 0xfff80007;
    puVar2[0x14] = puVar2[0x14] & 0xfff80007;
    puVar2[0x1e] = puVar2[0x1e] & 0xfff80007;
    puVar2[0x28] = puVar2[0x28] & 0xfff80007;
    puVar2 = puVar2 + 0x32;
    sVar1 = sVar1 + -1;
  } while (sVar1 != -1);
  do {
  } while ((DAT_00dff002 & 0x40) != 0);
  _DAT_00dff050 = unaff_D2;
  _DAT_00dff04c = unaff_D2;
  _DAT_00dff054 = _DAT_00dff048;
  _DAT_00dff042 = in_D0w << 0xc;
  _DAT_00dff040 = in_D0w << 0xc | 0xfca;
  _DAT_00dff044 = 0xffffffff;
  _DAT_00dff064 = 0;
  _DAT_00dff062 = 0;
  _DAT_00dff060 = 0x24;
  _DAT_00dff066 = 0x24;
  _DAT_00dff058 = 0xf02;
  return;
}


// ==== FUN_00005674 @ 00005674

void FUN_00005674(void)

{
  short sVar1;
  short sVar2;
  
  sVar2 = (short)(((uint)DAT_000a0578 * 0x2f) / (uint)DAT_000a0540);
  if (DAT_00005b8c < sVar2) {
    sVar1 = sVar2 - DAT_00005b8c;
    DAT_00005b8c = sVar2;
    while (sVar1 = sVar1 + -1, sVar1 != -1) {
      FUN_00005b3c();
    }
    return;
  }
  if (sVar2 < DAT_00005b8c) {
    sVar1 = DAT_00005b8c - sVar2;
    DAT_00005b8c = sVar2;
    while (sVar1 = sVar1 + -1, sVar1 != -1) {
      FUN_00005b64();
    }
    return;
  }
  return;
}


// ==== FUN_000056da @ 000056da

void FUN_000056da(void)

{
  short sVar1;
  short sVar2;
  
  sVar2 = (short)(((uint)DAT_000a057a * 0x2f) / (uint)DAT_000a0542);
  if (DAT_00005b8e < sVar2) {
    sVar1 = sVar2 - DAT_00005b8e;
    DAT_00005b8e = sVar2;
    while (sVar1 = sVar1 + -1, sVar1 != -1) {
      FUN_00005b3c();
    }
    return;
  }
  if (sVar2 < DAT_00005b8e) {
    sVar1 = DAT_00005b8e - sVar2;
    DAT_00005b8e = sVar2;
    while (sVar1 = sVar1 + -1, sVar1 != -1) {
      FUN_00005b64();
    }
    return;
  }
  return;
}


// ==== FUN_00005740 @ 00005740

void FUN_00005740(void)

{
  short sVar1;
  short sVar2;
  
  sVar2 = (short)(((uint)DAT_000a057c * 0x2f) / (uint)DAT_000a0544);
  if (DAT_00005b90 < sVar2) {
    sVar1 = sVar2 - DAT_00005b90;
    DAT_00005b90 = sVar2;
    while (sVar1 = sVar1 + -1, sVar1 != -1) {
      FUN_00005b3c();
    }
    return;
  }
  if (sVar2 < DAT_00005b90) {
    sVar1 = DAT_00005b90 - sVar2;
    DAT_00005b90 = sVar2;
    while (sVar1 = sVar1 + -1, sVar1 != -1) {
      FUN_00005b64();
    }
    return;
  }
  return;
}


// ==== FUN_000057a6 @ 000057a6

void FUN_000057a6(void)

{
  short sVar1;
  short sVar2;
  
  sVar2 = (short)(((uint)DAT_000a057e * 0x2f) / (uint)DAT_000a0546);
  if (DAT_00005b92 < sVar2) {
    sVar1 = sVar2 - DAT_00005b92;
    DAT_00005b92 = sVar2;
    while (sVar1 = sVar1 + -1, sVar1 != -1) {
      FUN_00005b3c();
    }
    return;
  }
  if (sVar2 < DAT_00005b92) {
    sVar1 = DAT_00005b92 - sVar2;
    DAT_00005b92 = sVar2;
    while (sVar1 = sVar1 + -1, sVar1 != -1) {
      FUN_00005b64();
    }
    return;
  }
  return;
}


// ==== FUN_0000580c @ 0000580c

void FUN_0000580c(void)

{
  short sVar1;
  short sVar2;
  
  sVar2 = (short)(((uint)DAT_000a043c * 0x2f) / (uint)DAT_000a042c);
  if (DAT_00005b94 < sVar2) {
    sVar1 = sVar2 - DAT_00005b94;
    DAT_00005b94 = sVar2;
    while (sVar1 = sVar1 + -1, sVar1 != -1) {
      FUN_00005b3c();
    }
    return;
  }
  if (sVar2 < DAT_00005b94) {
    sVar1 = DAT_00005b94 - sVar2;
    DAT_00005b94 = sVar2;
    while (sVar1 = sVar1 + -1, sVar1 != -1) {
      FUN_00005b64();
    }
    return;
  }
  return;
}


// ==== FUN_00005872 @ 00005872

void FUN_00005872(void)

{
  short sVar1;
  short sVar2;
  
  sVar2 = (short)(((uint)DAT_000a043e * 0x2f) / (uint)DAT_000a042e);
  if (DAT_00005b96 < sVar2) {
    sVar1 = sVar2 - DAT_00005b96;
    DAT_00005b96 = sVar2;
    while (sVar1 = sVar1 + -1, sVar1 != -1) {
      FUN_00005b3c();
    }
    return;
  }
  if (sVar2 < DAT_00005b96) {
    sVar1 = DAT_00005b96 - sVar2;
    DAT_00005b96 = sVar2;
    while (sVar1 = sVar1 + -1, sVar1 != -1) {
      FUN_00005b64();
    }
    return;
  }
  return;
}


// ==== FUN_000058d8 @ 000058d8

void FUN_000058d8(void)

{
  short sVar1;
  short sVar2;
  
  sVar2 = (short)(((uint)DAT_000a0440 * 0x2f) / (uint)DAT_000a0430);
  if (DAT_00005b98 < sVar2) {
    sVar1 = sVar2 - DAT_00005b98;
    DAT_00005b98 = sVar2;
    while (sVar1 = sVar1 + -1, sVar1 != -1) {
      FUN_00005b3c();
    }
    return;
  }
  if (sVar2 < DAT_00005b98) {
    sVar1 = DAT_00005b98 - sVar2;
    DAT_00005b98 = sVar2;
    while (sVar1 = sVar1 + -1, sVar1 != -1) {
      FUN_00005b64();
    }
    return;
  }
  return;
}


// ==== FUN_0000593e @ 0000593e

void FUN_0000593e(void)

{
  short sVar1;
  short sVar2;
  
  sVar2 = (short)(((uint)DAT_000a0442 * 0x2f) / (uint)DAT_000a0432);
  if (DAT_00005b9a < sVar2) {
    sVar1 = sVar2 - DAT_00005b9a;
    DAT_00005b9a = sVar2;
    while (sVar1 = sVar1 + -1, sVar1 != -1) {
      FUN_00005b3c();
    }
    return;
  }
  if (sVar2 < DAT_00005b9a) {
    sVar1 = DAT_00005b9a - sVar2;
    DAT_00005b9a = sVar2;
    while (sVar1 = sVar1 + -1, sVar1 != -1) {
      FUN_00005b64();
    }
    return;
  }
  return;
}


// ==== FUN_000059a4 @ 000059a4

void FUN_000059a4(void)

{
  short sVar1;
  short sVar2;
  
  sVar2 = (short)(((uint)DAT_000a0444 * 0x2f) / (uint)DAT_000a0434);
  if (DAT_00005b9c < sVar2) {
    sVar1 = sVar2 - DAT_00005b9c;
    DAT_00005b9c = sVar2;
    while (sVar1 = sVar1 + -1, sVar1 != -1) {
      FUN_00005b3c();
    }
    return;
  }
  if (sVar2 < DAT_00005b9c) {
    sVar1 = DAT_00005b9c - sVar2;
    DAT_00005b9c = sVar2;
    while (sVar1 = sVar1 + -1, sVar1 != -1) {
      FUN_00005b64();
    }
    return;
  }
  return;
}


// ==== FUN_00005a0a @ 00005a0a

void FUN_00005a0a(void)

{
  short sVar1;
  short sVar2;
  
  sVar2 = (short)(((uint)DAT_000a0446 * 0x2f) / (uint)DAT_000a0436);
  if (DAT_00005b9e < sVar2) {
    sVar1 = sVar2 - DAT_00005b9e;
    DAT_00005b9e = sVar2;
    while (sVar1 = sVar1 + -1, sVar1 != -1) {
      FUN_00005b3c();
    }
    return;
  }
  if (sVar2 < DAT_00005b9e) {
    sVar1 = DAT_00005b9e - sVar2;
    DAT_00005b9e = sVar2;
    while (sVar1 = sVar1 + -1, sVar1 != -1) {
      FUN_00005b64();
    }
    return;
  }
  return;
}


// ==== FUN_00005a70 @ 00005a70

void FUN_00005a70(void)

{
  short sVar1;
  short sVar2;
  
  sVar2 = (short)(((uint)DAT_000a0448 * 0x2f) / (uint)DAT_000a0438);
  if (DAT_00005ba0 < sVar2) {
    sVar1 = sVar2 - DAT_00005ba0;
    DAT_00005ba0 = sVar2;
    while (sVar1 = sVar1 + -1, sVar1 != -1) {
      FUN_00005b3c();
    }
    return;
  }
  if (sVar2 < DAT_00005ba0) {
    sVar1 = DAT_00005ba0 - sVar2;
    DAT_00005ba0 = sVar2;
    while (sVar1 = sVar1 + -1, sVar1 != -1) {
      FUN_00005b64();
    }
    return;
  }
  return;
}


// ==== FUN_00005ad6 @ 00005ad6

void FUN_00005ad6(void)

{
  short sVar1;
  short sVar2;
  
  sVar2 = (short)(((uint)DAT_000a044a * 0x2f) / (uint)DAT_000a043a);
  if (DAT_00005ba2 < sVar2) {
    sVar1 = sVar2 - DAT_00005ba2;
    DAT_00005ba2 = sVar2;
    while (sVar1 = sVar1 + -1, sVar1 != -1) {
      FUN_00005b3c();
    }
    return;
  }
  if (sVar2 < DAT_00005ba2) {
    sVar1 = DAT_00005ba2 - sVar2;
    DAT_00005ba2 = sVar2;
    while (sVar1 = sVar1 + -1, sVar1 != -1) {
      FUN_00005b64();
    }
    return;
  }
  return;
}


// ==== FUN_00005b3c @ 00005b3c

undefined8 FUN_00005b3c(void)

{
  byte *pbVar1;
  short sVar2;
  byte bVar3;
  undefined4 in_D0;
  undefined4 in_D1;
  int in_A0;
  
  bVar3 = (byte)in_D0 & 7 ^ 7;
  sVar2 = ((ushort)in_D0 >> 3) + (short)in_D1 * 200;
  pbVar1 = (byte *)(in_A0 + sVar2);
  *pbVar1 = *pbVar1 | '\x01' << bVar3;
  pbVar1 = (byte *)(in_A0 + sVar2 + 200);
  *pbVar1 = *pbVar1 | '\x01' << bVar3;
  return CONCAT44(in_D0,in_D1);
}


// ==== FUN_00005b64 @ 00005b64

undefined8 FUN_00005b64(void)

{
  byte *pbVar1;
  short sVar2;
  byte bVar3;
  undefined4 in_D0;
  undefined4 in_D1;
  int in_A0;
  
  bVar3 = (byte)in_D0 & 7 ^ 7;
  sVar2 = ((ushort)in_D0 >> 3) + (short)in_D1 * 200;
  pbVar1 = (byte *)(in_A0 + sVar2);
  *pbVar1 = *pbVar1 ^ '\x01' << bVar3;
  pbVar1 = (byte *)(in_A0 + sVar2 + 200);
  *pbVar1 = *pbVar1 ^ '\x01' << bVar3;
  return CONCAT44(in_D0,in_D1);
}


// ==== FUN_00005ba4 @ 00005ba4

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00005ba4(void)

{
  ushort uVar1;
  int extraout_A0;
  int extraout_A0_00;
  
  uVar1 = DAT_000a045c;
  _DAT_00dff096 = DAT_000a045c;
  FUN_00005cce();
  *(ushort *)(extraout_A0 + 0x96) = uVar1 | 0x8000;
  FUN_00005cce();
  if (_DAT_000a045e != 0) {
    *(undefined4 *)(extraout_A0_00 + 0xa0) = DAT_000a0460;
    *(undefined2 *)(extraout_A0_00 + 0xa4) = DAT_000a0464;
    *(undefined2 *)(extraout_A0_00 + 0xa8) = DAT_000a0466;
    *(undefined2 *)(extraout_A0_00 + 0xa6) = DAT_000a0468;
  }
  if (_DAT_000a046a != 0) {
    *(undefined4 *)(extraout_A0_00 + 0xb0) = DAT_000a046c;
    *(undefined2 *)(extraout_A0_00 + 0xb4) = DAT_000a0470;
    *(undefined2 *)(extraout_A0_00 + 0xb8) = DAT_000a0472;
    *(undefined2 *)(extraout_A0_00 + 0xb6) = DAT_000a0474;
  }
  if (_DAT_000a0476 != 0) {
    *(undefined4 *)(extraout_A0_00 + 0xc0) = DAT_000a0478;
    *(undefined2 *)(extraout_A0_00 + 0xc4) = DAT_000a047c;
    *(undefined2 *)(extraout_A0_00 + 200) = DAT_000a047e;
    *(undefined2 *)(extraout_A0_00 + 0xc6) = DAT_000a0480;
  }
  if (_DAT_000a0482 != 0) {
    *(undefined4 *)(extraout_A0_00 + 0xd0) = DAT_000a0484;
    *(undefined2 *)(extraout_A0_00 + 0xd4) = DAT_000a0488;
    *(undefined2 *)(extraout_A0_00 + 0xd8) = DAT_000a048a;
    *(undefined2 *)(extraout_A0_00 + 0xd6) = DAT_000a048c;
  }
  return;
}


// ==== FUN_00005c66 @ 00005c66

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00005c66(void)

{
  _DAT_00dff0a0 = &DAT_0005cc44;
  _DAT_00dff0a4 = 2;
  _DAT_00dff0b0 = &DAT_0005cc44;
  _DAT_00dff0b4 = 2;
  _DAT_00dff0c0 = &DAT_0005cc44;
  _DAT_00dff0c4 = 2;
  _DAT_00dff0d0 = &DAT_0005cc44;
  _DAT_00dff0d4 = 2;
  _DAT_000a045e = 0;
  _DAT_000a046a = 0;
  _DAT_000a0476 = 0;
  _DAT_000a0482 = 0;
  DAT_000a045c = 0;
  return;
}


// ==== FUN_00005cce @ 00005cce

/* WARNING: Removing unreachable block (ram,0x00005cec) */
/* WARNING: Removing unreachable block (ram,0x00005cf2) */

void FUN_00005cce(void)

{
                    /* WARNING: Do nothing block with infinite loop */
  do {
  } while( true );
}


// ==== FUN_00005cf4 @ 00005cf4

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00005cf4(void)

{
  DAT_000a045c._1_1_ = (byte)DAT_000a045c | 1;
  _DAT_000a045e = 1;
  DAT_000a0460 = 0x40000;
  DAT_000a0464 = 0xca4;
  DAT_000a0466 = 0x40;
  DAT_000a0468 = 0x1c2;
  return;
}


// ==== FUN_00005d28 @ 00005d28

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00005d28(void)

{
  DAT_000a045c._1_1_ = (byte)DAT_000a045c | 2;
  _DAT_000a046a = 1;
  DAT_000a046c = 0x4452c;
  DAT_000a0470 = 0xb96;
  DAT_000a0472 = 0x40;
  DAT_000a0474 = 300;
  return;
}


// ==== FUN_00005d5c @ 00005d5c

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00005d5c(void)

{
  DAT_000a045c._1_1_ = (byte)DAT_000a045c | 2;
  _DAT_000a046a = 1;
  DAT_000a046c = 0x45c58;
  DAT_000a0470 = 0x222c;
  DAT_000a0472 = 0x40;
  DAT_000a0474 = 400;
  return;
}


// ==== FUN_00005d90 @ 00005d90

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00005d90(void)

{
  DAT_000a045c._1_1_ = (byte)DAT_000a045c | 2;
  _DAT_000a046a = 1;
  DAT_000a046c = 0x41948;
  DAT_000a0470 = 0x15f2;
  DAT_000a0472 = 0x40;
  DAT_000a0474 = 500;
  return;
}


// ==== FUN_00005dc4 @ 00005dc4

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00005dc4(void)

{
  int in_D0;
  int unaff_D3;
  
  if ((in_D0 < *_DAT_00005e0c || _DAT_00005e0c[1] < in_D0) ||
     (unaff_D3 < *_DAT_00005e0c || _DAT_00005e0c[1] < unaff_D3)) {
    DAT_000a045c._1_1_ = (byte)DAT_000a045c | 4;
    _DAT_000a0476 = 1;
    DAT_000a0478 = 0x4a0b0;
    DAT_000a047c = 0x3e35;
    DAT_000a047e = 0x40;
    DAT_000a0480 = 300;
  }
  return;
}


// ==== FUN_00005e14 @ 00005e14

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00005e14(void)

{
  DAT_000a045c._1_1_ = (byte)DAT_000a045c | 4;
  _DAT_000a0476 = 1;
  DAT_000a0478 = 0x51d1a;
  DAT_000a047c = 0x3e35;
  DAT_000a047e = 0x40;
  DAT_000a0480 = 300;
  return;
}


// ==== FUN_00005e48 @ 00005e48

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00005e48(void)

{
  DAT_000a045c._1_1_ = (byte)DAT_000a045c | 4;
  _DAT_000a0476 = 1;
  DAT_000a0478 = 0x59984;
  DAT_000a047c = 0x1960;
  DAT_000a047e = 0x1a;
  DAT_000a0480 = 0x82;
  return;
}


// ==== FUN_00005e7c @ 00005e7c

void FUN_00005e7c(void)

{
  ushort uVar1;
  byte bVar2;
  int iVar3;
  int iVar5;
  short sVar7;
  short sVar8;
  int *piVar9;
  int *extraout_A0;
  int *extraout_A0_00;
  int *extraout_A0_01;
  int *extraout_A0_02;
  int *extraout_A0_03;
  int *extraout_A0_04;
  short sVar4;
  short sVar6;
  
  piVar9 = (int *)(&DAT_00096828 + (uint)(ushort)(DAT_000a04ec - 1) * 0x10);
  sVar8 = DAT_000a04ec;
  while (iVar3 = DAT_00099646, sVar8 = sVar8 + -1, sVar7 = DAT_000a04d8, sVar8 != -1) {
    while ((short)(sVar7 + -1) != -1) {
      piVar9[3] = iVar3 + piVar9[3];
      *piVar9 = piVar9[2] + *piVar9;
      piVar9[1] = piVar9[3] + piVar9[1];
      sVar7 = sVar7 + -1;
    }
    sVar4 = (short)((uint)*piVar9 >> 8);
    iVar3 = (int)sVar4 * (int)DAT_000a04e8;
    uVar1 = ((short)(iVar3 >> 0xf) - DAT_000a04e4) + 0xa0;
    iVar3 = CONCAT22((short)(char)((uint)iVar3 >> 0x18) >> 7,uVar1);
    sVar6 = (short)((uint)piVar9[1] >> 8);
    iVar5 = (int)sVar6 * (int)DAT_000a04e8;
    sVar7 = ((short)(iVar5 >> 0xf) - DAT_000a04e6) + 0x76;
    iVar5 = CONCAT22((short)(char)((uint)iVar5 >> 0x18) >> 7,sVar7);
    if ((iVar3 < *(short *)(uint)DAT_00006756 || ((short *)(uint)DAT_00006756)[1] < iVar3) ||
       (iVar5 < *(short *)(uint)DAT_0000675a || ((short *)(uint)DAT_0000675a)[1] < iVar5)) {
      iVar3 = (int)sVar4 * (int)DAT_000a04ea;
      uVar1 = (short)(iVar3 >> 0xf) + 0xa0;
      iVar3 = CONCAT22((short)(char)((uint)iVar3 >> 0x18) >> 7,uVar1);
      iVar5 = (int)sVar6 * (int)DAT_000a04ea;
      sVar7 = (short)(iVar5 >> 0xf) + 0x80;
      iVar5 = CONCAT22((short)(char)((uint)iVar5 >> 0x18) >> 7,sVar7);
      if ((iVar3 < *(short *)(uint)DAT_0000675e || ((short *)(uint)DAT_0000675e)[1] < iVar3) ||
         ((iVar5 < *(short *)(uint)DAT_00006762 || ((short *)(uint)DAT_00006762)[1] < iVar5 ||
          ((*(byte *)(DAT_000a04d4 + (short)((uVar1 >> 3) + sVar7 * 0x28)) &
           '\x01' << ((byte)uVar1 & 7 ^ 7)) != 0)))) {
        FUN_000060d8();
        piVar9 = extraout_A0_04;
      }
    }
    else {
      bVar2 = (byte)uVar1 & 7 ^ 7;
      sVar7 = (uVar1 >> 3) + sVar7 * 0x28;
      if ((*(byte *)(DAT_000a049c + sVar7) & '\x01' << bVar2) == 0) {
        if ((*(byte *)(DAT_000a04a4 + sVar7) & '\x01' << bVar2) == 0) {
          if ((*(byte *)(DAT_000a04ac + sVar7) & '\x01' << bVar2) == 0) {
            if ((*(byte *)(DAT_000a04b4 + sVar7) & '\x01' << bVar2) == 0) {
              if ((*(byte *)(DAT_000a04bc + sVar7) & '\x01' << bVar2) == 0) {
                *(byte *)(DAT_000a04c4 + sVar7) = *(byte *)(DAT_000a04c4 + sVar7) | '\x01' << bVar2;
              }
              else {
                DAT_00006bae = (piVar9[2] - DAT_00006bae >> (DAT_000a0526 & 0x3f)) + DAT_00006bae;
                DAT_00006bb2 = (piVar9[3] - DAT_00006bb2 >> (DAT_000a0526 & 0x3f)) + DAT_00006bb2;
                FUN_00005e48();
                DAT_000a057e = DAT_000a057e + -1;
                FUN_000060d8();
                piVar9 = extraout_A0_03;
              }
            }
            else {
              DAT_00006a94 = (piVar9[2] - DAT_00006a94 >> (DAT_000a051c & 0x3f)) + DAT_00006a94;
              DAT_00006a98 = (piVar9[3] - DAT_00006a98 >> (DAT_000a051c & 0x3f)) + DAT_00006a98;
              FUN_00005e48();
              DAT_000a057c = DAT_000a057c + -1;
              FUN_000060d8();
              piVar9 = extraout_A0_02;
            }
          }
          else {
            DAT_0000697a = (piVar9[2] - DAT_0000697a >> (DAT_000a0512 & 0x3f)) + DAT_0000697a;
            DAT_0000697e = (piVar9[3] - DAT_0000697e >> (DAT_000a0512 & 0x3f)) + DAT_0000697e;
            FUN_00005e48();
            DAT_000a057a = DAT_000a057a + -1;
            FUN_000060d8();
            piVar9 = extraout_A0_01;
          }
        }
        else {
          DAT_00006860 = (piVar9[2] - DAT_00006860 >> (DAT_000a0508 & 0x3f)) + DAT_00006860;
          DAT_00006864 = (piVar9[3] - DAT_00006864 >> (DAT_000a0508 & 0x3f)) + DAT_00006864;
          FUN_00005e48();
          DAT_000a0578 = DAT_000a0578 + -1;
          FUN_000060d8();
          piVar9 = extraout_A0_00;
        }
      }
      else {
        FUN_000060d8();
        piVar9 = extraout_A0;
      }
    }
    piVar9 = piVar9 + -4;
  }
  return;
}


// ==== FUN_000060d8 @ 000060d8

void FUN_000060d8(void)

{
  int iVar1;
  undefined4 *in_A0;
  
  iVar1 = (uint)(ushort)(DAT_000a04ec - 1) * 0x10;
  *in_A0 = *(undefined4 *)(&DAT_00096828 + iVar1);
  in_A0[1] = *(undefined4 *)(&DAT_0009682c + iVar1);
  in_A0[2] = *(undefined4 *)(&DAT_00096830 + iVar1);
  in_A0[3] = *(undefined4 *)(&DAT_00096834 + iVar1);
  DAT_000a04ec = DAT_000a04ec + -1;
  return;
}


// ==== FUN_0000610c @ 0000610c

void FUN_0000610c(void)

{
  code *pcVar1;
  ushort uVar2;
  undefined4 uVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  undefined4 uVar6;
  undefined4 uVar7;
  undefined4 uVar8;
  undefined4 uVar9;
  undefined4 uVar10;
  undefined2 uVar11;
  undefined2 uVar12;
  undefined2 uVar13;
  undefined2 uVar14;
  byte bVar17;
  int iVar15;
  int iVar18;
  short sVar20;
  short sVar21;
  undefined *puVar22;
  undefined *extraout_A0;
  undefined *extraout_A0_00;
  undefined *extraout_A0_01;
  int extraout_A0_02;
  undefined *extraout_A0_03;
  undefined *extraout_A0_04;
  undefined *extraout_A0_05;
  undefined *extraout_A0_06;
  undefined *extraout_A0_07;
  undefined **ppuVar23;
  undefined **extraout_A1;
  undefined **extraout_A1_00;
  undefined **extraout_A1_01;
  undefined **extraout_A1_02;
  undefined **extraout_A1_03;
  undefined **extraout_A1_04;
  undefined **extraout_A1_05;
  undefined **extraout_A1_06;
  short sVar16;
  short sVar19;
  
  puVar22 = &DAT_00098da8 + (uint)(ushort)(DAT_000a04ee - 1) * 0x16;
  ppuVar23 = &PTR_LAB_000063d0;
  sVar21 = DAT_000a04ee;
  while (sVar21 = sVar21 + -1, sVar21 != -1) {
    bVar17 = puVar22[1];
    pcVar1 = (code *)ppuVar23[(short)(ushort)bVar17];
    sVar20 = DAT_000a04d8;
    while( true ) {
      uVar14 = DAT_000a057e;
      uVar13 = DAT_000a057c;
      uVar12 = DAT_000a057a;
      uVar11 = DAT_000a0578;
      uVar10 = DAT_00006bb2;
      uVar9 = DAT_00006bae;
      uVar8 = DAT_00006a98;
      uVar7 = DAT_00006a94;
      uVar6 = DAT_0000697e;
      uVar5 = DAT_0000697a;
      uVar4 = DAT_00006864;
      uVar3 = DAT_00006860;
      sVar20 = sVar20 + -1;
      if (sVar20 == -1) break;
      bVar17 = (*pcVar1)();
      puVar22 = extraout_A0;
      ppuVar23 = extraout_A1;
    }
    if (bVar17 == 0) {
      sVar16 = (short)((uint)*(undefined4 *)(puVar22 + 2) >> 8);
      iVar15 = (int)sVar16 * (int)DAT_000a04e8;
      uVar2 = ((short)(iVar15 >> 0xf) - DAT_000a04e4) + 0xa0;
      iVar15 = CONCAT22((short)(char)((uint)iVar15 >> 0x18) >> 7,uVar2);
      sVar19 = (short)((uint)*(undefined4 *)(puVar22 + 6) >> 8);
      iVar18 = (int)sVar19 * (int)DAT_000a04e8;
      sVar20 = ((short)(iVar18 >> 0xf) - DAT_000a04e6) + 0x76;
      iVar18 = CONCAT22((short)(char)((uint)iVar18 >> 0x18) >> 7,sVar20);
      if ((iVar15 < *(short *)(uint)DAT_00006756 || ((short *)(uint)DAT_00006756)[1] < iVar15) ||
         (iVar18 < *(short *)(uint)DAT_0000675a || ((short *)(uint)DAT_0000675a)[1] < iVar18)) {
        iVar15 = (int)sVar16 * (int)DAT_000a04ea;
        uVar2 = (short)(iVar15 >> 0xf) + 0xa0;
        iVar15 = CONCAT22((short)(char)((uint)iVar15 >> 0x18) >> 7,uVar2);
        iVar18 = (int)sVar19 * (int)DAT_000a04ea;
        sVar20 = (short)(iVar18 >> 0xf) + 0x80;
        iVar18 = CONCAT22((short)(char)((uint)iVar18 >> 0x18) >> 7,sVar20);
        if ((iVar15 < *(short *)(uint)DAT_0000675e || ((short *)(uint)DAT_0000675e)[1] < iVar15) ||
           ((iVar18 < *(short *)(uint)DAT_00006762 || ((short *)(uint)DAT_00006762)[1] < iVar18 ||
            ((*(byte *)(DAT_000a04d4 + (short)((uVar2 >> 3) + sVar20 * 0x28)) &
             '\x01' << ((byte)uVar2 & 7 ^ 7)) != 0)))) {
          *(int *)(puVar22 + 2) = *(int *)(puVar22 + 2) - *(int *)(puVar22 + 10);
          *(int *)(puVar22 + 6) = *(int *)(puVar22 + 6) - *(int *)(puVar22 + 0xe);
          FUN_000065de();
          FUN_00006390();
          puVar22 = extraout_A0_07;
          ppuVar23 = extraout_A1_06;
        }
      }
      else {
        bVar17 = (byte)uVar2 & 7 ^ 7;
        sVar20 = (uVar2 >> 3) + sVar20 * 0x28;
        if ((*(byte *)(DAT_000a049c + sVar20) & '\x01' << bVar17) == 0) {
          if ((*(byte *)(DAT_000a04a4 + sVar20) & '\x01' << bVar17) == 0) {
            if ((*(byte *)(DAT_000a04ac + sVar20) & '\x01' << bVar17) == 0) {
              if ((*(byte *)(DAT_000a04b4 + sVar20) & '\x01' << bVar17) == 0) {
                if ((*(byte *)(DAT_000a04bc + sVar20) & '\x01' << bVar17) == 0) {
                  *(byte *)(DAT_000a04c4 + sVar20) =
                       *(byte *)(DAT_000a04c4 + sVar20) | '\x01' << bVar17;
                }
                else {
                  FUN_000066f0();
                  DAT_00006bae = uVar9;
                  DAT_00006bb2 = uVar10;
                  DAT_000a057e = uVar14;
                  FUN_000065de();
                  FUN_00006390();
                  puVar22 = extraout_A0_06;
                  ppuVar23 = extraout_A1_05;
                }
              }
              else {
                FUN_000066f0();
                DAT_00006a94 = uVar7;
                DAT_00006a98 = uVar8;
                DAT_000a057c = uVar13;
                FUN_000065de();
                FUN_00006390();
                puVar22 = extraout_A0_05;
                ppuVar23 = extraout_A1_04;
              }
            }
            else {
              FUN_000066f0();
              DAT_0000697a = uVar5;
              DAT_0000697e = uVar6;
              DAT_000a057a = uVar12;
              FUN_000065de();
              FUN_00006390();
              puVar22 = extraout_A0_04;
              ppuVar23 = extraout_A1_03;
            }
          }
          else {
            FUN_000066f0();
            DAT_00006860 = uVar3;
            DAT_00006864 = uVar4;
            DAT_000a0578 = uVar11;
            *(int *)(extraout_A0_02 + 2) =
                 *(int *)(extraout_A0_02 + 2) - *(int *)(extraout_A0_02 + 10);
            *(int *)(extraout_A0_02 + 6) =
                 *(int *)(extraout_A0_02 + 6) - *(int *)(extraout_A0_02 + 0xe);
            FUN_000065de();
            FUN_00006390();
            puVar22 = extraout_A0_03;
            ppuVar23 = extraout_A1_02;
          }
        }
        else {
          FUN_000065de();
          FUN_00006390();
          puVar22 = extraout_A0_01;
          ppuVar23 = extraout_A1_01;
        }
      }
    }
    else {
      FUN_000065de();
      FUN_00006390();
      puVar22 = extraout_A0_00;
      ppuVar23 = extraout_A1_00;
    }
    puVar22 = puVar22 + -0x16;
  }
  return;
}


// ==== FUN_00006390 @ 00006390

void FUN_00006390(void)

{
  int iVar1;
  undefined2 *in_A0;
  
  iVar1 = (uint)(ushort)(DAT_000a04ee - 1) * 0x16;
  *in_A0 = *(undefined2 *)(&DAT_00098da8 + iVar1);
  *(undefined4 *)(in_A0 + 1) = *(undefined4 *)(&DAT_00098daa + iVar1);
  *(undefined4 *)(in_A0 + 3) = *(undefined4 *)(&DAT_00098dae + iVar1);
  *(undefined4 *)(in_A0 + 5) = *(undefined4 *)(&DAT_00098db2 + iVar1);
  *(undefined4 *)(in_A0 + 7) = *(undefined4 *)(&DAT_00098db6 + iVar1);
  *(undefined4 *)(in_A0 + 9) = *(undefined4 *)(&DAT_00098dba + iVar1);
  DAT_000a04ee = DAT_000a04ee + -1;
  return;
}


// ==== FUN_000065de @ 000065de

void FUN_000065de(void)

{
  int in_A0;
  
  (**(code **)(&LAB_000065f2 + (short)(ushort)*(byte *)(in_A0 + 1) * 4))();
  return;
}


// ==== FUN_000066f0 @ 000066f0

void FUN_000066f0(void)

{
  int in_A0;
  
  (*(code *)(&PTR_LAB_00006704)[(short)(ushort)*(byte *)(in_A0 + 1)])();
  return;
}


// ==== FUN_00006766 @ 00006766

void FUN_00006766(void)

{
  short sVar1;
  short sVar2;
  undefined4 uVar3;
  undefined4 uVar4;
  uint uVar5;
  ushort uVar6;
  short *psVar7;
  short *psVar8;
  undefined2 *puVar9;
  undefined4 unaff_A3;
  undefined *puVar10;
  undefined4 unaff_A5;
  undefined4 uVar11;
  
  DAT_0000686e = ((short)((int)DAT_0000686a * (int)DAT_000a04e8 >> 0xf) - DAT_000a04e4) + 0xa0;
  uVar3 = CONCAT22((short)(char)((uint)((int)DAT_0000686a * (int)DAT_000a04e8) >> 0x18) >> 7,
                   DAT_0000686e);
  DAT_00006870 = ((short)((int)DAT_0000686c * (int)DAT_000a04e8 >> 0xf) - DAT_000a04e6) + 0x76;
  uVar4 = CONCAT22((short)(char)((uint)((int)DAT_0000686c * (int)DAT_000a04e8) >> 0x18) >> 7,
                   DAT_00006870);
  DAT_000a0548 = DAT_00006870 + DAT_000a0548;
  DAT_000a054a = DAT_00006870 + DAT_000a054a;
  psVar8 = *(short **)(PTR_DAT_0009964a + 0xe);
  puVar9 = &DAT_00094028;
  uVar11 = 0xdff000;
  uVar5 = (uint)*(ushort *)(PTR_DAT_0009964a + 4);
  puVar10 = PTR_DAT_0009964a;
  while (uVar6 = (short)uVar5 - 1, uVar5 = (uint)uVar6, uVar6 != 0xffff) {
    psVar7 = psVar8 + 1;
    sVar1 = *psVar8;
    psVar8 = psVar8 + 2;
    sVar2 = *psVar7;
    FUN_000039d4((short)uVar3 + puVar9[sVar1 * 2],(short)uVar4 + puVar9[sVar1 * 2 + 1],
                 (short)uVar3 + puVar9[sVar2 * 2],(short)uVar4 + puVar9[sVar2 * 2 + 1],uVar3,uVar4,
                 sVar2,uVar5,DAT_000a04a4,psVar8,puVar9,unaff_A3,puVar10,unaff_A5,uVar11);
  }
  return;
}


// ==== FUN_00006802 @ 00006802

undefined4 FUN_00006802(void)

{
  undefined4 uVar1;
  short sVar2;
  
  uVar1 = 0;
  sVar2 = *(short *)(PTR_DAT_0009964a + 4);
  while (sVar2 = sVar2 + -1, sVar2 != -1) {
    uVar1 = FUN_00003d5a();
  }
  return uVar1;
}


// ==== FUN_0000691c @ 0000691c

undefined4 FUN_0000691c(void)

{
  undefined4 uVar1;
  short sVar2;
  
  uVar1 = 0;
  sVar2 = *(short *)(PTR_DAT_0009964e + 4);
  while (sVar2 = sVar2 + -1, sVar2 != -1) {
    uVar1 = FUN_00003d5a();
  }
  return uVar1;
}


// ==== FUN_00006a36 @ 00006a36

undefined4 FUN_00006a36(void)

{
  undefined4 uVar1;
  short sVar2;
  
  uVar1 = 0;
  sVar2 = *(short *)(PTR_DAT_00099652 + 4);
  while (sVar2 = sVar2 + -1, sVar2 != -1) {
    uVar1 = FUN_00003d5a();
  }
  return uVar1;
}


// ==== FUN_00006b50 @ 00006b50

undefined4 FUN_00006b50(void)

{
  undefined4 uVar1;
  short sVar2;
  
  uVar1 = 0;
  sVar2 = *(short *)(PTR_DAT_00099656 + 4);
  while (sVar2 = sVar2 + -1, sVar2 != -1) {
    uVar1 = FUN_00003d5a();
  }
  return uVar1;
}


// ==== FUN_00006bce @ 00006bce

void FUN_00006bce(void)

{
  byte in_D0b;
  undefined1 in_D1b;
  undefined4 unaff_D2;
  undefined4 unaff_D3;
  int iVar1;
  
  if ((short)DAT_000a04ee < 0x10) {
    iVar1 = (uint)DAT_000a04ee * 0x16;
    DAT_000a04ee = DAT_000a04ee + 1;
    (&DAT_00098da8)[iVar1] = in_D1b;
    (&DAT_00098da9)[iVar1] = in_D0b;
    *(undefined4 *)(&DAT_00098daa + iVar1) = unaff_D2;
    *(undefined4 *)(&DAT_00098dae + iVar1) = unaff_D3;
    (**(code **)(&LAB_00006c0a + (short)(ushort)in_D0b * 4))();
  }
  return;
}


// ==== FUN_0000734c @ 0000734c

void FUN_0000734c(void)

{
  int extraout_A1;
  
  FUN_00007450();
  DAT_00007378 = *(undefined4 *)(extraout_A1 + 0x6c);
  DAT_00007470 = extraout_A1;
  *(undefined4 *)(extraout_A1 + 0x6c) = 0x737c;
  return;
}


// ==== FUN_00007368 @ 00007368

void FUN_00007368(void)

{
  *(undefined4 *)(DAT_00007470 + 0x6c) = DAT_00007378;
  return;
}


// ==== FUN_00007450 @ 00007450

void FUN_00007450(void)

{
  if ((*(byte *)(DAT_00000004 + 0x129) & 1) != 0) {
    (**(code **)(DAT_00000004 + -0x1e))();
  }
  return;
}


// ==== FUN_0000750a @ 0000750a

undefined8 FUN_0000750a(void)

{
  byte bVar1;
  ushort uVar2;
  undefined4 in_D0;
  undefined4 in_D1;
  undefined8 uVar3;
  
  DAT_0000858b = DAT_0000858b + 1;
  if (DAT_0000858b < DAT_0000858a) {
    FUN_00007538();
    goto LAB_0000783a;
  }
  DAT_0000858b = 0;
  if (DAT_00008592 != '\0') {
    FUN_00007538();
    bVar1 = DAT_0000858d;
    if (DAT_00008591 != '\0') {
      DAT_00008592 = DAT_00008591;
      DAT_00008591 = '\0';
    }
    uVar2 = DAT_00008594 + 0x10;
    if ((DAT_00008592 != '\0') && (DAT_00008592 = DAT_00008592 + -1, DAT_00008592 != '\0')) {
      uVar2 = DAT_00008594;
    }
    DAT_00008594 = uVar2;
    if (DAT_0000858f != '\0') {
      DAT_0000858f = '\0';
      DAT_0000858d = 0;
      DAT_00008594 = (ushort)bVar1 << 4;
    }
    if (DAT_00008594 < 0x400) goto LAB_0000783a;
    do {
      DAT_00008594 = (ushort)DAT_0000858d << 4;
      DAT_0000858d = 0;
      DAT_0000858e = '\0';
      DAT_0000858c = DAT_0000858c + 1 & 0x7f;
      if (*(byte *)(DAT_00008586 + 0x3b6) <= DAT_0000858c) {
        DAT_0000858c = 0;
      }
LAB_0000783a:
    } while (DAT_0000858e != '\0');
    return CONCAT44(in_D0,in_D1);
  }
  PTR_DAT_00004eb6_3_00008596._0_2_ = 0;
  FUN_000075ce();
  FUN_000075ce();
  FUN_000075ce();
  FUN_000075ce();
  uVar3 = FUN_00007742();
  return uVar3;
}


// ==== FUN_00007538 @ 00007538

void FUN_00007538(void)

{
  FUN_00007848();
  FUN_00007848();
  FUN_00007848();
  FUN_00007848();
  return;
}


// ==== FUN_000075ce @ 000075ce

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

uint FUN_000075ce(void)

{
  int iVar1;
  char cVar2;
  short sVar4;
  uint uVar3;
  byte bVar6;
  ushort uVar5;
  int in_D1;
  int extraout_D1;
  undefined4 uVar7;
  int iVar8;
  short sVar9;
  int in_A0;
  int extraout_A0;
  char *pcVar10;
  int unaff_A3;
  int *unaff_A5;
  ushort *unaff_A6;
  
  if (*(int *)unaff_A6 == 0) {
    FUN_000078b0();
    in_D1 = extraout_D1;
    in_A0 = extraout_A0;
  }
  *(int *)unaff_A6 = *(int *)(in_A0 + in_D1);
  bVar6 = *(byte *)unaff_A6 & 0xf0 | *(byte *)(unaff_A6 + 1) >> 4;
  if (bVar6 != 0) {
    iVar8 = (uint)bVar6 * 0x1e;
    *(int *)(unaff_A6 + 2) = *(int *)(&DAT_0000850a + (bVar6 - 1) * 4);
    unaff_A6[4] = *(ushort *)(unaff_A3 + iVar8);
    unaff_A6[0x14] = *(ushort *)(unaff_A3 + iVar8);
    *(undefined1 *)(unaff_A6 + 9) = *(undefined1 *)(unaff_A3 + 2 + iVar8);
    *(undefined1 *)((int)unaff_A6 + 0x13) = *(undefined1 *)(unaff_A3 + 3 + iVar8);
    sVar4 = *(short *)(unaff_A3 + 4 + iVar8);
    if (sVar4 == 0) {
      *(int *)(unaff_A6 + 5) = *(int *)(unaff_A6 + 2);
      *(int *)(unaff_A6 + 0x12) = *(int *)(unaff_A6 + 2);
      unaff_A6[7] = *(ushort *)(unaff_A3 + 6 + iVar8);
      *(ushort *)(unaff_A5 + 2) = (ushort)*(byte *)((int)unaff_A6 + 0x13);
    }
    else {
      iVar1 = (uint)(ushort)(sVar4 << 1) + *(int *)(unaff_A6 + 2);
      *(int *)(unaff_A6 + 5) = iVar1;
      *(int *)(unaff_A6 + 0x12) = iVar1;
      unaff_A6[4] = *(short *)(unaff_A3 + 6 + iVar8) + *(short *)(unaff_A3 + 4 + iVar8);
      unaff_A6[7] = *(ushort *)(unaff_A3 + 6 + iVar8);
      *(ushort *)(unaff_A5 + 2) = (ushort)*(byte *)((int)unaff_A6 + 0x13);
    }
  }
  if ((*unaff_A6 & 0xfff) != 0) {
    if ((unaff_A6[1] & 0xff0) == 0xe50) {
      FUN_00007dd4();
    }
    else {
      bVar6 = *(byte *)(unaff_A6 + 1) & 0xf;
      if ((bVar6 == 3) || (bVar6 == 5)) {
        FUN_000079ba();
        uVar3 = FUN_00007cdc();
        return uVar3;
      }
      if (bVar6 == 9) {
        FUN_00007cdc();
      }
    }
    sVar4 = 0;
    sVar9 = 0x24;
    do {
      if (*(ushort *)((int)&DAT_00007fda + (int)sVar4) <= (*unaff_A6 & 0xfff)) break;
      sVar4 = sVar4 + 2;
      sVar9 = sVar9 + -1;
    } while (sVar9 != -1);
    unaff_A6[8] = *(ushort *)
                   ((int)&DAT_00007fda + (int)sVar4 + (uint)*(byte *)(unaff_A6 + 9) * 0x48);
    if ((unaff_A6[1] & 0xff0) != 0xed0) {
      _DAT_00dff096 = unaff_A6[10];
      if ((unaff_A6[0xf] & 0x400) == 0) {
        *(undefined1 *)((int)unaff_A6 + 0x1b) = 0;
      }
      if ((unaff_A6[0xf] & 0x4000) == 0) {
        *(undefined1 *)((int)unaff_A6 + 0x1d) = 0;
      }
      *unaff_A5 = *(int *)(unaff_A6 + 2);
      *(ushort *)(unaff_A5 + 1) = unaff_A6[4];
      *(ushort *)((int)unaff_A5 + 6) = unaff_A6[8];
      PTR_DAT_00004eb6_3_00008596._0_2_ = unaff_A6[10] | PTR_DAT_00004eb6_3_00008596._0_2_;
      uVar3 = FUN_00007cdc();
      return uVar3;
    }
  }
  uVar7 = FUN_00007f58();
  bVar6 = *(byte *)(unaff_A6 + 1) & 0xf;
  if (bVar6 == 9) {
    if (*(char *)((int)unaff_A6 + 3) != '\0') {
      *(char *)(unaff_A6 + 0x10) = *(char *)((int)unaff_A6 + 3);
    }
    bVar6 = *(byte *)(unaff_A6 + 0x10);
    uVar5 = (ushort)bVar6 * 0x80;
    if ((short)unaff_A6[4] <= (short)uVar5) {
      unaff_A6[4] = 1;
      return (uint)uVar5;
    }
    unaff_A6[4] = unaff_A6[4] + (ushort)bVar6 * -0x80;
    *(uint *)(unaff_A6 + 2) = (uint)bVar6 * 0x100 + *(int *)(unaff_A6 + 2);
    return (uint)bVar6 * 0x100;
  }
  if (bVar6 == 0xb) {
    DAT_0000858c = *(char *)((int)unaff_A6 + 3) - 1;
    DAT_0000858d = 0;
    DAT_0000858e = 0xff;
    return (uint)DAT_0000858c;
  }
  if (bVar6 == 0xd) {
    bVar6 = (*(byte *)((int)unaff_A6 + 3) & 0xf) + (*(byte *)((int)unaff_A6 + 3) >> 4) * '\n';
    if (0x3f < bVar6) {
      DAT_0000858d = 0;
      DAT_0000858e = 0xff;
      return (uint)bVar6;
    }
    DAT_0000858d = bVar6;
    DAT_0000858e = 0xff;
    return (uint)bVar6;
  }
  if (bVar6 != 0xe) {
    if (bVar6 != 0xf) {
      if (bVar6 == 0xc) {
        uVar3 = (uint)*(byte *)((int)unaff_A6 + 3);
        if (0x40 < *(byte *)((int)unaff_A6 + 3)) {
          uVar3 = 0x40;
        }
        *(char *)((int)unaff_A6 + 0x13) = (char)uVar3;
        *(short *)(unaff_A5 + 2) = (short)uVar3;
        return uVar3;
      }
      uVar3 = FUN_000078b0();
      return uVar3;
    }
    bVar6 = *(byte *)((int)unaff_A6 + 3);
    if (bVar6 == 0) {
      return 0;
    }
    DAT_0000858b = 0;
    DAT_0000858a = bVar6;
    return (uint)bVar6;
  }
  bVar6 = *(byte *)((int)unaff_A6 + 3) >> 4;
  if (bVar6 == 0) {
    bVar6 = (*(byte *)((int)unaff_A6 + 3) & 1) << 1;
    DAT_00bfe001 = bVar6 | DAT_00bfe001 & 0xfd;
    return (uint)bVar6;
  }
  if (bVar6 != 1) {
    if (bVar6 == 2) {
      if (DAT_0000858b != 0) {
        return 2;
      }
      DAT_00008590 = 0xff;
      unaff_A6[8] = (ushort)(*(byte *)((int)unaff_A6 + 3) & 0xf) + unaff_A6[8];
      if (-1 < (short)((unaff_A6[8] & 0xfff) - 0x358)) {
        unaff_A6[8] = unaff_A6[8] & 0xf000;
        unaff_A6[8] = unaff_A6[8] | 0x358;
      }
      uVar5 = unaff_A6[8];
      *(ushort *)((int)unaff_A5 + 6) = uVar5 & 0xfff;
      return uVar5 & 0xffff0fff;
    }
    if (bVar6 == 3) {
      *(byte *)((int)unaff_A6 + 0x1f) = *(byte *)((int)unaff_A6 + 0x1f) & 0xf0;
      *(byte *)((int)unaff_A6 + 0x1f) =
           *(byte *)((int)unaff_A6 + 3) & 0xf | *(byte *)((int)unaff_A6 + 0x1f);
      return *(byte *)((int)unaff_A6 + 3) & 0xffffff0f;
    }
    if (bVar6 == 4) {
      *(byte *)(unaff_A6 + 0xf) = *(byte *)(unaff_A6 + 0xf) & 0xf0;
      *(byte *)(unaff_A6 + 0xf) = *(byte *)((int)unaff_A6 + 3) & 0xf | *(byte *)(unaff_A6 + 0xf);
      return *(byte *)((int)unaff_A6 + 3) & 0xffffff0f;
    }
    if (bVar6 == 5) {
      *(byte *)(unaff_A6 + 9) = *(byte *)((int)unaff_A6 + 3) & 0xf;
      return *(byte *)((int)unaff_A6 + 3) & 0xffffff0f;
    }
    if (bVar6 == 6) {
      if (DAT_0000858b != 0) {
        return 6;
      }
      bVar6 = *(byte *)((int)unaff_A6 + 3) & 0xf;
      uVar3 = *(byte *)((int)unaff_A6 + 3) & 0xffffff0f;
      if (bVar6 != 0) {
        if (*(char *)(unaff_A6 + 0x11) == '\0') {
          *(byte *)(unaff_A6 + 0x11) = bVar6;
        }
        else {
          cVar2 = *(char *)(unaff_A6 + 0x11) + -1;
          *(char *)(unaff_A6 + 0x11) = cVar2;
          if (cVar2 == '\0') {
            return uVar3;
          }
        }
        DAT_0000858d = *(undefined1 *)((int)unaff_A6 + 0x21);
        DAT_0000858f = 0xff;
        return uVar3;
      }
      uVar5 = DAT_00008594 >> 4;
      *(char *)((int)unaff_A6 + 0x21) = (char)uVar5;
      return (uint)uVar5;
    }
    if (bVar6 == 7) {
      bVar6 = *(char *)((int)unaff_A6 + 3) << 4;
      *(byte *)(unaff_A6 + 0xf) = *(byte *)(unaff_A6 + 0xf) & 0xf;
      *(byte *)(unaff_A6 + 0xf) = bVar6 | *(byte *)(unaff_A6 + 0xf);
      return (uint)bVar6;
    }
    if (bVar6 == 9) {
      bVar6 = *(byte *)((int)unaff_A6 + 3) & 0xf;
      if (bVar6 == 0) {
        return 0;
      }
      if ((DAT_0000858b == 0) && ((*unaff_A6 & 0xfff) != 0)) {
        return (uint)bVar6;
      }
      if ((ushort)((ushort)DAT_0000858b % (ushort)bVar6) != 0) {
        return (uint)bVar6;
      }
    }
    else {
      if (bVar6 == 10) {
        if (DAT_0000858b != 0) {
          return 10;
        }
        *(char *)((int)unaff_A6 + 0x13) =
             (*(byte *)((int)unaff_A6 + 3) & 0xf) + *(char *)((int)unaff_A6 + 0x13);
        if (-1 < (char)(*(char *)((int)unaff_A6 + 0x13) + -0x40)) {
          *(undefined1 *)((int)unaff_A6 + 0x13) = 0x40;
        }
        bVar6 = *(byte *)((int)unaff_A6 + 0x13);
        *(ushort *)(unaff_A5 + 2) = (ushort)bVar6;
        return (uint)bVar6;
      }
      if (bVar6 == 0xb) {
        if (DAT_0000858b != 0) {
          return 0xb;
        }
        bVar6 = *(byte *)((int)unaff_A6 + 0x13) - (*(byte *)((int)unaff_A6 + 3) & 0xf);
        *(byte *)((int)unaff_A6 + 0x13) = bVar6;
        if ((int)((uint)bVar6 << 0x18) < 0) {
          *(undefined1 *)((int)unaff_A6 + 0x13) = 0;
        }
        bVar6 = *(byte *)((int)unaff_A6 + 0x13);
        *(ushort *)(unaff_A5 + 2) = (ushort)bVar6;
        return (uint)bVar6;
      }
      if (bVar6 == 0xc) {
        bVar6 = *(byte *)((int)unaff_A6 + 3) & 0xf;
        if (bVar6 != DAT_0000858b) {
          return (uint)bVar6;
        }
        *(undefined1 *)((int)unaff_A6 + 0x13) = 0;
        *(undefined2 *)(unaff_A5 + 2) = 0;
        return (uint)bVar6;
      }
      if (bVar6 != 0xd) {
        if (bVar6 == 0xe) {
          if (DAT_0000858b != 0) {
            return 0xe;
          }
          bVar6 = *(byte *)((int)unaff_A6 + 3) & 0xf;
          if (DAT_00008592 != '\0') {
            return (uint)bVar6;
          }
          DAT_00008591 = bVar6 + 1;
          return (uint)DAT_00008591;
        }
        if (bVar6 != 0xf) {
          return (uint)bVar6;
        }
        if (DAT_0000858b != 0) {
          return 0xf;
        }
        bVar6 = *(byte *)((int)unaff_A6 + 3) << 4;
        *(byte *)((int)unaff_A6 + 0x1f) = *(byte *)((int)unaff_A6 + 0x1f) & 0xf;
        *(byte *)((int)unaff_A6 + 0x1f) = bVar6 | *(byte *)((int)unaff_A6 + 0x1f);
        if ((*(byte *)((int)unaff_A6 + 3) & 0xf) == 0) {
          return (uint)bVar6;
        }
        bVar6 = *(byte *)((int)unaff_A6 + 0x1f) >> 4;
        uVar3 = (uint)bVar6;
        if (bVar6 != 0) {
          uVar3 = (uint)*(byte *)((int)&PTR_DAT_00007faa + (int)(short)(ushort)bVar6);
          *(char *)((int)unaff_A6 + 0x23) =
               *(byte *)((int)&PTR_DAT_00007faa + (int)(short)(ushort)bVar6) +
               *(char *)((int)unaff_A6 + 0x23);
          if ((*(byte *)((int)unaff_A6 + 0x23) & 0x80) != 0) {
            *(undefined1 *)((int)unaff_A6 + 0x23) = 0;
            pcVar10 = (char *)(*(int *)(unaff_A6 + 0x12) + 1);
            if ((char *)((uint)unaff_A6[7] * 2 + *(int *)(unaff_A6 + 5)) <= pcVar10) {
              pcVar10 = *(char **)(unaff_A6 + 5);
            }
            *(char **)(unaff_A6 + 0x12) = pcVar10;
            uVar3 = CONCAT31(0xffffff,-1 - *pcVar10);
            *pcVar10 = -1 - *pcVar10;
          }
        }
        return uVar3;
      }
      bVar6 = *(byte *)((int)unaff_A6 + 3) & 0xf;
      if (bVar6 != DAT_0000858b) {
        return (uint)bVar6;
      }
      if (*unaff_A6 == 0) {
        return 0;
      }
    }
    _DAT_00dff096 = unaff_A6[10];
    *unaff_A5 = *(int *)(unaff_A6 + 2);
    *(ushort *)(unaff_A5 + 1) = unaff_A6[4];
    FUN_00005cce(uVar7);
    _DAT_00dff096 = unaff_A6[10] | 0x8000;
    uVar3 = FUN_00005cce();
    *unaff_A5 = *(int *)(unaff_A6 + 5);
    unaff_A5[1] = *(int *)(unaff_A6 + 7);
    return uVar3;
  }
  if (DAT_0000858b != 0) {
    return 1;
  }
  DAT_00008590 = 0xff;
  unaff_A6[8] = unaff_A6[8] - (ushort)(*(byte *)((int)unaff_A6 + 3) & 0xf);
  if ((short)((unaff_A6[8] & 0xfff) - 0x71) < 0) {
    unaff_A6[8] = unaff_A6[8] & 0xf000;
    unaff_A6[8] = unaff_A6[8] | 0x71;
  }
  uVar5 = unaff_A6[8];
  *(ushort *)((int)unaff_A5 + 6) = uVar5 & 0xfff;
  return uVar5 & 0xffff0fff;
}


// ==== FUN_00007742 @ 00007742

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined8 FUN_00007742(void)

{
  byte bVar1;
  ushort uVar2;
  undefined8 in_stack_00000000;
  
  FUN_00005cce();
  _DAT_00dff096 = PTR_DAT_00004eb6_3_00008596._0_2_ | 0x8000;
  FUN_00005cce();
  bVar1 = DAT_0000858d;
  _DAT_00dff0d0 = DAT_000084e8;
  _DAT_00dff0d4 = DAT_000084ec;
  _DAT_00dff0c0 = DAT_000084bc;
  _DAT_00dff0c4 = DAT_000084c0;
  _DAT_00dff0b0 = DAT_00008490;
  _DAT_00dff0b4 = DAT_00008494;
  _DAT_00dff0a0 = DAT_00008464;
  _DAT_00dff0a4 = DAT_00008468;
  if (DAT_00008591 != '\0') {
    DAT_00008592 = DAT_00008591;
    DAT_00008591 = '\0';
  }
  uVar2 = DAT_00008594 + 0x10;
  if ((DAT_00008592 != '\0') && (DAT_00008592 = DAT_00008592 + -1, DAT_00008592 != '\0')) {
    uVar2 = DAT_00008594;
  }
  DAT_00008594 = uVar2;
  if (DAT_0000858f != '\0') {
    DAT_0000858f = '\0';
    DAT_0000858d = 0;
    DAT_00008594 = (ushort)bVar1 << 4;
  }
  if (DAT_00008594 < 0x400) goto LAB_0000783a;
  do {
    DAT_00008594 = (ushort)DAT_0000858d << 4;
    DAT_0000858d = 0;
    DAT_0000858e = '\0';
    DAT_0000858c = DAT_0000858c + 1 & 0x7f;
    if (*(byte *)(DAT_00008586 + 0x3b6) <= DAT_0000858c) {
      DAT_0000858c = 0;
    }
LAB_0000783a:
  } while (DAT_0000858e != '\0');
  return in_stack_00000000;
}


// ==== FUN_00007848 @ 00007848

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

uint FUN_00007848(void)

{
  ushort uVar1;
  byte bVar2;
  undefined3 uVar3;
  char cVar5;
  byte bVar6;
  uint uVar4;
  undefined4 extraout_D1;
  ushort uVar7;
  short sVar8;
  ushort *puVar9;
  char *pcVar10;
  undefined4 *unaff_A5;
  ushort *unaff_A6;
  bool bVar11;
  
  FUN_00007f58();
  uVar4 = unaff_A6[1] & 0xffff0fff;
  if ((unaff_A6[1] & 0xfff) == 0) {
    *(ushort *)((int)unaff_A5 + 6) = unaff_A6[8];
    return uVar4;
  }
  bVar6 = *(byte *)(unaff_A6 + 1);
  uVar3 = (undefined3)(uVar4 >> 8);
  bVar2 = bVar6 & 0xf;
  if (bVar2 == 0) {
    uVar4 = (uint)DAT_0000858b % 3;
    if ((short)uVar4 == 0) {
      uVar7 = unaff_A6[8];
    }
    else {
      if ((short)uVar4 == 2) {
        bVar6 = *(byte *)((int)unaff_A6 + 3) & 0xf;
      }
      else {
        bVar6 = *(byte *)((int)unaff_A6 + 3) >> 4;
      }
      uVar4 = (uint)bVar6 << 1;
      puVar9 = &DAT_00007fda + (uint)*(byte *)(unaff_A6 + 9) * 0x24;
      sVar8 = 0x24;
      while (uVar7 = *(ushort *)((int)puVar9 + (int)(short)((ushort)bVar6 << 1)),
            unaff_A6[8] < *puVar9) {
        puVar9 = puVar9 + 1;
        sVar8 = sVar8 + -1;
        if (sVar8 == -1) {
          return uVar4;
        }
      }
    }
    *(ushort *)((int)unaff_A5 + 6) = uVar7;
    return uVar4;
  }
  if (bVar2 == 1) {
LAB_0000792c:
    bVar6 = DAT_00008590 & *(byte *)((int)unaff_A6 + 3);
    DAT_00008590 = 0xff;
    unaff_A6[8] = unaff_A6[8] - (ushort)bVar6;
    if ((short)((unaff_A6[8] & 0xfff) - 0x71) < 0) {
      unaff_A6[8] = unaff_A6[8] & 0xf000;
      unaff_A6[8] = unaff_A6[8] | 0x71;
    }
    uVar7 = unaff_A6[8];
    *(ushort *)((int)unaff_A5 + 6) = uVar7 & 0xfff;
    return uVar7 & 0xffff0fff;
  }
  if (bVar2 == 2) {
LAB_0000797c:
    bVar6 = DAT_00008590 & *(byte *)((int)unaff_A6 + 3);
    DAT_00008590 = 0xff;
    unaff_A6[8] = (ushort)bVar6 + unaff_A6[8];
    if (-1 < (short)((unaff_A6[8] & 0xfff) - 0x358)) {
      unaff_A6[8] = unaff_A6[8] & 0xf000;
      unaff_A6[8] = unaff_A6[8] | 0x358;
    }
    uVar7 = unaff_A6[8];
    *(ushort *)((int)unaff_A5 + 6) = uVar7 & 0xfff;
    return uVar7 & 0xffff0fff;
  }
  if (bVar2 == 3) {
    cVar5 = *(char *)((int)unaff_A6 + 3);
    if (cVar5 != '\0') {
      *(char *)((int)unaff_A6 + 0x17) = cVar5;
      *(undefined1 *)((int)unaff_A6 + 3) = 0;
    }
    if (unaff_A6[0xc] == 0) {
      return CONCAT31(uVar3,cVar5);
    }
    if (*(char *)(unaff_A6 + 0xb) == '\0') {
      unaff_A6[8] = (ushort)*(byte *)((int)unaff_A6 + 0x17) + unaff_A6[8];
      uVar4 = (uint)unaff_A6[0xc];
      if ((short)unaff_A6[0xc] <= (short)unaff_A6[8]) {
        unaff_A6[8] = unaff_A6[0xc];
        unaff_A6[0xc] = 0;
      }
    }
    else {
      unaff_A6[8] = unaff_A6[8] - (ushort)*(byte *)((int)unaff_A6 + 0x17);
      uVar4 = (uint)unaff_A6[0xc];
      if ((short)unaff_A6[8] <= (short)unaff_A6[0xc]) {
        unaff_A6[8] = unaff_A6[0xc];
        unaff_A6[0xc] = 0;
      }
    }
    uVar7 = unaff_A6[8];
    uVar4 = CONCAT31((int3)(uVar4 >> 8),*(byte *)((int)unaff_A6 + 0x1f)) & 0xffffff0f;
    if ((*(byte *)((int)unaff_A6 + 0x1f) & 0xf) != 0) {
      uVar4 = 0;
      do {
        if (*(ushort *)
             ((int)&DAT_00007fda +
             (int)(short)uVar4 + (int)(short)((ushort)*(byte *)(unaff_A6 + 9) * 0x48)) <= uVar7)
        goto LAB_00007aa0;
        uVar1 = (short)uVar4 + 2;
        uVar4 = (uint)uVar1;
      } while (uVar1 < 0x48);
      uVar4 = 0x46;
LAB_00007aa0:
      uVar7 = *(ushort *)
               ((int)&DAT_00007fda +
               (int)(short)uVar4 + (int)(short)((ushort)*(byte *)(unaff_A6 + 9) * 0x48));
    }
    *(ushort *)((int)unaff_A5 + 6) = uVar7;
    return uVar4;
  }
  if (bVar2 == 4) {
    if (*(byte *)((int)unaff_A6 + 3) != 0) {
      bVar6 = *(byte *)(unaff_A6 + 0xd);
      bVar2 = *(byte *)((int)unaff_A6 + 3) & 0xf;
      if (bVar2 != 0) {
        bVar6 = bVar2 | bVar6 & 0xf0;
      }
      bVar2 = *(byte *)((int)unaff_A6 + 3) & 0xf0;
      if (bVar2 != 0) {
        bVar6 = bVar2 | bVar6 & 0xf;
      }
      *(byte *)(unaff_A6 + 0xd) = bVar6;
    }
    uVar7 = (ushort)CONCAT31(uVar3,*(undefined1 *)((int)unaff_A6 + 0x1b)) >> 2 & 0x1f;
    if ((*(byte *)(unaff_A6 + 0xf) & 3) == 0) {
      uVar7 = (ushort)(byte)(&DAT_00007fba)[(short)uVar7];
    }
    else {
      cVar5 = (char)uVar7;
      if ((*(byte *)(unaff_A6 + 0xf) & 3) == 1) {
        if (*(char *)((int)unaff_A6 + 0x1b) < '\0') {
          uVar7 = (ushort)(byte)(cVar5 * -8 - 1);
        }
        else {
          uVar7 = (ushort)(byte)(cVar5 * '\b');
        }
      }
      else {
        uVar7 = 0xff;
      }
    }
    uVar7 = (ushort)(uVar7 * (*(byte *)(unaff_A6 + 0xd) & 0xf)) >> 7;
    if (*(char *)((int)unaff_A6 + 0x1b) < '\0') {
      uVar7 = -uVar7;
    }
    *(ushort *)((int)unaff_A5 + 6) = uVar7 + unaff_A6[8];
    *(char *)((int)unaff_A6 + 0x1b) =
         (*(byte *)(unaff_A6 + 0xd) >> 2 & 0x3c) + *(char *)((int)unaff_A6 + 0x1b);
    return *(byte *)(unaff_A6 + 0xd) >> 2 & 0xffff003c;
  }
  if (bVar2 == 5) {
    FUN_00007a2a();
  }
  else if (bVar2 == 6) {
    FUN_00007ad4();
  }
  else {
    if (bVar2 == 0xe) {
      bVar6 = *(byte *)((int)unaff_A6 + 3) >> 4;
      uVar4 = CONCAT31(uVar3,bVar6);
      if (bVar6 == 0) {
        bVar6 = (*(byte *)((int)unaff_A6 + 3) & 1) << 1;
        DAT_00bfe001 = bVar6 | DAT_00bfe001 & 0xfd;
        return CONCAT31(uVar3,bVar6);
      }
      if (bVar6 == 1) {
        if (DAT_0000858b != 0) {
          return uVar4;
        }
        DAT_00008590 = 0xf;
        goto LAB_0000792c;
      }
      if (bVar6 == 2) {
        if (DAT_0000858b != 0) {
          return uVar4;
        }
        DAT_00008590 = 0xf;
        goto LAB_0000797c;
      }
      if (bVar6 == 3) {
        *(byte *)((int)unaff_A6 + 0x1f) = *(byte *)((int)unaff_A6 + 0x1f) & 0xf0;
        *(byte *)((int)unaff_A6 + 0x1f) =
             *(byte *)((int)unaff_A6 + 3) & 0xf | *(byte *)((int)unaff_A6 + 0x1f);
        return CONCAT31(uVar3,*(byte *)((int)unaff_A6 + 3)) & 0xffffff0f;
      }
      if (bVar6 == 4) {
        *(byte *)(unaff_A6 + 0xf) = *(byte *)(unaff_A6 + 0xf) & 0xf0;
        *(byte *)(unaff_A6 + 0xf) = *(byte *)((int)unaff_A6 + 3) & 0xf | *(byte *)(unaff_A6 + 0xf);
        return CONCAT31(uVar3,*(byte *)((int)unaff_A6 + 3)) & 0xffffff0f;
      }
      if (bVar6 == 5) {
        *(byte *)(unaff_A6 + 9) = *(byte *)((int)unaff_A6 + 3) & 0xf;
        return CONCAT31(uVar3,*(byte *)((int)unaff_A6 + 3)) & 0xffffff0f;
      }
      if (bVar6 == 6) {
        if (DAT_0000858b != 0) {
          return uVar4;
        }
        bVar6 = *(byte *)((int)unaff_A6 + 3) & 0xf;
        uVar4 = CONCAT31(uVar3,*(byte *)((int)unaff_A6 + 3)) & 0xffffff0f;
        if (bVar6 != 0) {
          if (*(char *)(unaff_A6 + 0x11) == '\0') {
            *(byte *)(unaff_A6 + 0x11) = bVar6;
          }
          else {
            cVar5 = *(char *)(unaff_A6 + 0x11) + -1;
            *(char *)(unaff_A6 + 0x11) = cVar5;
            if (cVar5 == '\0') {
              return uVar4;
            }
          }
          DAT_0000858d = *(undefined1 *)((int)unaff_A6 + 0x21);
          DAT_0000858f = 0xff;
          return uVar4;
        }
        uVar7 = DAT_00008594 >> 4;
        *(char *)((int)unaff_A6 + 0x21) = (char)uVar7;
        return (uint)uVar7;
      }
      if (bVar6 == 7) {
        bVar6 = *(char *)((int)unaff_A6 + 3) << 4;
        *(byte *)(unaff_A6 + 0xf) = *(byte *)(unaff_A6 + 0xf) & 0xf;
        *(byte *)(unaff_A6 + 0xf) = bVar6 | *(byte *)(unaff_A6 + 0xf);
        return CONCAT31(uVar3,bVar6);
      }
      if (bVar6 == 9) {
        bVar6 = *(byte *)((int)unaff_A6 + 3) & 0xf;
        if (bVar6 == 0) {
          return 0;
        }
        if ((DAT_0000858b == 0) && ((*unaff_A6 & 0xfff) != 0)) {
          return (uint)bVar6;
        }
        if ((ushort)((ushort)DAT_0000858b % (ushort)bVar6) != 0) {
          return (uint)bVar6;
        }
LAB_00007e68:
        _DAT_00dff096 = unaff_A6[10];
        *unaff_A5 = *(undefined4 *)(unaff_A6 + 2);
        *(ushort *)(unaff_A5 + 1) = unaff_A6[4];
        FUN_00005cce(extraout_D1);
        _DAT_00dff096 = unaff_A6[10] | 0x8000;
        uVar4 = FUN_00005cce();
        *unaff_A5 = *(undefined4 *)(unaff_A6 + 5);
        unaff_A5[1] = *(undefined4 *)(unaff_A6 + 7);
        return uVar4;
      }
      if (bVar6 != 10) {
        if (bVar6 != 0xb) {
          if (bVar6 == 0xc) {
            bVar6 = *(byte *)((int)unaff_A6 + 3) & 0xf;
            if (bVar6 != DAT_0000858b) {
              return (uint)bVar6;
            }
            *(undefined1 *)((int)unaff_A6 + 0x13) = 0;
            *(undefined2 *)(unaff_A5 + 2) = 0;
            return (uint)bVar6;
          }
          if (bVar6 != 0xd) {
            if (bVar6 == 0xe) {
              if (DAT_0000858b != 0) {
                return uVar4;
              }
              bVar6 = *(byte *)((int)unaff_A6 + 3) & 0xf;
              if (DAT_00008592 != '\0') {
                return (uint)bVar6;
              }
              DAT_00008591 = bVar6 + 1;
              return (uint)DAT_00008591;
            }
            if (bVar6 != 0xf) {
              return uVar4;
            }
            if (DAT_0000858b != 0) {
              return uVar4;
            }
            bVar6 = *(byte *)((int)unaff_A6 + 3) << 4;
            *(byte *)((int)unaff_A6 + 0x1f) = *(byte *)((int)unaff_A6 + 0x1f) & 0xf;
            *(byte *)((int)unaff_A6 + 0x1f) = bVar6 | *(byte *)((int)unaff_A6 + 0x1f);
            if ((*(byte *)((int)unaff_A6 + 3) & 0xf) == 0) {
              return CONCAT31(uVar3,bVar6);
            }
            bVar6 = *(byte *)((int)unaff_A6 + 0x1f) >> 4;
            uVar4 = (uint)bVar6;
            if (bVar6 != 0) {
              uVar4 = (uint)*(byte *)((int)&PTR_DAT_00007faa + (int)(short)(ushort)bVar6);
              *(char *)((int)unaff_A6 + 0x23) =
                   *(byte *)((int)&PTR_DAT_00007faa + (int)(short)(ushort)bVar6) +
                   *(char *)((int)unaff_A6 + 0x23);
              if ((*(byte *)((int)unaff_A6 + 0x23) & 0x80) != 0) {
                *(undefined1 *)((int)unaff_A6 + 0x23) = 0;
                pcVar10 = (char *)(*(int *)(unaff_A6 + 0x12) + 1);
                if ((char *)((uint)unaff_A6[7] * 2 + *(int *)(unaff_A6 + 5)) <= pcVar10) {
                  pcVar10 = *(char **)(unaff_A6 + 5);
                }
                *(char **)(unaff_A6 + 0x12) = pcVar10;
                uVar4 = CONCAT31(0xffffff,-1 - *pcVar10);
                *pcVar10 = -1 - *pcVar10;
              }
            }
            return uVar4;
          }
          bVar6 = *(byte *)((int)unaff_A6 + 3) & 0xf;
          if (bVar6 != DAT_0000858b) {
            return (uint)bVar6;
          }
          if (*unaff_A6 == 0) {
            return 0;
          }
          goto LAB_00007e68;
        }
        if (DAT_0000858b != 0) {
          return uVar4;
        }
        bVar6 = *(byte *)((int)unaff_A6 + 3);
        goto LAB_00007c58;
      }
      if (DAT_0000858b != 0) {
        return uVar4;
      }
      bVar6 = *(byte *)((int)unaff_A6 + 3) & 0xf;
      goto LAB_00007c32;
    }
    *(ushort *)((int)unaff_A5 + 6) = unaff_A6[8];
    if (bVar2 == 7) {
      if (*(byte *)((int)unaff_A6 + 3) != 0) {
        bVar6 = *(byte *)(unaff_A6 + 0xe);
        bVar2 = *(byte *)((int)unaff_A6 + 3) & 0xf;
        if (bVar2 != 0) {
          bVar6 = bVar2 | bVar6 & 0xf0;
        }
        bVar2 = *(byte *)((int)unaff_A6 + 3) & 0xf0;
        if (bVar2 != 0) {
          bVar6 = bVar2 | bVar6 & 0xf;
        }
        *(byte *)(unaff_A6 + 0xe) = bVar6;
      }
      uVar7 = (ushort)(CONCAT31(uVar3,*(undefined1 *)((int)unaff_A6 + 0x1d)) >> 2) & 0x1f;
      bVar6 = *(byte *)(unaff_A6 + 0xf) >> 4 & 3;
      if (bVar6 == 0) {
        uVar7 = (ushort)(byte)(&DAT_00007fba)[(short)uVar7];
      }
      else {
        cVar5 = (char)uVar7;
        if (bVar6 == 1) {
          if (*(char *)((int)unaff_A6 + 0x1b) < '\0') {
            uVar7 = (ushort)(byte)(cVar5 * -8 - 1);
          }
          else {
            uVar7 = (ushort)(byte)(cVar5 * '\b');
          }
        }
        else {
          uVar7 = 0xff;
        }
      }
      uVar7 = (ushort)(uVar7 * (*(byte *)(unaff_A6 + 0xe) & 0xf)) >> 6;
      if (*(char *)((int)unaff_A6 + 0x1d) < '\0') {
        uVar7 = *(byte *)((int)unaff_A6 + 0x13) - uVar7;
        bVar11 = (short)uVar7 < 0;
      }
      else {
        uVar7 = uVar7 + *(byte *)((int)unaff_A6 + 0x13);
        bVar11 = false;
      }
      if (bVar11) {
        uVar7 = 0;
      }
      if (0x40 < uVar7) {
        uVar7 = 0x40;
      }
      *(ushort *)(unaff_A5 + 2) = uVar7;
      *(char *)((int)unaff_A6 + 0x1d) =
           (*(byte *)(unaff_A6 + 0xe) >> 2 & 0x3c) + *(char *)((int)unaff_A6 + 0x1d);
      return *(byte *)(unaff_A6 + 0xe) >> 2 & 0xffff003c;
    }
    if (bVar2 != 10) {
      return CONCAT31(uVar3,bVar6) & 0xffffff0f;
    }
  }
  bVar6 = *(byte *)((int)unaff_A6 + 3) >> 4;
  if (bVar6 == 0) {
    bVar6 = *(byte *)((int)unaff_A6 + 3);
LAB_00007c58:
    bVar6 = *(byte *)((int)unaff_A6 + 0x13) - (bVar6 & 0xf);
    *(byte *)((int)unaff_A6 + 0x13) = bVar6;
    if ((short)((ushort)bVar6 << 8) < 0) {
      *(undefined1 *)((int)unaff_A6 + 0x13) = 0;
    }
    bVar6 = *(byte *)((int)unaff_A6 + 0x13);
    *(ushort *)(unaff_A5 + 2) = (ushort)bVar6;
    return (uint)bVar6;
  }
LAB_00007c32:
  *(char *)((int)unaff_A6 + 0x13) = bVar6 + *(char *)((int)unaff_A6 + 0x13);
  if (-1 < (char)(*(char *)((int)unaff_A6 + 0x13) + -0x40)) {
    *(undefined1 *)((int)unaff_A6 + 0x13) = 0x40;
  }
  bVar6 = *(byte *)((int)unaff_A6 + 0x13);
  *(ushort *)(unaff_A5 + 2) = (ushort)bVar6;
  return (uint)bVar6;
}


// ==== FUN_000078b0 @ 000078b0

void FUN_000078b0(void)

{
  int unaff_A5;
  int unaff_A6;
  
  *(undefined2 *)(unaff_A5 + 6) = *(undefined2 *)(unaff_A6 + 0x10);
  return;
}


// ==== FUN_000079ba @ 000079ba

void FUN_000079ba(void)

{
  ushort uVar1;
  ushort *unaff_A6;
  
  uVar1 = 0;
  do {
    if (*(ushort *)((int)&DAT_00007fda + (int)(short)uVar1 + (uint)*(byte *)(unaff_A6 + 9) * 0x48)
        <= (*unaff_A6 & 0xfff)) goto LAB_000079e4;
    uVar1 = uVar1 + 2;
  } while (uVar1 < 0x48);
  uVar1 = 0x46;
LAB_000079e4:
  if (((unaff_A6[9] & 0x800) != 0) && (uVar1 != 0)) {
    uVar1 = uVar1 - 2;
  }
  uVar1 = *(ushort *)((int)&DAT_00007fda + (int)(short)uVar1 + (uint)*(byte *)(unaff_A6 + 9) * 0x48)
  ;
  unaff_A6[0xc] = uVar1;
  *(undefined1 *)(unaff_A6 + 0xb) = 0;
  if (uVar1 != unaff_A6[8]) {
    if ((short)uVar1 < (short)unaff_A6[8]) {
      *(undefined1 *)(unaff_A6 + 0xb) = 1;
      return;
    }
    return;
  }
  unaff_A6[0xc] = 0;
  return;
}


// ==== FUN_00007a2a @ 00007a2a

uint FUN_00007a2a(void)

{
  ushort uVar1;
  uint in_D0;
  uint uVar2;
  ushort uVar3;
  int unaff_A5;
  int unaff_A6;
  
  if (*(short *)(unaff_A6 + 0x18) == 0) {
    return in_D0;
  }
  if (*(char *)(unaff_A6 + 0x16) == '\0') {
    *(short *)(unaff_A6 + 0x10) = (ushort)*(byte *)(unaff_A6 + 0x17) + *(short *)(unaff_A6 + 0x10);
    uVar2 = (uint)*(ushort *)(unaff_A6 + 0x18);
    if ((short)*(ushort *)(unaff_A6 + 0x18) <= *(short *)(unaff_A6 + 0x10)) {
      *(undefined2 *)(unaff_A6 + 0x10) = *(undefined2 *)(unaff_A6 + 0x18);
      *(undefined2 *)(unaff_A6 + 0x18) = 0;
    }
  }
  else {
    *(short *)(unaff_A6 + 0x10) = *(short *)(unaff_A6 + 0x10) - (ushort)*(byte *)(unaff_A6 + 0x17);
    uVar2 = (uint)*(ushort *)(unaff_A6 + 0x18);
    if (*(short *)(unaff_A6 + 0x10) <= (short)*(ushort *)(unaff_A6 + 0x18)) {
      *(undefined2 *)(unaff_A6 + 0x10) = *(undefined2 *)(unaff_A6 + 0x18);
      *(undefined2 *)(unaff_A6 + 0x18) = 0;
    }
  }
  uVar3 = *(ushort *)(unaff_A6 + 0x10);
  uVar2 = CONCAT31((int3)(uVar2 >> 8),*(byte *)(unaff_A6 + 0x1f)) & 0xffffff0f;
  if ((*(byte *)(unaff_A6 + 0x1f) & 0xf) != 0) {
    uVar2 = 0;
    do {
      if (*(ushort *)
           ((int)&DAT_00007fda +
           (int)(short)uVar2 + (int)(short)((ushort)*(byte *)(unaff_A6 + 0x12) * 0x48)) <= uVar3)
      goto LAB_00007aa0;
      uVar1 = (short)uVar2 + 2;
      uVar2 = (uint)uVar1;
    } while (uVar1 < 0x48);
    uVar2 = 0x46;
LAB_00007aa0:
    uVar3 = *(ushort *)
             ((int)&DAT_00007fda +
             (int)(short)uVar2 + (int)(short)((ushort)*(byte *)(unaff_A6 + 0x12) * 0x48));
  }
  *(ushort *)(unaff_A5 + 6) = uVar3;
  return uVar2;
}


// ==== FUN_00007ad4 @ 00007ad4

void FUN_00007ad4(void)

{
  byte bVar1;
  char cVar2;
  ushort uVar3;
  int unaff_A5;
  int unaff_A6;
  
  uVar3 = (*(byte *)(unaff_A6 + 0x1b) & 0x7c) >> 2;
  bVar1 = *(byte *)(unaff_A6 + 0x1e) & 3;
  if (bVar1 == 0) {
    uVar3 = (ushort)(byte)(&DAT_00007fba)[(short)uVar3];
  }
  else {
    cVar2 = (char)uVar3;
    if (bVar1 == 1) {
      if (*(char *)(unaff_A6 + 0x1b) < '\0') {
        uVar3 = (ushort)(byte)(cVar2 * -8 - 1);
      }
      else {
        uVar3 = (ushort)(byte)(cVar2 * '\b');
      }
    }
    else {
      uVar3 = 0xff;
    }
  }
  uVar3 = (ushort)(uVar3 * (*(byte *)(unaff_A6 + 0x1a) & 0xf)) >> 7;
  if (*(char *)(unaff_A6 + 0x1b) < '\0') {
    uVar3 = -uVar3;
  }
  *(ushort *)(unaff_A5 + 6) = uVar3 + *(short *)(unaff_A6 + 0x10);
  *(char *)(unaff_A6 + 0x1b) =
       (char)((*(byte *)(unaff_A6 + 0x1a) & 0xf0) >> 2) + *(char *)(unaff_A6 + 0x1b);
  return;
}


// ==== FUN_00007cdc @ 00007cdc

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

uint FUN_00007cdc(void)

{
  char cVar1;
  uint uVar2;
  byte bVar4;
  ushort uVar3;
  undefined4 uVar5;
  char *pcVar6;
  undefined4 *unaff_A5;
  ushort *unaff_A6;
  
  uVar5 = FUN_00007f58();
  bVar4 = *(byte *)(unaff_A6 + 1) & 0xf;
  if (bVar4 == 9) {
    if (*(char *)((int)unaff_A6 + 3) != '\0') {
      *(char *)(unaff_A6 + 0x10) = *(char *)((int)unaff_A6 + 3);
    }
    bVar4 = *(byte *)(unaff_A6 + 0x10);
    uVar3 = (ushort)bVar4 * 0x80;
    if ((short)uVar3 < (short)unaff_A6[4]) {
      unaff_A6[4] = unaff_A6[4] + (ushort)bVar4 * -0x80;
      *(uint *)(unaff_A6 + 2) = (uint)bVar4 * 0x100 + *(int *)(unaff_A6 + 2);
      return (uint)bVar4 * 0x100;
    }
    unaff_A6[4] = 1;
    return (uint)uVar3;
  }
  if (bVar4 == 0xb) {
    DAT_0000858c = *(char *)((int)unaff_A6 + 3) - 1;
    DAT_0000858d = 0;
    DAT_0000858e = 0xff;
    return (uint)DAT_0000858c;
  }
  if (bVar4 == 0xd) {
    bVar4 = (*(byte *)((int)unaff_A6 + 3) & 0xf) + (*(byte *)((int)unaff_A6 + 3) >> 4) * '\n';
    if (0x3f < bVar4) {
      DAT_0000858d = 0;
      DAT_0000858e = 0xff;
      return (uint)bVar4;
    }
    DAT_0000858d = bVar4;
    DAT_0000858e = 0xff;
    return (uint)bVar4;
  }
  if (bVar4 != 0xe) {
    if (bVar4 != 0xf) {
      if (bVar4 != 0xc) {
        uVar2 = FUN_000078b0();
        return uVar2;
      }
      uVar2 = (uint)*(byte *)((int)unaff_A6 + 3);
      if (0x40 < *(byte *)((int)unaff_A6 + 3)) {
        uVar2 = 0x40;
      }
      *(char *)((int)unaff_A6 + 0x13) = (char)uVar2;
      *(short *)(unaff_A5 + 2) = (short)uVar2;
      return uVar2;
    }
    bVar4 = *(byte *)((int)unaff_A6 + 3);
    if (bVar4 == 0) {
      return 0;
    }
    DAT_0000858b = 0;
    DAT_0000858a = bVar4;
    return (uint)bVar4;
  }
  bVar4 = *(byte *)((int)unaff_A6 + 3) >> 4;
  if (bVar4 == 0) {
    bVar4 = (*(byte *)((int)unaff_A6 + 3) & 1) << 1;
    DAT_00bfe001 = bVar4 | DAT_00bfe001 & 0xfd;
    return (uint)bVar4;
  }
  if (bVar4 != 1) {
    if (bVar4 == 2) {
      if (DAT_0000858b != 0) {
        return 2;
      }
      DAT_00008590 = 0xff;
      unaff_A6[8] = (ushort)(*(byte *)((int)unaff_A6 + 3) & 0xf) + unaff_A6[8];
      if (-1 < (short)((unaff_A6[8] & 0xfff) - 0x358)) {
        unaff_A6[8] = unaff_A6[8] & 0xf000;
        unaff_A6[8] = unaff_A6[8] | 0x358;
      }
      uVar3 = unaff_A6[8];
      *(ushort *)((int)unaff_A5 + 6) = uVar3 & 0xfff;
      return uVar3 & 0xffff0fff;
    }
    if (bVar4 == 3) {
      *(byte *)((int)unaff_A6 + 0x1f) = *(byte *)((int)unaff_A6 + 0x1f) & 0xf0;
      *(byte *)((int)unaff_A6 + 0x1f) =
           *(byte *)((int)unaff_A6 + 3) & 0xf | *(byte *)((int)unaff_A6 + 0x1f);
      return *(byte *)((int)unaff_A6 + 3) & 0xffffff0f;
    }
    if (bVar4 == 4) {
      *(byte *)(unaff_A6 + 0xf) = *(byte *)(unaff_A6 + 0xf) & 0xf0;
      *(byte *)(unaff_A6 + 0xf) = *(byte *)((int)unaff_A6 + 3) & 0xf | *(byte *)(unaff_A6 + 0xf);
      return *(byte *)((int)unaff_A6 + 3) & 0xffffff0f;
    }
    if (bVar4 == 5) {
      *(byte *)(unaff_A6 + 9) = *(byte *)((int)unaff_A6 + 3) & 0xf;
      return *(byte *)((int)unaff_A6 + 3) & 0xffffff0f;
    }
    if (bVar4 == 6) {
      if (DAT_0000858b != 0) {
        return 6;
      }
      bVar4 = *(byte *)((int)unaff_A6 + 3) & 0xf;
      uVar2 = *(byte *)((int)unaff_A6 + 3) & 0xffffff0f;
      if (bVar4 != 0) {
        if (*(char *)(unaff_A6 + 0x11) == '\0') {
          *(byte *)(unaff_A6 + 0x11) = bVar4;
        }
        else {
          cVar1 = *(char *)(unaff_A6 + 0x11) + -1;
          *(char *)(unaff_A6 + 0x11) = cVar1;
          if (cVar1 == '\0') {
            return uVar2;
          }
        }
        DAT_0000858d = *(undefined1 *)((int)unaff_A6 + 0x21);
        DAT_0000858f = 0xff;
        return uVar2;
      }
      uVar3 = DAT_00008594 >> 4;
      *(char *)((int)unaff_A6 + 0x21) = (char)uVar3;
      return (uint)uVar3;
    }
    if (bVar4 == 7) {
      bVar4 = *(char *)((int)unaff_A6 + 3) << 4;
      *(byte *)(unaff_A6 + 0xf) = *(byte *)(unaff_A6 + 0xf) & 0xf;
      *(byte *)(unaff_A6 + 0xf) = bVar4 | *(byte *)(unaff_A6 + 0xf);
      return (uint)bVar4;
    }
    if (bVar4 == 9) {
      bVar4 = *(byte *)((int)unaff_A6 + 3) & 0xf;
      if (bVar4 == 0) {
        return 0;
      }
      if ((DAT_0000858b == 0) && ((*unaff_A6 & 0xfff) != 0)) {
        return (uint)bVar4;
      }
      if ((ushort)((ushort)DAT_0000858b % (ushort)bVar4) != 0) {
        return (uint)bVar4;
      }
    }
    else {
      if (bVar4 == 10) {
        if (DAT_0000858b != 0) {
          return 10;
        }
        *(char *)((int)unaff_A6 + 0x13) =
             (*(byte *)((int)unaff_A6 + 3) & 0xf) + *(char *)((int)unaff_A6 + 0x13);
        if (-1 < (char)(*(char *)((int)unaff_A6 + 0x13) + -0x40)) {
          *(undefined1 *)((int)unaff_A6 + 0x13) = 0x40;
        }
        bVar4 = *(byte *)((int)unaff_A6 + 0x13);
        *(ushort *)(unaff_A5 + 2) = (ushort)bVar4;
        return (uint)bVar4;
      }
      if (bVar4 == 0xb) {
        if (DAT_0000858b != 0) {
          return 0xb;
        }
        bVar4 = *(byte *)((int)unaff_A6 + 0x13) - (*(byte *)((int)unaff_A6 + 3) & 0xf);
        *(byte *)((int)unaff_A6 + 0x13) = bVar4;
        if ((short)((ushort)bVar4 << 8) < 0) {
          *(undefined1 *)((int)unaff_A6 + 0x13) = 0;
        }
        bVar4 = *(byte *)((int)unaff_A6 + 0x13);
        *(ushort *)(unaff_A5 + 2) = (ushort)bVar4;
        return (uint)bVar4;
      }
      if (bVar4 == 0xc) {
        bVar4 = *(byte *)((int)unaff_A6 + 3) & 0xf;
        if (bVar4 != DAT_0000858b) {
          return (uint)bVar4;
        }
        *(undefined1 *)((int)unaff_A6 + 0x13) = 0;
        *(undefined2 *)(unaff_A5 + 2) = 0;
        return (uint)bVar4;
      }
      if (bVar4 != 0xd) {
        if (bVar4 == 0xe) {
          if (DAT_0000858b != 0) {
            return 0xe;
          }
          bVar4 = *(byte *)((int)unaff_A6 + 3) & 0xf;
          if (DAT_00008592 != '\0') {
            return (uint)bVar4;
          }
          DAT_00008591 = bVar4 + 1;
          return (uint)DAT_00008591;
        }
        if (bVar4 != 0xf) {
          return (uint)bVar4;
        }
        if (DAT_0000858b != 0) {
          return 0xf;
        }
        bVar4 = *(byte *)((int)unaff_A6 + 3) << 4;
        *(byte *)((int)unaff_A6 + 0x1f) = *(byte *)((int)unaff_A6 + 0x1f) & 0xf;
        *(byte *)((int)unaff_A6 + 0x1f) = bVar4 | *(byte *)((int)unaff_A6 + 0x1f);
        if ((*(byte *)((int)unaff_A6 + 3) & 0xf) == 0) {
          return (uint)bVar4;
        }
        bVar4 = *(byte *)((int)unaff_A6 + 0x1f) >> 4;
        uVar2 = (uint)bVar4;
        if (bVar4 != 0) {
          uVar2 = (uint)*(byte *)((int)&PTR_DAT_00007faa + (int)(short)(ushort)bVar4);
          *(char *)((int)unaff_A6 + 0x23) =
               *(byte *)((int)&PTR_DAT_00007faa + (int)(short)(ushort)bVar4) +
               *(char *)((int)unaff_A6 + 0x23);
          if ((*(byte *)((int)unaff_A6 + 0x23) & 0x80) != 0) {
            *(undefined1 *)((int)unaff_A6 + 0x23) = 0;
            pcVar6 = (char *)(*(int *)(unaff_A6 + 0x12) + 1);
            if ((char *)((uint)unaff_A6[7] * 2 + *(int *)(unaff_A6 + 5)) <= pcVar6) {
              pcVar6 = *(char **)(unaff_A6 + 5);
            }
            *(char **)(unaff_A6 + 0x12) = pcVar6;
            uVar2 = CONCAT31(0xffffff,-1 - *pcVar6);
            *pcVar6 = -1 - *pcVar6;
          }
        }
        return uVar2;
      }
      bVar4 = *(byte *)((int)unaff_A6 + 3) & 0xf;
      if (bVar4 != DAT_0000858b) {
        return (uint)bVar4;
      }
      if (*unaff_A6 == 0) {
        return 0;
      }
    }
    _DAT_00dff096 = unaff_A6[10];
    *unaff_A5 = *(undefined4 *)(unaff_A6 + 2);
    *(ushort *)(unaff_A5 + 1) = unaff_A6[4];
    FUN_00005cce(uVar5);
    _DAT_00dff096 = unaff_A6[10] | 0x8000;
    uVar2 = FUN_00005cce();
    *unaff_A5 = *(undefined4 *)(unaff_A6 + 5);
    unaff_A5[1] = *(undefined4 *)(unaff_A6 + 7);
    return uVar2;
  }
  if (DAT_0000858b != 0) {
    return 1;
  }
  DAT_00008590 = 0xff;
  unaff_A6[8] = unaff_A6[8] - (ushort)(*(byte *)((int)unaff_A6 + 3) & 0xf);
  if ((short)((unaff_A6[8] & 0xfff) - 0x71) < 0) {
    unaff_A6[8] = unaff_A6[8] & 0xf000;
    unaff_A6[8] = unaff_A6[8] | 0x71;
  }
  uVar3 = unaff_A6[8];
  *(ushort *)((int)unaff_A5 + 6) = uVar3 & 0xfff;
  return uVar3 & 0xffff0fff;
}


// ==== FUN_00007dd4 @ 00007dd4

void FUN_00007dd4(void)

{
  int unaff_A6;
  
  *(byte *)(unaff_A6 + 0x12) = *(byte *)(unaff_A6 + 3) & 0xf;
  return;
}


// ==== FUN_00007f58 @ 00007f58

void FUN_00007f58(void)

{
  byte bVar1;
  char *pcVar2;
  int unaff_A6;
  
  bVar1 = *(byte *)(unaff_A6 + 0x1f) >> 4;
  if ((bVar1 != 0) &&
     (*(char *)(unaff_A6 + 0x23) =
           *(char *)((int)&PTR_DAT_00007faa + (int)(short)(ushort)bVar1) +
           *(char *)(unaff_A6 + 0x23), (*(byte *)(unaff_A6 + 0x23) & 0x80) != 0)) {
    *(undefined1 *)(unaff_A6 + 0x23) = 0;
    pcVar2 = (char *)(*(int *)(unaff_A6 + 0x24) + 1);
    if ((char *)((uint)*(ushort *)(unaff_A6 + 0xe) * 2 + *(int *)(unaff_A6 + 10)) <= pcVar2) {
      pcVar2 = *(char **)(unaff_A6 + 10);
    }
    *(char **)(unaff_A6 + 0x24) = pcVar2;
    *pcVar2 = -1 - *pcVar2;
  }
  return;
}


// ==== FUN_00008db2 @ 00008db2

void FUN_00008db2(void)

{
  undefined4 uVar1;
  ushort in_D0w;
  short unaff_D7w;
  short sVar2;
  undefined4 *in_A0;
  uint *in_A1;
  
  sVar2 = unaff_D7w + -1;
  do {
    uVar1 = *in_A0;
    *in_A1 = ((uint)((ushort)((uint)uVar1 >> 0x10) & 0xff) * (uint)in_D0w >> 8) << 0x10 |
             (uint)(ushort)((short)((uint)((ushort)((uint)uVar1 >> 8) & 0xff) * (uint)in_D0w >> 8)
                           << 8) | (uint)((ushort)uVar1 & 0xff) * (uint)in_D0w >> 8;
    sVar2 = sVar2 + -1;
    in_A0 = in_A0 + 1;
    in_A1 = in_A1 + 1;
  } while (sVar2 != -1);
  return;
}


// ==== FUN_00008e4c @ 00008e4c

void FUN_00008e4c(void)

{
  undefined4 uVar1;
  ushort uVar2;
  ushort uVar3;
  short unaff_D7w;
  undefined4 *in_A0;
  ushort *in_A1;
  ushort *puVar4;
  
  do {
    uVar1 = *in_A0;
    uVar2 = (ushort)((uint)uVar1 >> 8);
    uVar3 = (ushort)((uint)uVar1 >> 0x10);
    puVar4 = in_A1 + 1;
    *in_A1 = (uVar3 >> 4 & 0xf) << 8 | (uVar2 >> 4 & 0xf) << 4 | (ushort)uVar1 >> 4 & 0xf;
    in_A1 = in_A1 + 2;
    *puVar4 = (uVar3 & 0xf) << 8 | (uVar2 & 0xf) << 4 | (ushort)uVar1 & 0xf;
    unaff_D7w = unaff_D7w + -1;
    in_A0 = in_A0 + 1;
  } while (unaff_D7w != -1);
  return;
}


// ==== FUN_00008ea0 @ 00008ea0

void FUN_00008ea0(void)

{
  byte bVar1;
  
  DAT_0000466e = DAT_00bfe101;
  DAT_0000466f = DAT_00bfd002;
  DAT_000110b8 = FUN_000045a6();
  bVar1 = FUN_000045e8();
  DAT_000110b8 = bVar1 | DAT_000110b8;
  bVar1 = FUN_00004528();
  DAT_000110b8 = bVar1 | DAT_000110b8;
  bVar1 = FUN_0000456a();
  DAT_000110b8 = bVar1 | DAT_000110b8;
  return;
}


// ==== FUN_00008ede @ 00008ede

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00008ede(void)

{
  int iVar1;
  int in_D0;
  
  DAT_00079306 = (short)in_D0;
  DAT_00079302 = (short)((uint)in_D0 >> 0x10);
  iVar1 = DAT_000a0006 + in_D0;
  DAT_0007930e = (short)iVar1;
  DAT_0007930a = (short)((uint)iVar1 >> 0x10);
  iVar1 = DAT_000a0006 + iVar1;
  _DAT_00079316 = (short)iVar1;
  _DAT_00079312 = (short)((uint)iVar1 >> 0x10);
  iVar1 = DAT_000a0006 + iVar1;
  _DAT_0007931e = (short)iVar1;
  _DAT_0007931a = (short)((uint)iVar1 >> 0x10);
  iVar1 = DAT_000a0006 + iVar1;
  _DAT_00079326 = (short)iVar1;
  _DAT_00079322 = (short)((uint)iVar1 >> 0x10);
  _DAT_0007932e = (short)(DAT_000a0006 + iVar1);
  _DAT_0007932a = (short)((uint)(DAT_000a0006 + iVar1) >> 0x10);
  return;
}


// ==== FUN_00011b9c @ 00011b9c

undefined2 FUN_00011b9c(void)

{
  undefined1 extraout_var;
  undefined1 extraout_var_00;
  undefined1 uVar1;
  undefined1 extraout_var_01;
  undefined1 extraout_var_02;
  undefined1 extraout_var_03;
  undefined1 extraout_var_04;
  undefined1 extraout_var_05;
  undefined1 extraout_var_06;
  undefined1 extraout_var_07;
  undefined1 extraout_var_08;
  undefined1 extraout_var_09;
  undefined1 extraout_var_10;
  undefined1 extraout_var_11;
  undefined1 extraout_var_12;
  undefined1 extraout_var_13;
  undefined1 extraout_var_14;
  undefined1 extraout_var_15;
  undefined1 extraout_var_16;
  undefined1 extraout_var_17;
  undefined1 extraout_var_18;
  undefined1 extraout_var_19;
  undefined1 extraout_var_20;
  undefined2 in_D0w;
  undefined2 uVar2;
  
  uVar1 = (undefined1)((ushort)in_D0w >> 8);
  if (LAB_00013a1a_2 != LAB_00013a26_2) {
    if (LAB_00013a1a_2 == '\0') {
      FUN_000137d4();
      uVar1 = extraout_var_00;
    }
    else {
      FUN_000137d4();
      uVar1 = extraout_var;
    }
  }
  if (LAB_00013a1a_3 != LAB_00013a26_3) {
    if (LAB_00013a1a_3 == '\0') {
      FUN_000137d4();
      uVar1 = extraout_var_02;
    }
    else {
      FUN_000137d4();
      uVar1 = extraout_var_01;
    }
  }
  if (LAB_00013a1e != LAB_00013a2a) {
    if (LAB_00013a1e == '\0') {
      FUN_000137d4();
      uVar1 = extraout_var_04;
    }
    else {
      FUN_000137d4();
      uVar1 = extraout_var_03;
    }
  }
  if (LAB_00013a1e_1 != LAB_00013a2a_1) {
    if (LAB_00013a1e_1 == '\0') {
      FUN_000137d4();
      uVar1 = extraout_var_06;
    }
    else {
      FUN_000137d4();
      uVar1 = extraout_var_05;
    }
  }
  if (LAB_00013a1e_2 != LAB_00013a2a_2) {
    if (LAB_00013a1e_2 == '\0') {
      FUN_000137d4();
      uVar1 = extraout_var_08;
    }
    else {
      FUN_000137d4();
      uVar1 = extraout_var_07;
    }
  }
  if (LAB_00013a1e_3 != LAB_00013a2a_3) {
    if (LAB_00013a1e_3 == '\0') {
      FUN_000137d4();
      uVar1 = extraout_var_10;
    }
    else {
      FUN_000137d4();
      uVar1 = extraout_var_09;
    }
  }
  if (LAB_00013a22 != LAB_00013a2e) {
    if (LAB_00013a22 == '\0') {
      FUN_000137d4();
      uVar1 = extraout_var_12;
    }
    else {
      FUN_000137d4();
      uVar1 = extraout_var_11;
    }
  }
  if (LAB_00013a22_1 != LAB_00013a2e_1) {
    if (LAB_00013a22_1 == '\0') {
      FUN_000137d4();
      uVar1 = extraout_var_14;
    }
    else {
      FUN_000137d4();
      uVar1 = extraout_var_13;
    }
  }
  if (LAB_00013a22_2 != LAB_00013a2e_2) {
    if (LAB_00013a22_2 == '\0') {
      FUN_000137d4();
      uVar1 = extraout_var_16;
    }
    else {
      FUN_000137d4();
      uVar1 = extraout_var_15;
    }
  }
  if (LAB_00013a22_3 != LAB_00013a2e_3) {
    if (LAB_00013a22_3 == '\0') {
      FUN_000137d4();
      uVar1 = extraout_var_18;
    }
    else {
      FUN_000137d4();
      uVar1 = extraout_var_17;
    }
  }
  if (LAB_00013a26 != DAT_00013a32) {
    if (LAB_00013a26 == '\0') {
      FUN_000137d4();
      uVar1 = extraout_var_20;
    }
    else {
      FUN_000137d4();
      uVar1 = extraout_var_19;
    }
  }
  uVar2 = CONCAT11(uVar1,LAB_00013a26_1 ^ DAT_00013a33);
  if ((LAB_00013a26_1 ^ DAT_00013a33) != 0) {
    if (LAB_00013a26_1 == 0) {
      uVar2 = FUN_000137d4();
    }
    else {
      uVar2 = FUN_000137d4();
    }
  }
  return uVar2;
}


// ==== FUN_00011e86 @ 00011e86

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00011e86(void)

{
  undefined4 unaff_A4;
  undefined4 unaff_A5;
  undefined4 unaff_A6;
  
  FUN_00011f3e();
  _LAB_000139de_2 = unaff_A4;
  _LAB_000139ee_2 = unaff_A5;
  _LAB_000139fe_2 = unaff_A6;
  FUN_00011f3e();
  _LAB_000139e2_2 = unaff_A4;
  _LAB_000139f2_2 = unaff_A5;
  _LAB_00013a02_2 = unaff_A6;
  FUN_00011f3e();
  _LAB_000139e6_2 = unaff_A4;
  _LAB_000139f6_2 = unaff_A5;
  _LAB_00013a06_2 = unaff_A6;
  FUN_00011f3e();
  _LAB_000139ea_2 = unaff_A4;
  _LAB_000139fa_2 = unaff_A5;
  _LAB_00013a0a_2 = unaff_A6;
  return;
}


// ==== FUN_00011f3e @ 00011f3e

void FUN_00011f3e(void)

{
  short sVar1;
  ushort uVar2;
  short sVar3;
  short sVar4;
  int in_A1;
  int iVar5;
  short *psVar6;
  short *unaff_A2;
  
  sVar3 = *(short *)(in_A1 + 0x20);
  sVar1 = *(short *)(in_A1 + 0x22);
  uVar2 = *(ushort *)(in_A1 + 0x24);
  *unaff_A2 = sVar3;
  unaff_A2[1] = uVar2;
  unaff_A2[2] = sVar1;
  sVar3 = sVar3 << 2;
  iVar5 = (int)sVar3 + in_A1 + 0x2e;
  *(int *)(unaff_A2 + 7) = iVar5;
  sVar4 = (uVar2 & 0x3fff) << 1;
  psVar6 = (short *)((int)sVar4 +
                    (int)sVar4 + (int)(short)(uVar2 << 2) + (short)(sVar1 << 2) + iVar5);
  unaff_A2[9] = *psVar6;
  unaff_A2[10] = psVar6[1];
  unaff_A2[0xb] = psVar6[2];
  unaff_A2[0xc] = psVar6[3];
  unaff_A2[0xd] = psVar6[4];
  unaff_A2[0xe] = psVar6[5];
  unaff_A2[0xf] = psVar6[6];
  unaff_A2[0x10] = psVar6[7];
  unaff_A2[0x11] = psVar6[8];
  unaff_A2[0x13] = psVar6[9];
  unaff_A2[0x14] = psVar6[10];
  *(short **)(unaff_A2 + 3) = psVar6 + 0x1b;
  *(int *)(unaff_A2 + 5) = (int)sVar3 + (int)(psVar6 + 0x1b);
  return;
}


// ==== FUN_00011f9e @ 00011f9e

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00011f9e(void)

{
  bool bVar1;
  
  DAT_0000466e = DAT_00bfe101;
  DAT_0000466f = DAT_00bfd002;
  LAB_0000466a = (*(code *)(&PTR_FUN_00007424)[sRam000110a8])();
  LAB_0000466a_1 = (*(code *)(&PTR_FUN_00007424)[sRam000110aa])();
  LAB_0000466a_2 = (*(code *)(&PTR_FUN_00007424)[sRam000110ac])();
  LAB_0000466a_3 = (*(code *)(&PTR_FUN_00007424)[sRam000110ae])();
  if ((_LAB_00012830 != 5) && (bVar1 = _LAB_00012828 < 1, _LAB_00012828 = _LAB_00012828 + -1, bVar1)
     ) {
    _LAB_00012828 = 0;
    if (LAB_0000466a != 0) {
      _LAB_00012828 = 0xf;
    }
    if (_LAB_00012830 == 0) {
      FUN_000122e8();
    }
    if (_LAB_00012830 == 1) {
      FUN_00012408();
    }
    if (_LAB_00012830 == 2) {
      FUN_00012538();
    }
    if (_LAB_00012830 == 4) {
      FUN_000126a8();
    }
    if ((LAB_0000466a & 0x10) == 0) {
      LAB_00013a16_2 = '\0';
    }
    else {
      if (LAB_00013a16_2 == '\0') {
        _LAB_00012830 = _LAB_00012830 + 1;
        if (4 < _LAB_00012830) {
          _LAB_00012830 = 4;
        }
        FUN_000139ae();
      }
      LAB_00013a16_2 = '\x01';
    }
  }
  if ((_LAB_00012830_2 != 5) &&
     (bVar1 = _LAB_00012828_2 < 1, _LAB_00012828_2 = _LAB_00012828_2 + -1, bVar1)) {
    _LAB_00012828_2 = 0;
    if (LAB_0000466a_1 != 0) {
      _LAB_00012828_2 = 0xf;
    }
    if (_LAB_00012830_2 == 0) {
      FUN_00012330();
    }
    if (_LAB_00012830_2 == 1) {
      FUN_00012454();
    }
    if (_LAB_00012830_2 == 2) {
      FUN_00012594();
    }
    if (_LAB_00012830_2 == 4) {
      FUN_000126dc();
    }
    if ((LAB_0000466a_1 & 0x10) == 0) {
      LAB_00013a16_3 = '\0';
    }
    else {
      if (LAB_00013a16_3 == '\0') {
        _LAB_00012830_2 = _LAB_00012830_2 + 1;
        if (4 < _LAB_00012830_2) {
          _LAB_00012830_2 = 4;
        }
        FUN_000139ae();
      }
      LAB_00013a16_3 = '\x01';
    }
  }
  if ((_LAB_00012834 != 5) && (bVar1 = _LAB_0001282c < 1, _LAB_0001282c = _LAB_0001282c + -1, bVar1)
     ) {
    _LAB_0001282c = 0;
    if (LAB_0000466a_2 != 0) {
      _LAB_0001282c = 0xf;
    }
    if (_LAB_00012834 == 0) {
      FUN_00012378();
    }
    if (_LAB_00012834 == 1) {
      FUN_000124a0();
    }
    if (_LAB_00012834 == 2) {
      FUN_000125f0();
    }
    if (_LAB_00012834 == 4) {
      FUN_00012710();
    }
    if ((LAB_0000466a_2 & 0x10) == 0) {
      LAB_00013a1a = '\0';
    }
    else {
      if (LAB_00013a1a == '\0') {
        _LAB_00012834 = _LAB_00012834 + 1;
        if (4 < _LAB_00012834) {
          _LAB_00012834 = 4;
        }
        FUN_000139ae();
      }
      LAB_00013a1a = '\x01';
    }
  }
  if ((_LAB_00012834_2 != 5) &&
     (bVar1 = _LAB_0001282c_2 < 1, _LAB_0001282c_2 = _LAB_0001282c_2 + -1, bVar1)) {
    _LAB_0001282c_2 = 0;
    if (LAB_0000466a_3 != 0) {
      _LAB_0001282c_2 = 0xf;
    }
    if (_LAB_00012834_2 == 0) {
      FUN_000123c0();
    }
    if (_LAB_00012834_2 == 1) {
      FUN_000124ec();
    }
    if (_LAB_00012834_2 == 2) {
      FUN_0001264c();
    }
    if (_LAB_00012834_2 == 4) {
      FUN_00012744();
    }
    if ((LAB_0000466a_3 & 0x10) == 0) {
      LAB_00013a1a_1 = '\0';
    }
    else {
      if (LAB_00013a1a_1 == '\0') {
        _LAB_00012834_2 = _LAB_00012834_2 + 1;
        if (4 < _LAB_00012834_2) {
          _LAB_00012834_2 = 4;
        }
        FUN_000139ae();
      }
      LAB_00013a1a_1 = '\x01';
    }
  }
  return;
}


// ==== FUN_000122e8 @ 000122e8

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_000122e8(void)

{
  undefined *puVar1;
  short sVar2;
  
  puVar1 = PTR_DAT_0009964a;
  sVar2 = _DAT_000a0494;
  if ((LAB_0000466a & 1) != 0) {
    *(undefined2 *)(PTR_DAT_0009964a + 0x24) = 0;
    sVar2 = _DAT_000a0494 + -1;
    if (_DAT_000a0494 < 1) {
      sVar2 = _LAB_00004aac + -1;
    }
  }
  if ((LAB_0000466a & 2) != 0) {
    *(undefined2 *)(puVar1 + 0x24) = 0;
    sVar2 = sVar2 + 1;
    if (_LAB_00004aac <= sVar2) {
      sVar2 = 0;
    }
  }
  _DAT_000a0494 = sVar2;
  return;
}


// ==== FUN_00012330 @ 00012330

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00012330(void)

{
  undefined *puVar1;
  short sVar2;
  
  puVar1 = PTR_DAT_0009964e;
  sVar2 = _DAT_000a0496;
  if ((LAB_0000466a_1 & 1) != 0) {
    *(undefined2 *)(PTR_DAT_0009964e + 0x24) = 0;
    sVar2 = _DAT_000a0496 + -1;
    if (_DAT_000a0496 < 1) {
      sVar2 = _LAB_00004aac + -1;
    }
  }
  if ((LAB_0000466a_1 & 2) != 0) {
    *(undefined2 *)(puVar1 + 0x24) = 0;
    sVar2 = sVar2 + 1;
    if (_LAB_00004aac <= sVar2) {
      sVar2 = 0;
    }
  }
  _DAT_000a0496 = sVar2;
  return;
}


// ==== FUN_00012378 @ 00012378

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00012378(void)

{
  undefined *puVar1;
  short sVar2;
  
  puVar1 = PTR_DAT_00099652;
  sVar2 = _DAT_000a0498;
  if ((LAB_0000466a_2 & 1) != 0) {
    *(undefined2 *)(PTR_DAT_00099652 + 0x24) = 0;
    sVar2 = _DAT_000a0498 + -1;
    if (_DAT_000a0498 < 1) {
      sVar2 = _LAB_00004aac + -1;
    }
  }
  if ((LAB_0000466a_2 & 2) != 0) {
    *(undefined2 *)(puVar1 + 0x24) = 0;
    sVar2 = sVar2 + 1;
    if (_LAB_00004aac <= sVar2) {
      sVar2 = 0;
    }
  }
  _DAT_000a0498 = sVar2;
  return;
}


// ==== FUN_000123c0 @ 000123c0

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_000123c0(void)

{
  undefined *puVar1;
  short sVar2;
  
  puVar1 = PTR_DAT_00099656;
  sVar2 = _DAT_000a049a;
  if ((LAB_0000466a_3 & 1) != 0) {
    *(undefined2 *)(PTR_DAT_00099656 + 0x24) = 0;
    sVar2 = _DAT_000a049a + -1;
    if (_DAT_000a049a < 1) {
      sVar2 = _LAB_00004aac + -1;
    }
  }
  if ((LAB_0000466a_3 & 2) != 0) {
    *(undefined2 *)(puVar1 + 0x24) = 0;
    sVar2 = sVar2 + 1;
    if (_LAB_00004aac <= sVar2) {
      sVar2 = 0;
    }
  }
  _DAT_000a049a = sVar2;
  return;
}


// ==== FUN_00012408 @ 00012408

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00012408(void)

{
  short sVar1;
  short sVar2;
  
  do {
    sVar1 = *(short *)(PTR_DAT_0009964a + 0x24);
    sVar2 = sVar1;
    if (((LAB_0000466a & 1) != 0) && (sVar2 = sVar1 + -1, sVar1 < 1)) {
      sVar2 = 5;
    }
    if (((LAB_0000466a & 2) != 0) && (sVar2 = sVar2 + 1, 5 < sVar2)) {
      sVar2 = 0;
    }
    *(short *)(PTR_DAT_0009964a + 0x24) = sVar2;
  } while ((sVar2 != 0) && (*(char *)(_LAB_000139de_2 + -1 + (int)sVar2) == '\0'));
  _LAB_000139d4_4 = 0;
  return;
}


// ==== FUN_00012454 @ 00012454

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00012454(void)

{
  short sVar1;
  short sVar2;
  
  do {
    sVar1 = *(short *)(PTR_DAT_0009964e + 0x24);
    sVar2 = sVar1;
    if (((LAB_0000466a_1 & 1) != 0) && (sVar2 = sVar1 + -1, sVar1 < 1)) {
      sVar2 = 5;
    }
    if (((LAB_0000466a_1 & 2) != 0) && (sVar2 = sVar2 + 1, 5 < sVar2)) {
      sVar2 = 0;
    }
    *(short *)(PTR_DAT_0009964e + 0x24) = sVar2;
  } while ((sVar2 != 0) && (*(char *)(_LAB_000139e2_2 + -1 + (int)sVar2) == '\0'));
  _LAB_000139d4_6 = 0;
  return;
}


// ==== FUN_000124a0 @ 000124a0

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_000124a0(void)

{
  short sVar1;
  short sVar2;
  
  do {
    sVar1 = *(short *)(PTR_DAT_00099652 + 0x24);
    sVar2 = sVar1;
    if (((LAB_0000466a_2 & 1) != 0) && (sVar2 = sVar1 + -1, sVar1 < 1)) {
      sVar2 = 5;
    }
    if (((LAB_0000466a_2 & 2) != 0) && (sVar2 = sVar2 + 1, 5 < sVar2)) {
      sVar2 = 0;
    }
    *(short *)(PTR_DAT_00099652 + 0x24) = sVar2;
  } while ((sVar2 != 0) && (*(char *)(_LAB_000139e6_2 + -1 + (int)sVar2) == '\0'));
  _LAB_000139d4_8 = 0;
  return;
}


// ==== FUN_000124ec @ 000124ec

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_000124ec(void)

{
  short sVar1;
  short sVar2;
  
  do {
    sVar1 = *(short *)(PTR_DAT_00099656 + 0x24);
    sVar2 = sVar1;
    if (((LAB_0000466a_3 & 1) != 0) && (sVar2 = sVar1 + -1, sVar1 < 1)) {
      sVar2 = 5;
    }
    if (((LAB_0000466a_3 & 2) != 0) && (sVar2 = sVar2 + 1, 5 < sVar2)) {
      sVar2 = 0;
    }
    *(short *)(PTR_DAT_00099656 + 0x24) = sVar2;
  } while ((sVar2 != 0) && (*(char *)(_LAB_000139ea_2 + -1 + (int)sVar2) == '\0'));
  _LAB_000139de = 0;
  return;
}


// ==== FUN_00012538 @ 00012538

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00012538(void)

{
  bool bVar1;
  bool bVar2;
  
  while( true ) {
    bVar2 = false;
    if ((LAB_0000466a & 1) != 0) {
      bVar2 = true;
      bVar1 = _LAB_00013a0e_2 < 1;
      _LAB_00013a0e_2 = _LAB_00013a0e_2 + -1;
      if (bVar1) {
        _LAB_00013a0e_2 = *(short *)(PTR_DAT_0009964a + 2) + -1;
      }
    }
    if ((LAB_0000466a & 2) != 0) {
      bVar2 = true;
      _LAB_00013a0e_2 = _LAB_00013a0e_2 + 1;
      if ((short)(*(short *)(PTR_DAT_0009964a + 2) + -1) < _LAB_00013a0e_2) {
        _LAB_00013a0e_2 = 0;
      }
    }
    if (*(short *)(_LAB_000139fe_2 + _LAB_00013a0e_2 * 2) != 0) break;
    if (!bVar2) {
      LAB_0000466a = LAB_0000466a | 2;
    }
  }
  return;
}


// ==== FUN_00012594 @ 00012594

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00012594(void)

{
  bool bVar1;
  bool bVar2;
  
  while( true ) {
    bVar2 = false;
    if ((LAB_0000466a_1 & 1) != 0) {
      bVar2 = true;
      bVar1 = _LAB_00013a12 < 1;
      _LAB_00013a12 = _LAB_00013a12 + -1;
      if (bVar1) {
        _LAB_00013a12 = *(short *)(PTR_DAT_0009964e + 2) + -1;
      }
    }
    if ((LAB_0000466a_1 & 2) != 0) {
      bVar2 = true;
      _LAB_00013a12 = _LAB_00013a12 + 1;
      if ((short)(*(short *)(PTR_DAT_0009964e + 2) + -1) < _LAB_00013a12) {
        _LAB_00013a12 = 0;
      }
    }
    if (*(short *)(_LAB_00013a02_2 + _LAB_00013a12 * 2) != 0) break;
    if (!bVar2) {
      LAB_0000466a_1 = LAB_0000466a_1 | 2;
    }
  }
  return;
}


// ==== FUN_000125f0 @ 000125f0

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_000125f0(void)

{
  bool bVar1;
  bool bVar2;
  
  while( true ) {
    bVar2 = false;
    if ((LAB_0000466a_2 & 1) != 0) {
      bVar2 = true;
      bVar1 = _LAB_00013a12_2 < 1;
      _LAB_00013a12_2 = _LAB_00013a12_2 + -1;
      if (bVar1) {
        _LAB_00013a12_2 = *(short *)(PTR_DAT_00099652 + 2) + -1;
      }
    }
    if ((LAB_0000466a_2 & 2) != 0) {
      bVar2 = true;
      _LAB_00013a12_2 = _LAB_00013a12_2 + 1;
      if ((short)(*(short *)(PTR_DAT_00099652 + 2) + -1) < _LAB_00013a12_2) {
        _LAB_00013a12_2 = 0;
      }
    }
    if (*(short *)(_LAB_00013a06_2 + _LAB_00013a12_2 * 2) != 0) break;
    if (!bVar2) {
      LAB_0000466a_2 = LAB_0000466a_2 | 2;
    }
  }
  return;
}


// ==== FUN_0001264c @ 0001264c

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_0001264c(void)

{
  bool bVar1;
  bool bVar2;
  
  while( true ) {
    bVar2 = false;
    if ((LAB_0000466a_3 & 1) != 0) {
      bVar2 = true;
      bVar1 = _LAB_00013a16 < 1;
      _LAB_00013a16 = _LAB_00013a16 + -1;
      if (bVar1) {
        _LAB_00013a16 = *(short *)(PTR_DAT_00099656 + 2) + -1;
      }
    }
    if ((LAB_0000466a_3 & 2) != 0) {
      bVar2 = true;
      _LAB_00013a16 = _LAB_00013a16 + 1;
      if ((short)(*(short *)(PTR_DAT_00099656 + 2) + -1) < _LAB_00013a16) {
        _LAB_00013a16 = 0;
      }
    }
    if (*(short *)(_LAB_00013a0a_2 + _LAB_00013a16 * 2) != 0) break;
    if (!bVar2) {
      LAB_0000466a_3 = LAB_0000466a_3 | 2;
    }
  }
  return;
}


// ==== FUN_000126a8 @ 000126a8

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_000126a8(void)

{
  if ((LAB_0000466a & 1) != 0) {
    _LAB_00012830 = _LAB_00012830 + 1;
  }
  if ((LAB_0000466a & 2) != 0) {
    _LAB_00012830 = 0;
    s_SHIP__SPECIAL_WEAPON_____________00012e58[0x2d0] = '\0';
    s_SHIP__SPECIAL_WEAPON_____________00012e58[0x2d1] = '\0';
    s_j_PLAYER_ONE_IS_READY_TO_EAT_PLA_0001338f[0xd9] = '\0';
    s_j_PLAYER_ONE_IS_READY_TO_EAT_PLA_0001338f[0xda] = '\0';
    _LAB_00013a0e_2 = 0;
  }
  return;
}


// ==== FUN_000126dc @ 000126dc

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_000126dc(void)

{
  if ((LAB_0000466a_1 & 1) != 0) {
    _LAB_00012830_2 = _LAB_00012830_2 + 1;
  }
  if ((LAB_0000466a_1 & 2) != 0) {
    _LAB_00012830_2 = 0;
    s_SHIP__SPECIAL_WEAPON_____________00012e58[0x2d2] = '\0';
    s_SHIP__SPECIAL_WEAPON_____________00012e58[0x2d3] = '\0';
    s_j_PLAYER_ONE_IS_READY_TO_EAT_PLA_0001338f[0xdb] = '\0';
    s_j_PLAYER_ONE_IS_READY_TO_EAT_PLA_0001338f[0xdc] = '\0';
    _LAB_00013a12 = 0;
  }
  return;
}


// ==== FUN_00012710 @ 00012710

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00012710(void)

{
  if ((LAB_0000466a_2 & 1) != 0) {
    _LAB_00012834 = _LAB_00012834 + 1;
  }
  if ((LAB_0000466a_2 & 2) != 0) {
    _LAB_00012834 = 0;
    _LAB_0001312c = 0;
    _LAB_0001346c = 0;
    _LAB_00013a12_2 = 0;
  }
  return;
}


// ==== FUN_00012744 @ 00012744

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00012744(void)

{
  if ((LAB_0000466a_3 & 1) != 0) {
    _LAB_00012834_2 = _LAB_00012834_2 + 1;
  }
  if ((LAB_0000466a_3 & 2) != 0) {
    _LAB_00012834_2 = 0;
    _LAB_0001312c_2 = 0;
    _LAB_0001346c_2 = 0;
    _LAB_00013a16 = 0;
  }
  return;
}


// ==== FUN_00012778 @ 00012778

void FUN_00012778(void)

{
  short unaff_D3w;
  
  if (unaff_D3w != 0x12) {
    FUN_000127b0();
  }
  return;
}


// ==== FUN_000127b0 @ 000127b0

undefined8 FUN_000127b0(void)

{
  undefined4 in_D0;
  uint in_D1;
  short sVar2;
  char cVar3;
  uint uVar1;
  short unaff_D2w;
  short sVar4;
  short sVar5;
  ushort uVar7;
  short sVar8;
  uint uVar6;
  ushort uVar9;
  short sVar10;
  short sVar11;
  int in_A1;
  int unaff_A2;
  int unaff_A3;
  
  uVar7 = 0xffff;
  do {
    uVar7 = uVar7 + 1;
    if (*(char *)(unaff_A3 + (short)uVar7) == '\0') break;
  } while (*(char *)(unaff_A3 + (short)uVar7) != (char)in_D0);
  uVar9 = (ushort)((uint)uVar7 * 6) >> 3;
  uVar6 = (uint)uVar7 * 6 & 0xffffff07 ^ 7;
  uVar1 = in_D1 & 0xff07 ^ 7;
  sVar4 = ((ushort)in_D1 >> 3) + unaff_D2w * 0x28;
  sVar11 = 5;
  do {
    sVar8 = (short)uVar6;
    sVar2 = (short)uVar1;
    sVar10 = 5;
    uVar7 = uVar9;
    sVar5 = sVar4;
    do {
      if ((*(byte *)(unaff_A2 + (short)uVar7) & '\x01' << (uVar6 & 7)) == 0) {
        *(byte *)(in_A1 + sVar5) = *(byte *)(in_A1 + sVar5) & ~('\x01' << (uVar1 & 7));
      }
      else {
        *(byte *)(in_A1 + sVar5) = *(byte *)(in_A1 + sVar5) | '\x01' << (uVar1 & 7);
      }
      cVar3 = (char)uVar6;
      uVar6 = (uint)(byte)(cVar3 - 1);
      if (cVar3 < '\x01') {
        uVar6 = 7;
        uVar7 = uVar7 + 1;
      }
      cVar3 = (char)uVar1;
      uVar1 = (uint)(byte)(cVar3 - 1);
      if (cVar3 < '\x01') {
        uVar1 = 7;
        sVar5 = sVar5 + 1;
      }
      sVar10 = sVar10 + -1;
    } while (sVar10 != -1);
    uVar1 = (uint)sVar2;
    uVar6 = (uint)sVar8;
    sVar4 = sVar4 + 0x28;
    uVar9 = uVar9 + 0x28;
    sVar11 = sVar11 + -1;
  } while (sVar11 != -1);
  return CONCAT44(in_D0,in_D1);
}


// ==== FUN_00012838 @ 00012838

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00012838(void)

{
  int extraout_A0;
  
  FUN_00012a88();
  FUN_00012a88();
  if (*(short *)(_LAB_000139fe_2 + _LAB_00013a0e_2 * 2) != 0) {
    _LAB_00012aa0 = *(undefined2 *)(extraout_A0 + _LAB_00013a0e_2 * 4);
    _LAB_00012aa0_2 = *(undefined2 *)(extraout_A0 + 2 + _LAB_00013a0e_2 * 4);
    FUN_00012a70();
    FUN_00012a70();
  }
  return;
}


// ==== FUN_000128c6 @ 000128c6

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_000128c6(void)

{
  int extraout_A0;
  
  FUN_00012a88();
  FUN_00012a88();
  if (*(short *)(_LAB_00013a02_2 + _LAB_00013a12 * 2) != 0) {
    _LAB_00012aa4 = *(undefined2 *)(extraout_A0 + _LAB_00013a12 * 4);
    _LAB_00012aa4_2 = *(undefined2 *)(extraout_A0 + 2 + _LAB_00013a12 * 4);
    FUN_00012a70();
    FUN_00012a70();
  }
  return;
}


// ==== FUN_00012954 @ 00012954

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00012954(void)

{
  int extraout_A0;
  
  FUN_00012a88();
  FUN_00012a88();
  if (*(short *)(_LAB_00013a06_2 + _LAB_00013a12_2 * 2) != 0) {
    _LAB_00012aa8 = *(undefined2 *)(extraout_A0 + _LAB_00013a12_2 * 4);
    _LAB_00012aa8_2 = *(undefined2 *)(extraout_A0 + 2 + _LAB_00013a12_2 * 4);
    FUN_00012a70();
    FUN_00012a70();
  }
  return;
}


// ==== FUN_000129e2 @ 000129e2

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_000129e2(void)

{
  int extraout_A0;
  
  FUN_00012a88();
  FUN_00012a88();
  if (*(short *)(_LAB_00013a0a_2 + _LAB_00013a16 * 2) != 0) {
    _LAB_00012aac = *(undefined2 *)(extraout_A0 + _LAB_00013a16 * 4);
    _LAB_00012aac_2 = *(undefined2 *)(extraout_A0 + 2 + _LAB_00013a16 * 4);
    FUN_00012a70();
    FUN_00012a70();
  }
  return;
}


// ==== FUN_00012a70 @ 00012a70

void FUN_00012a70(void)

{
  byte *pbVar1;
  ushort in_D1w;
  short unaff_D2w;
  int in_A1;
  
  pbVar1 = (byte *)(in_A1 + (short)((in_D1w >> 3) + unaff_D2w * 0x28));
  *pbVar1 = *pbVar1 | '\x01' << ((byte)in_D1w & 7 ^ 7);
  return;
}


// ==== FUN_00012a88 @ 00012a88

void FUN_00012a88(void)

{
  byte *pbVar1;
  ushort in_D1w;
  short unaff_D2w;
  int in_A1;
  
  pbVar1 = (byte *)(in_A1 + (short)((in_D1w >> 3) + unaff_D2w * 0x28));
  *pbVar1 = *pbVar1 & ~('\x01' << ((byte)in_D1w & 7 ^ 7));
  return;
}


// ==== FUN_00012ab0 @ 00012ab0

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00012ab0(void)

{
  char cVar1;
  short sVar2;
  char *pcVar3;
  char *pcVar4;
  
  while( true ) {
    if (s_SHIP__SPECIAL_WEAPON_____________00012e58._720_2_ == 0) {
      FUN_000139ae();
      sVar2 = 0x1f;
      pcVar3 = s_SHIP__SPECIAL_WEAPON_____________00012e58 + 0x13;
      do {
        *pcVar3 = ' ';
        sVar2 = sVar2 + -1;
        pcVar3 = pcVar3 + 1;
      } while (sVar2 != -1);
      pcVar3 = (char *)(&DAT_00004ab2)[_DAT_000a0494];
      pcVar4 = s_SHIP__SPECIAL_WEAPON_____________00012e58 + 0x13;
      do {
        cVar1 = *pcVar3;
        *pcVar4 = cVar1;
        pcVar3 = pcVar3 + 1;
        pcVar4 = pcVar4 + 1;
      } while (cVar1 != '\0');
      sVar2 = 0x11;
      pcVar3 = s_NOTHING_MISSILE_GUIDED_MISSILE_T_00099828 +
               (uint)*(ushort *)(PTR_DAT_0009964a + 0x24) * 0x12;
      pcVar4 = s_SHIP__SPECIAL_WEAPON_____________00012e58 + 0x48;
      do {
        *pcVar4 = *pcVar3;
        sVar2 = sVar2 + -1;
        pcVar3 = pcVar3 + 1;
        pcVar4 = pcVar4 + 1;
      } while (sVar2 != -1);
    }
    if (s_SHIP__SPECIAL_WEAPON_____________00012e58
        [(short)s_SHIP__SPECIAL_WEAPON_____________00012e58._720_2_] != ' ') break;
    if (0xb2 < (short)s_SHIP__SPECIAL_WEAPON_____________00012e58._720_2_) goto LAB_00012b7e;
    s_SHIP__SPECIAL_WEAPON_____________00012e58._720_2_ =
         s_SHIP__SPECIAL_WEAPON_____________00012e58._720_2_ + 1;
  }
  FUN_000127b0();
  if ((short)s_SHIP__SPECIAL_WEAPON_____________00012e58._720_2_ < 0xb3) {
    s_SHIP__SPECIAL_WEAPON_____________00012e58._720_2_ =
         s_SHIP__SPECIAL_WEAPON_____________00012e58._720_2_ + 1;
    return;
  }
LAB_00012b7e:
  _LAB_00012830 = _LAB_00012830 + 1;
  return;
}


// ==== FUN_00012b9a @ 00012b9a

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00012b9a(void)

{
  char cVar1;
  short sVar2;
  char *pcVar3;
  char *pcVar4;
  
  while( true ) {
    if (s_SHIP__SPECIAL_WEAPON_____________00012e58._722_2_ == 0) {
      FUN_000139ae();
      sVar2 = 0x1f;
      pcVar3 = s_SHIP__SPECIAL_WEAPON_____________00012e58 + 199;
      do {
        *pcVar3 = ' ';
        sVar2 = sVar2 + -1;
        pcVar3 = pcVar3 + 1;
      } while (sVar2 != -1);
      pcVar3 = (char *)(&DAT_00004ab2)[_DAT_000a0496];
      pcVar4 = s_SHIP__SPECIAL_WEAPON_____________00012e58 + 199;
      do {
        cVar1 = *pcVar3;
        *pcVar4 = cVar1;
        pcVar3 = pcVar3 + 1;
        pcVar4 = pcVar4 + 1;
      } while (cVar1 != '\0');
      sVar2 = 0x11;
      pcVar3 = s_NOTHING_MISSILE_GUIDED_MISSILE_T_00099828 +
               (uint)*(ushort *)(PTR_DAT_0009964e + 0x24) * 0x12;
      pcVar4 = s_SHIP__SPECIAL_WEAPON_____________00012e58 + 0xfc;
      do {
        *pcVar4 = *pcVar3;
        sVar2 = sVar2 + -1;
        pcVar3 = pcVar3 + 1;
        pcVar4 = pcVar4 + 1;
      } while (sVar2 != -1);
    }
    if (s_SHIP__SPECIAL_WEAPON_____________00012e58
        [(short)s_SHIP__SPECIAL_WEAPON_____________00012e58._722_2_ + 0xb4] != ' ') break;
    if (0xb2 < (short)s_SHIP__SPECIAL_WEAPON_____________00012e58._722_2_) goto LAB_00012c68;
    s_SHIP__SPECIAL_WEAPON_____________00012e58._722_2_ =
         s_SHIP__SPECIAL_WEAPON_____________00012e58._722_2_ + 1;
  }
  FUN_000127b0();
  if ((short)s_SHIP__SPECIAL_WEAPON_____________00012e58._722_2_ < 0xb3) {
    s_SHIP__SPECIAL_WEAPON_____________00012e58._722_2_ =
         s_SHIP__SPECIAL_WEAPON_____________00012e58._722_2_ + 1;
    return;
  }
LAB_00012c68:
  _LAB_00012830_2 = _LAB_00012830_2 + 1;
  return;
}


// ==== FUN_00012c84 @ 00012c84

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00012c84(void)

{
  char cVar1;
  short sVar2;
  char *pcVar3;
  char *pcVar4;
  
  while( true ) {
    if (_LAB_0001312c == 0) {
      FUN_000139ae();
      sVar2 = 0x1f;
      pcVar3 = s_SHIP__SPECIAL_WEAPON_____________00012e58 + 0x17b;
      do {
        *pcVar3 = ' ';
        sVar2 = sVar2 + -1;
        pcVar3 = pcVar3 + 1;
      } while (sVar2 != -1);
      pcVar3 = (char *)(&DAT_00004ab2)[_DAT_000a0498];
      pcVar4 = s_SHIP__SPECIAL_WEAPON_____________00012e58 + 0x17b;
      do {
        cVar1 = *pcVar3;
        *pcVar4 = cVar1;
        pcVar3 = pcVar3 + 1;
        pcVar4 = pcVar4 + 1;
      } while (cVar1 != '\0');
      sVar2 = 0x11;
      pcVar3 = s_NOTHING_MISSILE_GUIDED_MISSILE_T_00099828 +
               (uint)*(ushort *)(PTR_DAT_00099652 + 0x24) * 0x12;
      pcVar4 = s_SHIP__SPECIAL_WEAPON_____________00012e58 + 0x1b0;
      do {
        *pcVar4 = *pcVar3;
        sVar2 = sVar2 + -1;
        pcVar3 = pcVar3 + 1;
        pcVar4 = pcVar4 + 1;
      } while (sVar2 != -1);
    }
    if (s_SHIP__SPECIAL_WEAPON_____________00012e58[_LAB_0001312c + 0x168] != ' ') break;
    if (0xb2 < _LAB_0001312c) goto LAB_00012d52;
    _LAB_0001312c = _LAB_0001312c + 1;
  }
  FUN_000127b0();
  if (_LAB_0001312c < 0xb3) {
    _LAB_0001312c = _LAB_0001312c + 1;
    return;
  }
LAB_00012d52:
  _LAB_00012834 = _LAB_00012834 + 1;
  return;
}


// ==== FUN_00012d6e @ 00012d6e

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00012d6e(void)

{
  char cVar1;
  short sVar2;
  char *pcVar3;
  char *pcVar4;
  
  while( true ) {
    if (_LAB_0001312c_2 == 0) {
      FUN_000139ae();
      sVar2 = 0x1f;
      pcVar3 = s_SHIP__SPECIAL_WEAPON_____________00012e58 + 0x22f;
      do {
        *pcVar3 = ' ';
        sVar2 = sVar2 + -1;
        pcVar3 = pcVar3 + 1;
      } while (sVar2 != -1);
      pcVar3 = (char *)(&DAT_00004ab2)[_DAT_000a049a];
      pcVar4 = s_SHIP__SPECIAL_WEAPON_____________00012e58 + 0x22f;
      do {
        cVar1 = *pcVar3;
        *pcVar4 = cVar1;
        pcVar3 = pcVar3 + 1;
        pcVar4 = pcVar4 + 1;
      } while (cVar1 != '\0');
      sVar2 = 0x11;
      pcVar3 = s_NOTHING_MISSILE_GUIDED_MISSILE_T_00099828 +
               (uint)*(ushort *)(PTR_DAT_00099656 + 0x24) * 0x12;
      pcVar4 = s_SHIP__SPECIAL_WEAPON_____________00012e58 + 0x264;
      do {
        *pcVar4 = *pcVar3;
        sVar2 = sVar2 + -1;
        pcVar3 = pcVar3 + 1;
        pcVar4 = pcVar4 + 1;
      } while (sVar2 != -1);
    }
    if (s_SHIP__SPECIAL_WEAPON_____________00012e58[_LAB_0001312c_2 + 0x21c] != ' ') break;
    if (0xb2 < _LAB_0001312c_2) goto LAB_00012e3c;
    _LAB_0001312c_2 = _LAB_0001312c_2 + 1;
  }
  FUN_000127b0();
  if (_LAB_0001312c_2 < 0xb3) {
    _LAB_0001312c_2 = _LAB_0001312c_2 + 1;
    return;
  }
LAB_00012e3c:
  _LAB_00012834_2 = _LAB_00012834_2 + 1;
  return;
}


// ==== FUN_00013130 @ 00013130

void FUN_00013130(void)

{
  while( true ) {
    if (s_j_PLAYER_ONE_IS_READY_TO_EAT_PLA_0001338f._217_2_ == 0) {
      FUN_000139ae();
    }
    if (s_j_PLAYER_ONE_IS_READY_TO_EAT_PLA_0001338f
        [(short)s_j_PLAYER_ONE_IS_READY_TO_EAT_PLA_0001338f._217_2_ + 1] != ' ') break;
    if (0x34 < (short)s_j_PLAYER_ONE_IS_READY_TO_EAT_PLA_0001338f._217_2_) {
      return;
    }
    s_j_PLAYER_ONE_IS_READY_TO_EAT_PLA_0001338f._217_2_ =
         s_j_PLAYER_ONE_IS_READY_TO_EAT_PLA_0001338f._217_2_ + 1;
  }
  FUN_000127b0();
  if (0x34 < (short)s_j_PLAYER_ONE_IS_READY_TO_EAT_PLA_0001338f._217_2_) {
    return;
  }
  s_j_PLAYER_ONE_IS_READY_TO_EAT_PLA_0001338f._217_2_ =
       s_j_PLAYER_ONE_IS_READY_TO_EAT_PLA_0001338f._217_2_ + 1;
  return;
}


// ==== FUN_000131c8 @ 000131c8

void FUN_000131c8(void)

{
  while( true ) {
    if (s_j_PLAYER_ONE_IS_READY_TO_EAT_PLA_0001338f._219_2_ == 0) {
      FUN_000139ae();
    }
    if (s_j_PLAYER_ONE_IS_READY_TO_EAT_PLA_0001338f
        [(short)s_j_PLAYER_ONE_IS_READY_TO_EAT_PLA_0001338f._219_2_ + 0x37] != ' ') break;
    if (0x34 < (short)s_j_PLAYER_ONE_IS_READY_TO_EAT_PLA_0001338f._219_2_) {
      return;
    }
    s_j_PLAYER_ONE_IS_READY_TO_EAT_PLA_0001338f._219_2_ =
         s_j_PLAYER_ONE_IS_READY_TO_EAT_PLA_0001338f._219_2_ + 1;
  }
  FUN_000127b0();
  if (0x34 < (short)s_j_PLAYER_ONE_IS_READY_TO_EAT_PLA_0001338f._219_2_) {
    return;
  }
  s_j_PLAYER_ONE_IS_READY_TO_EAT_PLA_0001338f._219_2_ =
       s_j_PLAYER_ONE_IS_READY_TO_EAT_PLA_0001338f._219_2_ + 1;
  return;
}


// ==== FUN_00013260 @ 00013260

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00013260(void)

{
  while( true ) {
    if (_LAB_0001346c == 0) {
      FUN_000139ae();
    }
    if (s_j_PLAYER_ONE_IS_READY_TO_EAT_PLA_0001338f[_LAB_0001346c + 0x6d] != ' ') break;
    if (0x34 < _LAB_0001346c) {
      return;
    }
    _LAB_0001346c = _LAB_0001346c + 1;
  }
  FUN_000127b0();
  if (0x34 < _LAB_0001346c) {
    return;
  }
  _LAB_0001346c = _LAB_0001346c + 1;
  return;
}


// ==== FUN_000132f8 @ 000132f8

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_000132f8(void)

{
  while( true ) {
    if (_LAB_0001346c_2 == 0) {
      FUN_000139ae();
    }
    if (s_j_PLAYER_ONE_IS_READY_TO_EAT_PLA_0001338f[_LAB_0001346c_2 + 0xa3] != ' ') break;
    if (0x34 < _LAB_0001346c_2) {
      return;
    }
    _LAB_0001346c_2 = _LAB_0001346c_2 + 1;
  }
  FUN_000127b0();
  if (0x34 < _LAB_0001346c_2) {
    return;
  }
  _LAB_0001346c_2 = _LAB_0001346c_2 + 1;
  return;
}


// ==== FUN_00013470 @ 00013470

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00013470(void)

{
  int iVar1;
  short sVar2;
  undefined *puVar3;
  short sVar4;
  undefined2 *puVar5;
  undefined2 *puVar6;
  short *psVar7;
  ushort *puVar8;
  undefined2 *puVar9;
  undefined2 *puVar10;
  
  puVar3 = PTR_DAT_0009964a;
  psVar7 = _LAB_000139fe_2;
  puVar8 = _LAB_000139ee_2;
  if (DAT_000a0490 != '\0') {
    sVar4 = *(short *)(PTR_DAT_0009964a + 2);
    puVar6 = *(undefined2 **)(PTR_DAT_0009964a + 10);
    puVar9 = (undefined2 *)&DAT_00095c28;
    *(undefined2 *)(PTR_DAT_0009964a + 2) = 0;
    while (sVar2 = _LAB_00013a0e_2, sVar4 = sVar4 + -1, sVar4 != -1) {
      if (*psVar7 == 1) {
        puVar6 = puVar6 + 2;
        puVar8 = puVar8 + 1;
        psVar7 = psVar7 + 1;
      }
      else {
        *(short *)(puVar3 + 2) = *(short *)(puVar3 + 2) + 1;
        puVar5 = puVar6 + 1;
        *puVar9 = *puVar6;
        puVar6 = puVar6 + 2;
        puVar10 = puVar9 + 2;
        puVar9[1] = *puVar5;
        puVar9 = puVar9 + 3;
        *puVar10 = (short)(((uint)*puVar8 * 0x100) / 0x168);
        psVar7 = psVar7 + 1;
        puVar8 = puVar8 + 1;
      }
    }
    iVar1 = *(int *)(puVar3 + 10);
    *puVar9 = *(undefined2 *)(iVar1 + _LAB_00013a0e_2 * 4);
    puVar9[1] = *(undefined2 *)(iVar1 + 2 + sVar2 * 4);
    puVar9[2] = (short)(((uint)_LAB_000139ee_2[sVar2] * 0x100) / 0x168);
    *(undefined **)(puVar3 + 10) = &DAT_00095c28;
  }
  puVar3 = PTR_DAT_0009964e;
  psVar7 = _LAB_00013a02_2;
  puVar8 = _LAB_000139f2_2;
  if (DAT_000a0491 != '\0') {
    sVar4 = *(short *)(PTR_DAT_0009964e + 2);
    puVar6 = *(undefined2 **)(PTR_DAT_0009964e + 10);
    puVar9 = (undefined2 *)0x95f28;
    *(undefined2 *)(PTR_DAT_0009964e + 2) = 0;
    while (sVar2 = _LAB_00013a12, sVar4 = sVar4 + -1, sVar4 != -1) {
      if (*psVar7 == 1) {
        puVar6 = puVar6 + 2;
        puVar8 = puVar8 + 1;
        psVar7 = psVar7 + 1;
      }
      else {
        *(short *)(puVar3 + 2) = *(short *)(puVar3 + 2) + 1;
        puVar5 = puVar6 + 1;
        *puVar9 = *puVar6;
        puVar6 = puVar6 + 2;
        puVar10 = puVar9 + 2;
        puVar9[1] = *puVar5;
        puVar9 = puVar9 + 3;
        *puVar10 = (short)(((uint)*puVar8 * 0x100) / 0x168);
        psVar7 = psVar7 + 1;
        puVar8 = puVar8 + 1;
      }
    }
    iVar1 = *(int *)(puVar3 + 10);
    *puVar9 = *(undefined2 *)(iVar1 + _LAB_00013a12 * 4);
    puVar9[1] = *(undefined2 *)(iVar1 + 2 + sVar2 * 4);
    puVar9[2] = (short)(((uint)_LAB_000139f2_2[sVar2] * 0x100) / 0x168);
    *(undefined4 *)(puVar3 + 10) = 0x95f28;
  }
  puVar3 = PTR_DAT_00099652;
  psVar7 = _LAB_00013a06_2;
  puVar8 = _LAB_000139f6_2;
  if (DAT_000a0492 != '\0') {
    sVar4 = *(short *)(PTR_DAT_00099652 + 2);
    puVar6 = *(undefined2 **)(PTR_DAT_00099652 + 10);
    puVar9 = (undefined2 *)&DAT_00096228;
    *(undefined2 *)(PTR_DAT_00099652 + 2) = 0;
    while (sVar2 = _LAB_00013a12_2, sVar4 = sVar4 + -1, sVar4 != -1) {
      if (*psVar7 == 1) {
        puVar6 = puVar6 + 2;
        puVar8 = puVar8 + 1;
        psVar7 = psVar7 + 1;
      }
      else {
        *(short *)(puVar3 + 2) = *(short *)(puVar3 + 2) + 1;
        puVar5 = puVar6 + 1;
        *puVar9 = *puVar6;
        puVar6 = puVar6 + 2;
        puVar10 = puVar9 + 2;
        puVar9[1] = *puVar5;
        puVar9 = puVar9 + 3;
        *puVar10 = (short)(((uint)*puVar8 * 0x100) / 0x168);
        psVar7 = psVar7 + 1;
        puVar8 = puVar8 + 1;
      }
    }
    iVar1 = *(int *)(puVar3 + 10);
    *puVar9 = *(undefined2 *)(iVar1 + _LAB_00013a12_2 * 4);
    puVar9[1] = *(undefined2 *)(iVar1 + 2 + sVar2 * 4);
    puVar9[2] = (short)(((uint)_LAB_000139f6_2[sVar2] * 0x100) / 0x168);
    *(undefined **)(puVar3 + 10) = &DAT_00096228;
  }
  puVar3 = PTR_DAT_00099656;
  psVar7 = _LAB_00013a0a_2;
  puVar8 = _LAB_000139fa_2;
  if (DAT_000a0493 != '\0') {
    sVar4 = *(short *)(PTR_DAT_00099656 + 2);
    puVar6 = *(undefined2 **)(PTR_DAT_00099656 + 10);
    puVar9 = (undefined2 *)0x96528;
    *(undefined2 *)(PTR_DAT_00099656 + 2) = 0;
    while (sVar2 = _LAB_00013a16, sVar4 = sVar4 + -1, sVar4 != -1) {
      if (*psVar7 == 1) {
        puVar6 = puVar6 + 2;
        puVar8 = puVar8 + 1;
        psVar7 = psVar7 + 1;
      }
      else {
        *(short *)(puVar3 + 2) = *(short *)(puVar3 + 2) + 1;
        puVar5 = puVar6 + 1;
        *puVar9 = *puVar6;
        puVar6 = puVar6 + 2;
        puVar10 = puVar9 + 2;
        puVar9[1] = *puVar5;
        puVar9 = puVar9 + 3;
        *puVar10 = (short)(((uint)*puVar8 * 0x100) / 0x168);
        psVar7 = psVar7 + 1;
        puVar8 = puVar8 + 1;
      }
    }
    iVar1 = *(int *)(puVar3 + 10);
    *puVar9 = *(undefined2 *)(iVar1 + _LAB_00013a16 * 4);
    puVar9[1] = *(undefined2 *)(iVar1 + 2 + sVar2 * 4);
    puVar9[2] = (short)(((uint)_LAB_000139fa_2[sVar2] * 0x100) / 0x168);
    *(undefined4 *)(puVar3 + 10) = 0x96528;
  }
  return;
}


// ==== FUN_0001367a @ 0001367a

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

uint FUN_0001367a(void)

{
  short sVar1;
  short sVar2;
  short sVar3;
  short sVar4;
  uint uVar5;
  uint uVar6;
  undefined4 unaff_D5;
  int iVar7;
  short sVar9;
  uint uVar8;
  ushort uVar10;
  undefined4 *in_A0;
  short *psVar11;
  short *psVar12;
  ushort *puVar13;
  ushort *puVar14;
  undefined2 *puVar15;
  undefined *puVar16;
  short *unaff_A4;
  undefined4 unaff_A5;
  undefined4 uVar17;
  
  uVar5 = 0;
  sVar9 = 0x5f;
  _LAB_000137ce_2 = in_A0;
  do {
    *in_A0 = 0;
    in_A0[1] = 0;
    in_A0[2] = 0;
    *(undefined2 *)(in_A0 + 3) = 0;
    in_A0 = in_A0 + 10;
    sVar9 = sVar9 + -1;
  } while (sVar9 != -1);
  psVar12 = *(short **)(unaff_A4 + 3);
  puVar13 = &DAT_00094028;
  puVar16 = &DAT_00099438;
  uVar6 = (uint)_LAB_000137ce;
  sVar3 = *(short *)((int)&PTR_DAT_00099238 + (short)_LAB_000137ce * 2);
  sVar4 = *(short *)(&DAT_00099438 + (short)_LAB_000137ce * 2);
  sVar9 = *unaff_A4;
  while (sVar9 = sVar9 + -1, sVar9 != -1) {
    psVar11 = psVar12 + 1;
    sVar1 = *psVar12;
    psVar12 = psVar12 + 2;
    sVar2 = *psVar11;
    uVar10 = (short)((short)((uint)((int)sVar2 * (int)sVar3 + (int)sVar1 * (int)sVar4) >> 8) * 10 >>
                    6) + 0x38;
    uVar5 = (uint)uVar10;
    puVar14 = puVar13 + 1;
    *puVar13 = uVar10;
    iVar7 = (short)((uint)((int)sVar1 * (int)sVar3 - (int)sVar2 * (int)sVar4) >> 8) * 10;
    uVar10 = (short)(iVar7 >> 6) + 0x30;
    unaff_D5 = CONCAT22((short)(iVar7 >> 0x16),uVar10);
    puVar13 = puVar13 + 2;
    *puVar14 = uVar10;
  }
  psVar12 = *(short **)(unaff_A4 + 5);
  puVar13 = (ushort *)&DAT_00095028;
  sVar9 = unaff_A4[1];
  while (sVar9 = sVar9 + -1, sVar9 != -1) {
    psVar11 = psVar12 + 1;
    sVar1 = *psVar12;
    psVar12 = psVar12 + 2;
    sVar2 = *psVar11;
    uVar10 = (short)((short)((uint)((int)sVar2 * (int)sVar3 + (int)sVar1 * (int)sVar4) >> 8) * 10 >>
                    6) + 0x38;
    uVar5 = (uint)uVar10;
    puVar14 = puVar13 + 1;
    *puVar13 = uVar10;
    iVar7 = (short)((uint)((int)sVar1 * (int)sVar3 - (int)sVar2 * (int)sVar4) >> 8) * 10;
    uVar10 = (short)(iVar7 >> 6) + 0x30;
    unaff_D5 = CONCAT22((short)(iVar7 >> 0x16),uVar10);
    puVar13 = puVar13 + 2;
    *puVar14 = uVar10;
  }
  psVar12 = *(short **)(unaff_A4 + 7);
  puVar15 = &DAT_00094028;
  uVar17 = 0xdff000;
  uVar8 = (uint)(ushort)unaff_A4[2];
  while (uVar10 = (short)uVar8 - 1, uVar8 = (uint)uVar10, uVar10 != 0xffff) {
    psVar11 = psVar12 + 1;
    sVar9 = *psVar12;
    uVar5 = (uint)(ushort)puVar15[sVar9 * 2];
    psVar12 = psVar12 + 2;
    sVar3 = *psVar11;
    FUN_000039d4(uVar5,puVar15[sVar9 * 2 + 1],puVar15[sVar3 * 2],puVar15[sVar3 * 2 + 1],uVar6,
                 unaff_D5,sVar3,uVar8,_LAB_000137ce_2,psVar12,puVar15,puVar16,unaff_A4,unaff_A5,
                 uVar17);
  }
  do {
  } while ((DAT_00dff002 & 0x40) != 0);
  _DAT_00dff044 = 0xffffffff;
  _DAT_00dff040 = 0x19f00012;
  _DAT_00dff064 = 0x1a;
  _DAT_00dff066 = 0x1a;
  _DAT_00dff054 = _LAB_000137ce_2 + 0x3b9;
  _DAT_00dff050 = _LAB_000137ce_2 + 0x3b9;
  _DAT_00dff058 = 0x1807;
  return uVar5;
}


// ==== FUN_000137d4 @ 000137d4

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_000137d4(void)

{
  ushort in_D0w;
  uint in_D1;
  undefined *puVar1;
  int unaff_D2;
  undefined4 unaff_D3;
  short sVar2;
  
  puVar1 = &DAT_000a9000 + (in_D0w >> 3 & 0xfffe) + (in_D1 & 0xffff) * 0x28;
  sVar2 = 4;
  do {
    do {
    } while ((DAT_00dff002 & 0x40) != 0);
    puVar1 = puVar1 + 0x2800;
    sVar2 = sVar2 + -1;
  } while (sVar2 != -1);
  sVar2 = 4;
  do {
    do {
    } while ((DAT_00dff002 & 0x40) != 0);
    _DAT_00dff050 = unaff_D3;
    _DAT_00dff04c = unaff_D2;
    _DAT_00dff048 = puVar1;
    _DAT_00dff054 = puVar1;
    _DAT_00dff042 = in_D0w << 0xc;
    _DAT_00dff040 = in_D0w << 0xc | 0xfca;
    _DAT_00dff044 = 0xffffffff;
    _DAT_00dff064 = 0;
    _DAT_00dff062 = 0;
    _DAT_00dff060 = 0x22;
    _DAT_00dff066 = 0x22;
    _DAT_00dff058 = 0x803;
    puVar1 = puVar1 + 0x2800;
    unaff_D2 = unaff_D2 + 0xc0;
    sVar2 = sVar2 + -1;
  } while (sVar2 != -1);
  return;
}


// ==== FUN_000138d0 @ 000138d0

void FUN_000138d0(void)

{
  short sVar1;
  undefined4 *in_A0;
  undefined4 *puVar2;
  undefined4 *puVar3;
  
  puVar2 = (undefined4 *)0x76e20;
  sVar1 = 0x5f;
  do {
    *in_A0 = *puVar2;
    in_A0[1] = puVar2[1];
    puVar3 = puVar2 + 3;
    in_A0[2] = puVar2[2];
    puVar2 = (undefined4 *)((int)puVar2 + 0xe);
    *(undefined2 *)(in_A0 + 3) = *(undefined2 *)puVar3;
    in_A0 = in_A0 + 10;
    sVar1 = sVar1 + -1;
  } while (sVar1 != -1);
  return;
}


// ==== FUN_000138ec @ 000138ec

void FUN_000138ec(void)

{
  short sVar1;
  undefined4 *in_A0;
  undefined4 *puVar2;
  undefined4 *puVar3;
  
  puVar2 = (undefined4 *)0x77360;
  sVar1 = 0x5f;
  do {
    *in_A0 = *puVar2;
    in_A0[1] = puVar2[1];
    puVar3 = puVar2 + 3;
    in_A0[2] = puVar2[2];
    puVar2 = (undefined4 *)((int)puVar2 + 0xe);
    *(undefined2 *)(in_A0 + 3) = *(undefined2 *)puVar3;
    in_A0 = in_A0 + 10;
    sVar1 = sVar1 + -1;
  } while (sVar1 != -1);
  return;
}


// ==== FUN_00013908 @ 00013908

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00013908(void)

{
  short sVar1;
  int in_A0;
  int extraout_A0;
  
  _DAT_00dff050 = in_A0 + 0xee4;
  do {
  } while ((DAT_00dff002 & 0x40) != 0);
  _DAT_00dff044 = 0xffffffff;
  _DAT_00dff040 = 0x19f00012;
  _DAT_00dff064 = 0x1a;
  _DAT_00dff066 = 0x1a;
  _DAT_00dff058 = 0x1807;
  _DAT_00dff054 = _DAT_00dff050;
  sVar1 = FUN_00013964();
  if (sVar1 != 0) {
    *(byte *)(extraout_A0 + 1) = *(byte *)(extraout_A0 + 1) | 1;
  }
  return;
}


// ==== FUN_00013964 @ 00013964

uint FUN_00013964(void)

{
  ushort extraout_D0u;
  ushort unaff_D2w;
  
  FUN_0001397a();
  return (uint)extraout_D0u % (0x8000 / unaff_D2w) << 0x10 |
         (uint)extraout_D0u / (0x8000 / unaff_D2w);
}


// ==== FUN_0001397a @ 0001397a

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_0001397a(void)

{
  _LAB_000139d4 = (_LAB_000139d4 * 0xe5d + 0xe60U & 0x7fffffff) - 1;
  return;
}


// ==== FUN_000139ae @ 000139ae

void FUN_000139ae(void)

{
  short sVar1;
  undefined4 *in_A0;
  undefined4 *in_A1;
  
  sVar1 = 0x5f;
  do {
    *in_A0 = 0;
    in_A0[1] = 0;
    in_A0[2] = 0;
    *(undefined2 *)(in_A0 + 3) = 0;
    *in_A1 = 0;
    in_A1[1] = 0;
    in_A1[2] = 0;
    *(undefined2 *)(in_A1 + 3) = 0;
    in_A0 = in_A0 + 10;
    in_A1 = in_A1 + 10;
    sVar1 = sVar1 + -1;
  } while (sVar1 != -1);
  return;
}


// ==== FUN_00013a34 @ 00013a34

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00013a34(void)

{
  ushort uVar1;
  short sVar2;
  char *extraout_A0;
  
  FUN_0000439a();
  DAT_000a0006 = 0x28;
  FUN_00000976();
  DAT_000a000a = 0;
  DAT_000a000c = 0;
  DAT_000a000e = 0x140;
  DAT_000a0010 = 0x100;
  DAT_000a0016 = 0;
  DAT_000a0012 = 200;
  DAT_000a0014 = 200;
  DAT_000a0018 = 6;
  FUN_00000996();
  FUN_00008db2();
  FUN_00013da4();
  _DAT_000793b2 = 0x8fe0;
  _DAT_000793ae = 7;
  _DAT_00dff080 = &DAT_00079300;
  _DAT_00dff088 = 7;
  _DAT_000a0004 = 0;
  do {
    do {
    } while (((ushort)((uint)_DAT_00dff004 >> 8) & 0x1ff) != 300);
    FUN_00008db2();
    FUN_00013da4();
    _DAT_000a0004 = _DAT_000a0004 + 6;
  } while (_DAT_000a0004 < 0x100);
  sVar2 = 0x95;
  do {
    do {
      uVar1 = (ushort)((uint)_DAT_00dff004 >> 8);
    } while ((uVar1 & 0x1ff) != 300);
    do {
    } while ((uVar1 & 0x1ff) != 0x12d);
    sVar2 = sVar2 + -1;
  } while (sVar2 != -1);
  _DAT_000a0004 = 0x100;
  do {
    do {
    } while (((ushort)((uint)_DAT_00dff004 >> 8) & 0x1ff) != 300);
    FUN_00008db2();
    FUN_00013da4();
    _DAT_000a0004 = _DAT_000a0004 + -8;
  } while (0 < _DAT_000a0004);
  FUN_00008db2();
  FUN_00013da4();
  FUN_00013d7e();
  DAT_000a0006 = 0x28;
  FUN_00000976();
  DAT_000a000a = 0;
  DAT_000a000c = 0;
  DAT_000a000e = 0x140;
  DAT_000a0010 = 0x100;
  DAT_000a0016 = 0;
  DAT_000a0012 = 0xa0;
  DAT_000a0014 = 0xa0;
  DAT_000a0018 = 5;
  FUN_00000996();
  _DAT_000793b2 = 0x91f4;
  _DAT_000793ae = 7;
  _DAT_000a0000 = (char *)0x93f5a;
  do {
    FUN_00013ce8();
    _DAT_000a0000 = extraout_A0;
    if (*extraout_A0 < '\0') break;
  } while ((DAT_00bfe001 & 0x40) != 0);
  do {
    if ((DAT_00bfe001 & 0x40) == 0) break;
  } while ((DAT_00bfe001 & 0x80) != 0);
  _DAT_000a0004 = 0x100;
  do {
    do {
    } while (((ushort)((uint)_DAT_00dff004 >> 8) & 0x1ff) != 300);
    FUN_00008db2();
    FUN_00013de8();
    _DAT_000a0004 = _DAT_000a0004 + -5;
  } while (0 < _DAT_000a0004);
  return;
}


// ==== FUN_00013ce8 @ 00013ce8

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00013ce8(void)

{
  short sVar1;
  uint uVar2;
  char *in_A0;
  char *pcVar3;
  
  sVar1 = (short)*in_A0;
  uVar2 = (uint)(ushort)(short)in_A0[1];
  pcVar3 = in_A0 + 2;
  while( true ) {
    do {
    } while (((ushort)((uint)_DAT_00dff004 >> 8) & 0x1ff) != 300);
    if (*pcVar3 == '\0') break;
    FUN_00013d1c(sVar1,uVar2);
    sVar1 = sVar1 + 1;
    pcVar3 = pcVar3 + 1;
  }
  return;
}


// ==== FUN_00013d1c @ 00013d1c

void FUN_00013d1c(void)

{
  short in_D0w;
  uint in_D1;
  char unaff_D2b;
  int iVar1;
  short sVar2;
  undefined2 *puVar3;
  undefined2 *puVar4;
  undefined2 *puVar5;
  char *pcVar6;
  
  iVar1 = 0;
  pcVar6 = (char *)0x93f38;
  while (unaff_D2b != *pcVar6) {
    iVar1 = iVar1 + 0xa0;
    pcVar6 = pcVar6 + 1;
  }
  puVar4 = (undefined2 *)(iVar1 + 0x92ab8);
  puVar3 = (undefined2 *)(&DAT_000a9000 + (in_D1 & 0xffff) * 0xc80 + (int)(short)(in_D0w << 1));
  sVar2 = 0xf;
  do {
    *puVar3 = *puVar4;
    puVar3[0x14] = puVar4[1];
    puVar3[0x28] = puVar4[2];
    puVar5 = puVar4 + 4;
    puVar3[0x3c] = puVar4[3];
    puVar4 = puVar4 + 5;
    puVar3[0x50] = *puVar5;
    puVar3 = puVar3 + 100;
    sVar2 = sVar2 + -1;
  } while (sVar2 != -1);
  return;
}


// ==== FUN_00013d7e @ 00013d7e

void FUN_00013d7e(void)

{
  short sVar1;
  undefined4 *puVar2;
  undefined4 *puVar3;
  
  puVar2 = (undefined4 *)&DAT_000a9000;
  sVar1 = 0x5ff;
  do {
    *puVar2 = 0;
    puVar2[1] = 0;
    puVar2[2] = 0;
    puVar2[3] = 0;
    puVar2[4] = 0;
    puVar2[5] = 0;
    puVar2[6] = 0;
    puVar2[7] = 0;
    puVar3 = puVar2 + 9;
    puVar2[8] = 0;
    puVar2 = puVar2 + 10;
    *puVar3 = 0;
    sVar1 = sVar1 + -1;
  } while (sVar1 != -1);
  return;
}


// ==== FUN_00013da4 @ 00013da4

void FUN_00013da4(void)

{
  short sVar1;
  undefined2 *puVar2;
  undefined2 *puVar3;
  undefined2 *puVar4;
  
  FUN_00008e4c();
  puVar2 = (undefined2 *)0x111ba;
  sVar1 = 0x1f;
  puVar3 = (undefined2 *)0x78fe6;
  do {
    puVar4 = puVar3;
    puVar3 = puVar2 + 1;
    *puVar4 = *puVar2;
    puVar2 = puVar2 + 2;
    puVar4[0x42] = *puVar3;
    sVar1 = sVar1 + -1;
    puVar3 = puVar4 + 2;
  } while (sVar1 != -1);
  puVar4 = puVar4 + 0x46;
  sVar1 = 0x1f;
  do {
    puVar3 = puVar2 + 1;
    *puVar4 = *puVar2;
    puVar2 = puVar2 + 2;
    puVar4[0x42] = *puVar3;
    puVar4 = puVar4 + 2;
    sVar1 = sVar1 + -1;
  } while (sVar1 != -1);
  return;
}


// ==== FUN_00013de8 @ 00013de8

void FUN_00013de8(void)

{
  short sVar1;
  undefined2 *puVar2;
  undefined2 *puVar3;
  undefined2 *puVar4;
  
  FUN_00008e4c();
  puVar2 = (undefined2 *)0x111ba;
  puVar4 = (undefined2 *)0x791fa;
  sVar1 = 0x1f;
  do {
    puVar3 = puVar2 + 1;
    *puVar4 = *puVar2;
    puVar2 = puVar2 + 2;
    puVar4[0x42] = *puVar3;
    puVar4 = puVar4 + 2;
    sVar1 = sVar1 + -1;
  } while (sVar1 != -1);
  return;
}


