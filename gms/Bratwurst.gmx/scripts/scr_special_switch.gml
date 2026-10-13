/// scr_special_switch()
// Kors i obj_player. Vaxlar specialvapen under matchen till nasta tillgangliga (inklusive NOTHING), som skeppsvalets bladdring (scr_weapon_cycle).
// Varje vapen har sin egen ammo (sp_pool[typ]) sa att man inte far ny ammo genom att vaxla; nedrakningen (sp_cool) behalls.
sp_pool[sp_wtype] = sp_ammo;
sp_wtype = scr_weapon_cycle(ship, sp_wtype, 1);
sp_ammo = sp_pool[sp_wtype];
