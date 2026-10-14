/// scr_ast_mult()
// Asteroids: nivafaktorn 2 ^ (niva - 1) (niva 1 = 1, 2 = 2, 3 = 4, 4 = 8, 5 = 16; Options/Game modes -> Asteroids -> LEVEL). Antal stenar, hur snabbt de kommer
// (vagtider och strommen) och deras fart multipliceras med den (farten hogst 8 ganger, annars hinner stenarna flyga genom skepp och skott mellan tva ticks).
return power(2, g_sv[g_SV_ASLV] - 1);
