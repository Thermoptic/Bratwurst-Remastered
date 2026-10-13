// ==== FUN_00000976 @ 00000976

void FUN_00000976(void)

{
  int in_D1;
  short sVar1;
  undefined2 *puVar2;
  
  puVar2 = &DAT_00009302;
  sVar1 = 7;
  do {
    puVar2[2] = (short)in_D1;
    *puVar2 = (short)((uint)in_D1 >> 0x10);
    in_D1 = DAT_00000006 + in_D1;
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
  
  if (DAT_00000018 == 6) {
    _DAT_0000934e = 0x200;
  }
  uVar1 = DAT_00000018;
  if (DAT_00000018 == 8) {
    uVar1 = 0x100;
  }
  uVar1 = uVar1 << 0xc | uVar1 >> 4;
  if (DAT_00000016 != 0) {
    uVar1 = uVar1 | 0x8000;
    if ((short)DAT_00000018 < 5) {
      _DAT_00009342 = 0;
    }
    else {
      _DAT_00009342 = 1;
    }
  }
  _DAT_00009346 = uVar1 | 0x200;
  _DAT_0000934a = 0;
  _DAT_00009356 = DAT_00000012;
  _DAT_0000935a = DAT_00000014;
  DAT_0000935f = (char)DAT_0000000a + -0x7f;
  DAT_0000935e = (char)(DAT_0000000c + 0x2c);
  sVar2 = DAT_0000000c + 0x2c + DAT_00000010;
  if (0xff < sVar2) {
    sVar2 = sVar2 + -0x100;
  }
  DAT_00009362 = (char)sVar2;
  DAT_00009363 = DAT_0000935f + (char)DAT_0000000e;
  _DAT_00009366 = ((ushort)(DAT_0000000a + 0x81U) >> 1) - 8;
  _DAT_0000936a = ((DAT_0000000e >> 4) - 1) * 8 + _DAT_00009366;
  _DAT_0000001a = (uint)DAT_00000010 * (uint)(ushort)(DAT_00000012 + (DAT_0000000e >> 3));
  _DAT_0000001e = (uint)DAT_00000010 * (uint)(ushort)(DAT_00000014 + (DAT_0000000e >> 3));
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


// ==== FUN_000018da @ 000018da

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_000018da(void)

{
  short sVar1;
  short sVar2;
  short sVar3;
  short sVar4;
  short sVar5;
  short *psVar6;
  short *psVar7;
  undefined **ppuVar8;
  
  psVar7 = *(short **)(DAT_0000964a + 3);
  ppuVar8 = &PTR_DAT_00004028;
  _DAT_0000056a = _DAT_0000055a;
  _DAT_00000568 = _DAT_00000558;
  _DAT_0000055a = _DAT_0000054a;
  _DAT_00000558 = _DAT_00000548;
  _DAT_0000054a = 0;
  _DAT_00000548 = 0x7fff;
  sVar2 = *(short *)(&DAT_00009238 + DAT_00006868 * 2);
  sVar3 = *(short *)(&DAT_00009438 + DAT_00006868 * 2);
  sVar5 = *DAT_0000964a;
  while (sVar5 = sVar5 + -1, sVar5 != -1) {
    psVar6 = psVar7 + 1;
    sVar1 = *psVar7;
    psVar7 = psVar7 + 2;
    sVar1 = (short)((uint)((int)sVar1 * (int)DAT_000004e8) >> 8) >> 8;
    sVar4 = (short)((uint)((int)*psVar6 * (int)DAT_000004e8) >> 8) >> 8;
    psVar6 = (short *)((int)ppuVar8 + 2);
    *(short *)ppuVar8 = (short)(sVar4 * sVar2 + sVar1 * sVar3) >> 8;
    sVar1 = (short)(sVar1 * sVar2 - sVar4 * sVar3) >> 8;
    ppuVar8 = ppuVar8 + 1;
    *psVar6 = sVar1;
    if (sVar1 < _DAT_00000548) {
      _DAT_00000548 = sVar1;
    }
    if (_DAT_0000054a < sVar1) {
      _DAT_0000054a = sVar1;
    }
  }
  return;
}


// ==== FUN_00001c3e @ 00001c3e

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

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
  
  psVar7 = *(short **)(DAT_0000964e + 3);
  psVar8 = (short *)0x4428;
  _DAT_0000056e = _DAT_0000055e;
  _DAT_0000056c = _DAT_0000055c;
  _DAT_0000055e = DAT_0000054e;
  _DAT_0000055c = DAT_0000054c;
  DAT_0000054e = 0;
  DAT_0000054c = 0x7fff;
  sVar2 = *(short *)(&DAT_00009238 + DAT_00006982 * 2);
  sVar3 = *(short *)(&DAT_00009438 + DAT_00006982 * 2);
  sVar5 = *DAT_0000964e;
  while (sVar5 = sVar5 + -1, sVar5 != -1) {
    psVar6 = psVar7 + 1;
    sVar1 = *psVar7;
    psVar7 = psVar7 + 2;
    sVar1 = (short)((uint)((int)sVar1 * (int)DAT_000004e8) >> 8) >> 8;
    sVar4 = (short)((uint)((int)*psVar6 * (int)DAT_000004e8) >> 8) >> 8;
    psVar6 = psVar8 + 1;
    *psVar8 = (short)(sVar4 * sVar2 + sVar1 * sVar3) >> 8;
    sVar1 = (short)(sVar1 * sVar2 - sVar4 * sVar3) >> 8;
    psVar8 = psVar8 + 2;
    *psVar6 = sVar1;
    if (sVar1 < DAT_0000054c) {
      DAT_0000054c = sVar1;
    }
    if (DAT_0000054e < sVar1) {
      DAT_0000054e = sVar1;
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
  
  sVar1 = *(short *)(&DAT_00009238 + DAT_00006982 * 2);
  sVar2 = *(short *)(&DAT_00009438 + DAT_00006982 * 2);
  psVar6 = *(short **)(DAT_0000964e + 10);
  piVar7 = &DAT_00005328;
  sVar4 = *(short *)(DAT_0000964e + 2) + 1;
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


// ==== FUN_00001fa2 @ 00001fa2

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

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
  
  psVar7 = *(short **)(_DAT_00009652 + 3);
  psVar8 = (short *)0x4828;
  _DAT_00000572 = _DAT_00000562;
  _DAT_00000570 = _DAT_00000560;
  _DAT_00000562 = _DAT_00000552;
  _DAT_00000560 = _DAT_00000550;
  _DAT_00000552 = 0;
  _DAT_00000550 = 0x7fff;
  sVar2 = *(short *)(&DAT_00009238 + _DAT_00006a9c * 2);
  sVar3 = *(short *)(&DAT_00009438 + _DAT_00006a9c * 2);
  sVar5 = *_DAT_00009652;
  while (sVar5 = sVar5 + -1, sVar5 != -1) {
    psVar6 = psVar7 + 1;
    sVar1 = *psVar7;
    psVar7 = psVar7 + 2;
    sVar1 = (short)((uint)((int)sVar1 * (int)DAT_000004e8) >> 8) >> 8;
    sVar4 = (short)((uint)((int)*psVar6 * (int)DAT_000004e8) >> 8) >> 8;
    psVar6 = psVar8 + 1;
    *psVar8 = (short)(sVar4 * sVar2 + sVar1 * sVar3) >> 8;
    sVar1 = (short)(sVar1 * sVar2 - sVar4 * sVar3) >> 8;
    psVar8 = psVar8 + 2;
    *psVar6 = sVar1;
    if (sVar1 < _DAT_00000550) {
      _DAT_00000550 = sVar1;
    }
    if (_DAT_00000552 < sVar1) {
      _DAT_00000552 = sVar1;
    }
  }
  return;
}


// ==== FUN_00002302 @ 00002302

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

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
  
  psVar7 = *(short **)(DAT_00009656 + 3);
  psVar8 = (short *)&DAT_00004c28;
  _DAT_00000576 = _DAT_00000566;
  _DAT_00000574 = _DAT_00000564;
  _DAT_00000566 = DAT_00000556;
  _DAT_00000564 = DAT_00000554;
  DAT_00000556 = 0;
  DAT_00000554 = 0x7fff;
  sVar2 = *(short *)(&DAT_00009238 + DAT_00006bb6 * 2);
  sVar3 = *(short *)(&DAT_00009438 + DAT_00006bb6 * 2);
  sVar5 = *DAT_00009656;
  while (sVar5 = sVar5 + -1, sVar5 != -1) {
    psVar6 = psVar7 + 1;
    sVar1 = *psVar7;
    psVar7 = psVar7 + 2;
    sVar1 = (short)((uint)((int)sVar1 * (int)DAT_000004e8) >> 8) >> 8;
    sVar4 = (short)((uint)((int)*psVar6 * (int)DAT_000004e8) >> 8) >> 8;
    psVar6 = psVar8 + 1;
    *psVar8 = (short)(sVar4 * sVar2 + sVar1 * sVar3) >> 8;
    sVar1 = (short)(sVar1 * sVar2 - sVar4 * sVar3) >> 8;
    psVar8 = psVar8 + 2;
    *psVar6 = sVar1;
    if (sVar1 < DAT_00000554) {
      DAT_00000554 = sVar1;
    }
    if (DAT_00000556 < sVar1) {
      DAT_00000556 = sVar1;
    }
  }
  return;
}


// ==== FUN_000023c0 @ 000023c0

void FUN_000023c0(void)

{
  short sVar1;
  short sVar2;
  undefined *puVar3;
  short sVar4;
  short *psVar5;
  short *psVar6;
  undefined **ppuVar7;
  undefined **ppuVar8;
  
  sVar1 = *(short *)(&DAT_00009238 + DAT_00006bb6 * 2);
  sVar2 = *(short *)(&DAT_00009438 + DAT_00006bb6 * 2);
  psVar6 = *(short **)(DAT_00009656 + 10);
  ppuVar7 = &PTR_DAT_00005928;
  sVar4 = *(short *)(DAT_00009656 + 2) + 1;
  while (sVar4 = sVar4 + -1, sVar4 != -1) {
    psVar5 = psVar6 + 2;
    puVar3 = (undefined *)
             (DAT_00006baa + ((int)*psVar6 * (int)sVar1 - (int)psVar6[1] * (int)sVar2 >> 8) * 0x80);
    *ppuVar7 = (undefined *)
               (DAT_00006ba6 + ((int)psVar6[1] * (int)sVar1 + (int)*psVar6 * (int)sVar2 >> 8) * 0x80
               );
    ppuVar8 = ppuVar7 + 2;
    ppuVar7[1] = puVar3;
    psVar6 = psVar6 + 3;
    ppuVar7 = (undefined **)((int)ppuVar7 + 10);
    *(short *)ppuVar8 = *psVar5;
  }
  return;
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


// ==== FUN_0000308e @ 0000308e

void FUN_0000308e(void)

{
  ushort uVar1;
  short in_D0w;
  short sVar2;
  short in_D1w;
  short unaff_D2w;
  ushort uVar3;
  short unaff_D3w;
  short sVar4;
  short sVar5;
  int in_A0;
  byte *pbVar6;
  int extraout_A1;
  int extraout_A1_00;
  int extraout_A1_01;
  int extraout_A1_02;
  int unaff_A6;
  
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
        if (in_D1w < 0x100) break;
        if (0xff < unaff_D3w) {
          return;
        }
        in_D0w = in_D0w - (short)(((uint)(ushort)(in_D0w - unaff_D2w) *
                                  (uint)(ushort)(in_D1w - 0xff)) /
                                 (uint)(ushort)(in_D1w - unaff_D3w));
        in_D1w = 0xff;
      }
      sVar4 = unaff_D3w;
      if (0x13f < in_D0w) {
        if (unaff_D2w < 0x140) {
          uVar3 = in_D0w - unaff_D2w;
          uVar1 = in_D0w - 0x13f;
          FUN_0000335c();
          unaff_D2w = 0x13f;
          in_D0w = 0x13f;
          in_A0 = extraout_A1_02;
          sVar4 = in_D1w - (short)(((uint)(ushort)(in_D1w - unaff_D3w) * (uint)uVar1) / (uint)uVar3)
          ;
        }
        else {
          unaff_D2w = 0x13f;
          in_D0w = 0x13f;
        }
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
        if (unaff_D3w < 0x100) break;
        if (0xff < in_D1w) {
          return;
        }
        unaff_D2w = (short)(((uint)(ushort)(in_D0w - unaff_D2w) * (uint)(ushort)(unaff_D3w - 0xff))
                           / (uint)(ushort)(unaff_D3w - in_D1w)) + unaff_D2w;
        unaff_D3w = 0xff;
      }
      sVar4 = unaff_D3w;
      if (0x13f < in_D0w) {
        if (unaff_D2w < 0x140) {
          uVar3 = in_D0w - unaff_D2w;
          uVar1 = in_D0w - 0x13f;
          FUN_0000335c();
          unaff_D2w = 0x13f;
          in_D0w = 0x13f;
          in_A0 = extraout_A1_00;
          sVar4 = in_D1w;
          in_D1w = (short)(((uint)(ushort)(unaff_D3w - in_D1w) * (uint)uVar1) / (uint)uVar3) +
                   in_D1w;
        }
        else {
          in_D0w = 0x13f;
          unaff_D2w = in_D0w;
        }
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
      if (in_D1w < 0x100) break;
      if (0xff < unaff_D3w) {
        return;
      }
      in_D0w = (short)(((uint)(ushort)(unaff_D2w - in_D0w) * (uint)(ushort)(in_D1w - 0xff)) /
                      (uint)(ushort)(in_D1w - unaff_D3w)) + in_D0w;
      in_D1w = 0xff;
    }
    sVar4 = unaff_D3w;
    if (0x13f < unaff_D2w) {
      if (in_D0w < 0x140) {
        uVar3 = unaff_D2w - in_D0w;
        uVar1 = unaff_D2w - 0x13f;
        FUN_0000335c();
        in_D0w = 0x13f;
        in_A0 = extraout_A1_01;
        unaff_D2w = 0x13f;
        sVar4 = (short)(((uint)(ushort)(in_D1w - unaff_D3w) * (uint)uVar1) / (uint)uVar3) +
                unaff_D3w;
        in_D1w = unaff_D3w;
      }
      else {
        in_D0w = 0x13f;
        unaff_D2w = 0x13f;
      }
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
      if (unaff_D3w < 0x100) break;
      if (0xff < in_D1w) {
        return;
      }
      unaff_D2w = unaff_D2w -
                  (short)(((uint)(ushort)(unaff_D2w - in_D0w) * (uint)(ushort)(unaff_D3w - 0xff)) /
                         (uint)(ushort)(unaff_D3w - in_D1w));
      unaff_D3w = 0xff;
    }
    sVar4 = unaff_D3w;
    if (0x13f < unaff_D2w) {
      if (in_D0w < 0x140) {
        uVar3 = unaff_D2w - in_D0w;
        uVar1 = unaff_D2w - 0x13f;
        FUN_0000335c();
        in_D0w = 0x13f;
        in_A0 = extraout_A1;
        unaff_D2w = 0x13f;
        in_D1w = unaff_D3w -
                 (short)(((uint)(ushort)(unaff_D3w - in_D1w) * (uint)uVar1) / (uint)uVar3);
      }
      else {
        in_D0w = 0x13f;
        unaff_D2w = in_D0w;
      }
    }
  }
  if (sVar4 != in_D1w) {
    sVar2 = in_D0w;
    sVar5 = sVar4;
    if (in_D1w < sVar4) {
      sVar2 = unaff_D2w;
      unaff_D2w = in_D0w;
      sVar5 = in_D1w;
      in_D1w = sVar4;
    }
    sVar2 = sVar2 - unaff_D2w;
    sVar4 = in_D1w - sVar5;
    pbVar6 = (byte *)((int)(unaff_D2w >> 3) + sVar5 * 0x28 + in_A0);
    sVar5 = sVar4;
    if (sVar2 < 0) {
      sVar2 = -sVar2;
      if (sVar2 < sVar4) {
        uVar3 = 0x49;
        sVar4 = sVar2;
      }
      else {
        uVar3 = 0x55;
        sVar5 = sVar2;
      }
    }
    else if (sVar2 < sVar4) {
      uVar3 = 0x41;
      sVar4 = sVar2;
    }
    else {
      uVar3 = 0x51;
      sVar5 = sVar2;
    }
    sVar4 = sVar4 * 2;
    sVar2 = sVar4 - sVar5;
    if (sVar2 != 0 && sVar5 <= sVar4) {
      uVar3 = uVar3 & 0xffbf;
    }
    do {
    } while ((*(byte *)(unaff_A6 + 2) & 0x40) != 0);
    *pbVar6 = *pbVar6 ^ '\x01' << (((byte)unaff_D2w & 0xf ^ 0xf) & 7);
    *(uint *)(unaff_A6 + 0x40) = CONCAT22(unaff_D2w << 0xc,uVar3) | 0xb4a0002;
    *(undefined4 *)(unaff_A6 + 0x44) = 0xffffffff;
    *(byte **)(unaff_A6 + 0x48) = pbVar6;
    *(short *)(unaff_A6 + 0x52) = sVar2;
    *(byte **)(unaff_A6 + 0x54) = pbVar6;
    *(undefined2 *)(unaff_A6 + 0x60) = 0x28;
    *(short *)(unaff_A6 + 0x62) = sVar4;
    *(short *)(unaff_A6 + 100) = sVar2 - sVar5;
    *(undefined2 *)(unaff_A6 + 0x66) = 0x28;
    *(undefined4 *)(unaff_A6 + 0x72) = 0xffff8000;
    *(short *)(unaff_A6 + 0x58) = sVar5 * 0x40 + 0x42;
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
      (&LAB_00004710)[(short)uVar2] = 0;
    }
    else {
      (&LAB_00004710)[(short)uVar2] = 1;
    }
  }
                    /* WARNING: Bad instruction - Truncating control flow here */
  halt_baddata();
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
  
  puVar2 = (undefined2 *)0x96f6;
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


// ==== FUN_000054dc @ 000054dc

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_000054dc(void)

{
  if (_DAT_00000454 != PTR_DAT_0000044a._2_2_) {
    _DAT_00000454 = PTR_DAT_0000044a._2_2_;
    FUN_000055b0();
  }
  return;
}


// ==== FUN_0000550e @ 0000550e

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_0000550e(void)

{
  if (_DAT_00000456 != _DAT_0000044e) {
    _DAT_00000456 = _DAT_0000044e;
    FUN_000055b0();
  }
  return;
}


// ==== FUN_00005544 @ 00005544

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00005544(void)

{
  if (PTR_LAB_00007444_2_00000458._0_2_ != _DAT_00000450) {
    PTR_LAB_00007444_2_00000458._0_2_ = _DAT_00000450;
    FUN_000055b0();
  }
  return;
}


// ==== FUN_0000557a @ 0000557a

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_0000557a(void)

{
  if (PTR_LAB_00007444_2_00000458._2_2_ != _DAT_00000452) {
    PTR_LAB_00007444_2_00000458._2_2_ = _DAT_00000452;
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
  
  _DAT_00dff048 = (uint *)((in_D0w >> 3 & 0xfffe) + (in_D1 & 0xffff) * 200 + 0x5270);
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
  uRam00dff04c = unaff_D2;
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

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00005674(void)

{
  short sVar1;
  short sVar2;
  
  sVar2 = (short)(((uint)_DAT_00000578 * 0x2f) / (uint)_DAT_00000540);
  if (_LAB_00005b8c < sVar2) {
    sVar1 = sVar2 - _LAB_00005b8c;
    _LAB_00005b8c = sVar2;
    while (sVar1 = sVar1 + -1, sVar1 != -1) {
      FUN_00005b3c();
    }
    return;
  }
  if (sVar2 < _LAB_00005b8c) {
    sVar1 = _LAB_00005b8c - sVar2;
    _LAB_00005b8c = sVar2;
    while (sVar1 = sVar1 + -1, sVar1 != -1) {
      FUN_00005b64();
    }
    return;
  }
  return;
}


// ==== FUN_000056da @ 000056da

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_000056da(void)

{
  short sVar1;
  short sVar2;
  
  sVar2 = (short)(((uint)_DAT_0000057a * 0x2f) / (uint)_DAT_00000542);
  if (_LAB_00005b8c_2 < sVar2) {
    sVar1 = sVar2 - _LAB_00005b8c_2;
    _LAB_00005b8c_2 = sVar2;
    while (sVar1 = sVar1 + -1, sVar1 != -1) {
      FUN_00005b3c();
    }
    return;
  }
  if (sVar2 < _LAB_00005b8c_2) {
    sVar1 = _LAB_00005b8c_2 - sVar2;
    _LAB_00005b8c_2 = sVar2;
    while (sVar1 = sVar1 + -1, sVar1 != -1) {
      FUN_00005b64();
    }
    return;
  }
  return;
}


// ==== FUN_00005740 @ 00005740

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00005740(void)

{
  short sVar1;
  short sVar2;
  
  sVar2 = (short)(((uint)_DAT_0000057c * 0x2f) / (uint)_DAT_00000544);
  if (_LAB_00005b90 < sVar2) {
    sVar1 = sVar2 - _LAB_00005b90;
    _LAB_00005b90 = sVar2;
    while (sVar1 = sVar1 + -1, sVar1 != -1) {
      FUN_00005b3c();
    }
    return;
  }
  if (sVar2 < _LAB_00005b90) {
    sVar1 = _LAB_00005b90 - sVar2;
    _LAB_00005b90 = sVar2;
    while (sVar1 = sVar1 + -1, sVar1 != -1) {
      FUN_00005b64();
    }
    return;
  }
  return;
}


// ==== FUN_000057a6 @ 000057a6

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_000057a6(void)

{
  short sVar1;
  short sVar2;
  
  sVar2 = (short)(((uint)_DAT_0000057e * 0x2f) / (uint)_DAT_00000546);
  if (_LAB_00005b90_2 < sVar2) {
    sVar1 = sVar2 - _LAB_00005b90_2;
    _LAB_00005b90_2 = sVar2;
    while (sVar1 = sVar1 + -1, sVar1 != -1) {
      FUN_00005b3c();
    }
    return;
  }
  if (sVar2 < _LAB_00005b90_2) {
    sVar1 = _LAB_00005b90_2 - sVar2;
    _LAB_00005b90_2 = sVar2;
    while (sVar1 = sVar1 + -1, sVar1 != -1) {
      FUN_00005b64();
    }
    return;
  }
  return;
}


// ==== FUN_0000580c @ 0000580c

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_0000580c(void)

{
  short sVar1;
  short sVar2;
  
  sVar2 = (short)(((uint)_DAT_0000043c * 0x2f) / (uint)_DAT_0000042c);
  if (_LAB_00005b94 < sVar2) {
    sVar1 = sVar2 - _LAB_00005b94;
    _LAB_00005b94 = sVar2;
    while (sVar1 = sVar1 + -1, sVar1 != -1) {
      FUN_00005b3c();
    }
    return;
  }
  if (sVar2 < _LAB_00005b94) {
    sVar1 = _LAB_00005b94 - sVar2;
    _LAB_00005b94 = sVar2;
    while (sVar1 = sVar1 + -1, sVar1 != -1) {
      FUN_00005b64();
    }
    return;
  }
  return;
}


// ==== FUN_00005872 @ 00005872

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00005872(void)

{
  short sVar1;
  short sVar2;
  
  sVar2 = (short)(((uint)DAT_0000043e * 0x2f) / (uint)_DAT_0000042e);
  if (_LAB_00005b94_2 < sVar2) {
    sVar1 = sVar2 - _LAB_00005b94_2;
    _LAB_00005b94_2 = sVar2;
    while (sVar1 = sVar1 + -1, sVar1 != -1) {
      FUN_00005b3c();
    }
    return;
  }
  if (sVar2 < _LAB_00005b94_2) {
    sVar1 = _LAB_00005b94_2 - sVar2;
    _LAB_00005b94_2 = sVar2;
    while (sVar1 = sVar1 + -1, sVar1 != -1) {
      FUN_00005b64();
    }
    return;
  }
  return;
}


// ==== FUN_000058d8 @ 000058d8

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_000058d8(void)

{
  short sVar1;
  short sVar2;
  
  sVar2 = (short)(((uint)_DAT_00000440 * 0x2f) / (uint)_DAT_00000430);
  if (_LAB_00005b98 < sVar2) {
    sVar1 = sVar2 - _LAB_00005b98;
    _LAB_00005b98 = sVar2;
    while (sVar1 = sVar1 + -1, sVar1 != -1) {
      FUN_00005b3c();
    }
    return;
  }
  if (sVar2 < _LAB_00005b98) {
    sVar1 = _LAB_00005b98 - sVar2;
    _LAB_00005b98 = sVar2;
    while (sVar1 = sVar1 + -1, sVar1 != -1) {
      FUN_00005b64();
    }
    return;
  }
  return;
}


// ==== FUN_0000593e @ 0000593e

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_0000593e(void)

{
  short sVar1;
  short sVar2;
  
  sVar2 = (short)(((uint)DAT_00000442 * 0x2f) / (uint)_DAT_00000432);
  if (_LAB_00005b98_2 < sVar2) {
    sVar1 = sVar2 - _LAB_00005b98_2;
    _LAB_00005b98_2 = sVar2;
    while (sVar1 = sVar1 + -1, sVar1 != -1) {
      FUN_00005b3c();
    }
    return;
  }
  if (sVar2 < _LAB_00005b98_2) {
    sVar1 = _LAB_00005b98_2 - sVar2;
    _LAB_00005b98_2 = sVar2;
    while (sVar1 = sVar1 + -1, sVar1 != -1) {
      FUN_00005b64();
    }
    return;
  }
  return;
}


// ==== FUN_000059a4 @ 000059a4

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_000059a4(void)

{
  short sVar1;
  short sVar2;
  
  sVar2 = (short)(((uint)_DAT_00000444 * 0x2f) / (uint)_DAT_00000434);
  if (_LAB_00005b9c < sVar2) {
    sVar1 = sVar2 - _LAB_00005b9c;
    _LAB_00005b9c = sVar2;
    while (sVar1 = sVar1 + -1, sVar1 != -1) {
      FUN_00005b3c();
    }
    return;
  }
  if (sVar2 < _LAB_00005b9c) {
    sVar1 = _LAB_00005b9c - sVar2;
    _LAB_00005b9c = sVar2;
    while (sVar1 = sVar1 + -1, sVar1 != -1) {
      FUN_00005b64();
    }
    return;
  }
  return;
}


// ==== FUN_00005a0a @ 00005a0a

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00005a0a(void)

{
  short sVar1;
  short sVar2;
  
  sVar2 = (short)(((uint)DAT_00000446 * 0x2f) / (uint)_DAT_00000436);
  if (_LAB_00005b9c_2 < sVar2) {
    sVar1 = sVar2 - _LAB_00005b9c_2;
    _LAB_00005b9c_2 = sVar2;
    while (sVar1 = sVar1 + -1, sVar1 != -1) {
      FUN_00005b3c();
    }
    return;
  }
  if (sVar2 < _LAB_00005b9c_2) {
    sVar1 = _LAB_00005b9c_2 - sVar2;
    _LAB_00005b9c_2 = sVar2;
    while (sVar1 = sVar1 + -1, sVar1 != -1) {
      FUN_00005b64();
    }
    return;
  }
  return;
}


// ==== FUN_00005a70 @ 00005a70

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00005a70(void)

{
  short sVar1;
  short sVar2;
  
  sVar2 = (short)(((uint)_DAT_00000448 * 0x2f) / (uint)_DAT_00000438);
  if (_LAB_00005ba0 < sVar2) {
    sVar1 = sVar2 - _LAB_00005ba0;
    _LAB_00005ba0 = sVar2;
    while (sVar1 = sVar1 + -1, sVar1 != -1) {
      FUN_00005b3c();
    }
    return;
  }
  if (sVar2 < _LAB_00005ba0) {
    sVar1 = _LAB_00005ba0 - sVar2;
    _LAB_00005ba0 = sVar2;
    while (sVar1 = sVar1 + -1, sVar1 != -1) {
      FUN_00005b64();
    }
    return;
  }
  return;
}


// ==== FUN_00005ad6 @ 00005ad6

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00005ad6(void)

{
  short sVar1;
  short sVar2;
  
  sVar2 = (short)(((uint)PTR_DAT_0000044a._0_2_ * 0x2f) / (uint)_DAT_0000043a);
  if (_LAB_00005ba0_2 < sVar2) {
    sVar1 = sVar2 - _LAB_00005ba0_2;
    _LAB_00005ba0_2 = sVar2;
    while (sVar1 = sVar1 + -1, sVar1 != -1) {
      FUN_00005b3c();
    }
    return;
  }
  if (sVar2 < _LAB_00005ba0_2) {
    sVar1 = _LAB_00005ba0_2 - sVar2;
    _LAB_00005ba0_2 = sVar2;
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
  DAT_0000045d = DAT_0000045d | 1;
  _DAT_0000045e = 1;
  PTR_LAB_00000460 = (undefined *)0x0;
  _DAT_00000464 = 0xca4;
  _DAT_00000466 = 0x40;
  _DAT_00000468 = 0x1c2;
  return;
}


// ==== FUN_00005d28 @ 00005d28

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00005d28(void)

{
  DAT_0000045d = DAT_0000045d | 2;
  _DAT_0000046a = 1;
  _DAT_0000046c = 0x452c;
  _DAT_00000470 = 0xb96;
  _DAT_00000472 = 0x40;
  _DAT_00000474 = 300;
  return;
}


// ==== FUN_00005d5c @ 00005d5c

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00005d5c(void)

{
  DAT_0000045d = DAT_0000045d | 2;
  _DAT_0000046a = 1;
  _DAT_0000046c = 0x5c58;
  _DAT_00000470 = 0x222c;
  _DAT_00000472 = 0x40;
  _DAT_00000474 = 400;
  return;
}


// ==== FUN_00005d90 @ 00005d90

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00005d90(void)

{
  DAT_0000045d = DAT_0000045d | 2;
  _DAT_0000046a = 1;
  _DAT_0000046c = 0x1948;
  _DAT_00000470 = 0x15f2;
  _DAT_00000472 = 0x40;
  _DAT_00000474 = 500;
  return;
}


// ==== FUN_00005e48 @ 00005e48

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00005e48(void)

{
  DAT_0000045d = DAT_0000045d | 4;
  _DAT_00000476 = 1;
  _DAT_00000478 = 0x19984;
  _DAT_0000047c = 0x1960;
  _DAT_0000047e = 0x1a;
  _DAT_00000480 = 0x82;
  return;
}


// ==== FUN_000060d8 @ 000060d8

void FUN_000060d8(void)

{
  int iVar1;
  undefined4 *in_A0;
  
  iVar1 = (uint)(ushort)(DAT_000004ec - 1) * 0x10;
  *in_A0 = *(undefined4 *)(&LAB_00006826_2 + iVar1);
  in_A0[1] = *(undefined4 *)(iVar1 + 0x682c);
  in_A0[2] = *(undefined4 *)(iVar1 + 0x6830);
  in_A0[3] = *(undefined4 *)(iVar1 + 0x6834);
  DAT_000004ec = DAT_000004ec + -1;
  return;
}


// ==== FUN_00006390 @ 00006390

void FUN_00006390(void)

{
  int iVar1;
  undefined2 *in_A0;
  
  iVar1 = (uint)(ushort)(DAT_000004ee - 1) * 0x16;
  *in_A0 = *(undefined2 *)(&LAB_00008da8 + iVar1);
  *(undefined4 *)(in_A0 + 1) = *(undefined4 *)(iVar1 + 0x8daa);
  *(undefined4 *)(in_A0 + 3) = *(undefined4 *)(iVar1 + 0x8dae);
  *(undefined4 *)(in_A0 + 5) = *(undefined4 *)(FUN_00008db2 + iVar1);
  *(undefined4 *)(in_A0 + 7) = *(undefined4 *)(iVar1 + 0x8db6);
  *(undefined4 *)(in_A0 + 9) = *(undefined4 *)(iVar1 + 0x8dba);
  DAT_000004ee = DAT_000004ee + -1;
  return;
}


// ==== FUN_000065de @ 000065de

void FUN_000065de(void)

{
  int in_A0;
  
  (**(code **)((short)(ushort)*(byte *)(in_A0 + 1) * 4 + 0x65f2))();
  return;
}


// ==== FUN_000066f0 @ 000066f0

void FUN_000066f0(void)

{
  int in_A0;
  
  (*(code *)(&PTR_LAB_00006704)[(short)(ushort)*(byte *)(in_A0 + 1)])();
  return;
}


// ==== FUN_00006bce @ 00006bce

void FUN_00006bce(void)

{
  byte in_D0b;
  undefined1 in_D1b;
  undefined4 unaff_D2;
  undefined4 unaff_D3;
  int iVar1;
  
  if ((short)DAT_000004ee < 0x10) {
    iVar1 = (uint)DAT_000004ee * 0x16;
    DAT_000004ee = DAT_000004ee + 1;
    (&LAB_00008da8)[iVar1] = in_D1b;
    *(byte *)(iVar1 + 0x8da9) = in_D0b;
    *(undefined4 *)(iVar1 + 0x8daa) = unaff_D2;
    *(undefined4 *)(iVar1 + 0x8dae) = unaff_D3;
    (**(code **)(&LAB_00006c0a + (short)(ushort)in_D0b * 4))();
  }
  return;
}


// ==== FUN_00007450 @ 00007450

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00007450(void)

{
  if ((*(byte *)(_DAT_00000004 + 0x129) & 1) != 0) {
    (**(code **)(_DAT_00000004 + -0x1e))();
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
  PTR_DAT_00008596._0_2_ = 0;
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
      PTR_DAT_00008596._0_2_ = unaff_A6[10] | PTR_DAT_00008596._0_2_;
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
          uVar3 = (uint)(byte)(&DAT_00007faa)[(short)(ushort)bVar6];
          *(char *)((int)unaff_A6 + 0x23) =
               (&DAT_00007faa)[(short)(ushort)bVar6] + *(char *)((int)unaff_A6 + 0x23);
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
  _DAT_00dff096 = PTR_DAT_00008596._0_2_ | 0x8000;
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
              uVar4 = (uint)(byte)(&DAT_00007faa)[(short)(ushort)bVar6];
              *(char *)((int)unaff_A6 + 0x23) =
                   (&DAT_00007faa)[(short)(ushort)bVar6] + *(char *)((int)unaff_A6 + 0x23);
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
          uVar2 = (uint)(byte)(&DAT_00007faa)[(short)(ushort)bVar4];
          *(char *)((int)unaff_A6 + 0x23) =
               (&DAT_00007faa)[(short)(ushort)bVar4] + *(char *)((int)unaff_A6 + 0x23);
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
           (&DAT_00007faa)[(short)(ushort)bVar1] + *(char *)(unaff_A6 + 0x23),
     (*(byte *)(unaff_A6 + 0x23) & 0x80) != 0)) {
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


// ==== FUN_00008ede @ 00008ede

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00008ede(void)

{
  int iVar1;
  int in_D0;
  
  DAT_00009306 = (short)in_D0;
  DAT_00009302 = (short)((uint)in_D0 >> 0x10);
  iVar1 = DAT_00000006 + in_D0;
  DAT_0000930e = (short)iVar1;
  DAT_0000930a = (short)((uint)iVar1 >> 0x10);
  iVar1 = DAT_00000006 + iVar1;
  _DAT_00009316 = (short)iVar1;
  _DAT_00009312 = (short)((uint)iVar1 >> 0x10);
  iVar1 = DAT_00000006 + iVar1;
  _DAT_0000931e = (short)iVar1;
  _DAT_0000931a = (short)((uint)iVar1 >> 0x10);
  iVar1 = DAT_00000006 + iVar1;
  _DAT_00009326 = (short)iVar1;
  _DAT_00009322 = (short)((uint)iVar1 >> 0x10);
  _DAT_0000932e = (short)(DAT_00000006 + iVar1);
  _DAT_0000932a = (short)((uint)(DAT_00000006 + iVar1) >> 0x10);
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


// ==== FUN_000138d0 @ 000138d0

void FUN_000138d0(void)

{
  short sVar1;
  undefined4 *in_A0;
  undefined4 *puVar2;
  undefined4 *puVar3;
  
  puVar2 = (undefined4 *)0x6e20;
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
  
  puVar2 = (undefined4 *)0x7360;
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
  pcVar6 = &DAT_00003f38;
  while (unaff_D2b != *pcVar6) {
    iVar1 = iVar1 + 0xa0;
    pcVar6 = pcVar6 + 1;
  }
  puVar4 = (undefined2 *)(&DAT_00002ab8 + iVar1);
  puVar3 = (undefined2 *)((in_D1 & 0xffff) * 0xc80 + (short)(in_D0w << 1) + 0x8000);
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
  
  puVar2 = &DAT_00008000;
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
  puVar2 = &DAT_000111ba;
  sVar1 = 0x1f;
  puVar3 = &DAT_00008fe6;
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
  puVar2 = &DAT_000111ba;
  puVar4 = &DAT_000091fa;
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


