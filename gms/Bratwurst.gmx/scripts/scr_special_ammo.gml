/// scr_special_ammo()
// Kors i obj_player. Specialammo = P10 * mult[typ] / div[typ] (VERIFIERAD, kod 0x364a-0x36a2, tabell hunk 4 0x9894).
return floor(sp_base * g_wmult[sp_wtype] / g_wdiv[sp_wtype]);
