/// scr_data_powerups()
// Powerup-definitioner (D-035). Varje powerup har namn, en pixelikon (11 tecken per rad, # = pixel) och upp till 8 parametrar som kan stallas in i den
// hemliga Powerup Editor (Options, tryck P). g_pu_np[t] = antal parametrar, g_pu_pname/pdesc/pkey[t, k] = namn, beskrivning och ini-nyckel,
// g_pu_pmin/pmax/pstep/pdef[t, k] = intervall, steg och standardvarde. Installningarna ligger i g_sv[g_SV_PU + t * 8 + k] (settings.ini, [powerup_<namn>]).
// Nya powerups: lagg till en post har, ett fall i scr_powerup_fire och eventuell effektkod; menyn och sparandet byggs av datan.
g_PU_COUNT = 1;
// ---- 0: MINI NUKE (beter sig som en missil med stor chockvag) ----
g_pu_name[0] = "MINI NUKE";
g_pu_key[0] = "mininuke";
g_pu_icon[0, 0] = ".....#.....";
g_pu_icon[0, 1] = "....###....";
g_pu_icon[0, 2] = "....###....";
g_pu_icon[0, 3] = "....#.#....";
g_pu_icon[0, 4] = "....###....";
g_pu_icon[0, 5] = "....###....";
g_pu_icon[0, 6] = "..#.###.#..";
g_pu_icon[0, 7] = "..#######..";
g_pu_icon[0, 8] = ".##.###.##.";
g_pu_icon[0, 9] = "....#.#....";
g_pu_icon[0, 10] = ".....#.....";
g_pu_np[0] = 7;
g_pu_pname[0, 0] = "PROJECTILE SIZE"; g_pu_pdesc[0, 0] = "SIZE OF THE MINI NUKE PROJECTILE IN MAP PIXELS. A BIGGER ONE IS EASIER TO HIT WITH"; g_pu_pkey[0, 0] = "size";
g_pu_pmin[0, 0] = 1; g_pu_pmax[0, 0] = 20; g_pu_pstep[0, 0] = 1; g_pu_pdef[0, 0] = 4;
g_pu_pname[0, 1] = "SPEED"; g_pu_pdesc[0, 1] = "SPEED OF THE PROJECTILE. A NORMAL MISSILE IS 32"; g_pu_pkey[0, 1] = "speed";
g_pu_pmin[0, 1] = 8; g_pu_pmax[0, 1] = 96; g_pu_pstep[0, 1] = 4; g_pu_pdef[0, 1] = 28;
g_pu_pname[0, 2] = "SHOCKWAVE RADIUS"; g_pu_pdesc[0, 2] = "HOW FAR THE SHOCKWAVE REACHES, IN MAP PIXELS"; g_pu_pkey[0, 2] = "shock_radius";
g_pu_pmin[0, 2] = 40; g_pu_pmax[0, 2] = 800; g_pu_pstep[0, 2] = 20; g_pu_pdef[0, 2] = 220;
g_pu_pname[0, 3] = "PARTICLES"; g_pu_pdesc[0, 3] = "HOW MANY PIXEL PARTICLES FLY OUT OF THE EXPLOSION"; g_pu_pkey[0, 3] = "particles";
g_pu_pmin[0, 3] = 0; g_pu_pmax[0, 3] = 400; g_pu_pstep[0, 3] = 10; g_pu_pdef[0, 3] = 160;
g_pu_pname[0, 4] = "DIRECT DAMAGE"; g_pu_pdesc[0, 4] = "DAMAGE TO A SHIP THE PROJECTILE HITS DIRECTLY (IN ASTRO DUEL ANY HIT KILLS)"; g_pu_pkey[0, 4] = "direct_damage";
g_pu_pmin[0, 4] = 0; g_pu_pmax[0, 4] = 100; g_pu_pstep[0, 4] = 1; g_pu_pdef[0, 4] = 30;
g_pu_pname[0, 5] = "SHOCKWAVE DAMAGE"; g_pu_pdesc[0, 5] = "DAMAGE TO EVERY SHIP THE SHOCKWAVE REACHES (IN ASTRO DUEL IT KILLS)"; g_pu_pkey[0, 5] = "shock_damage";
g_pu_pmin[0, 5] = 0; g_pu_pmax[0, 5] = 100; g_pu_pstep[0, 5] = 1; g_pu_pdef[0, 5] = 15;
g_pu_pname[0, 6] = "CAMERA SHAKE"; g_pu_pdesc[0, 6] = "HOW HARD THE PICTURE SHAKES WHEN THE MINI NUKE EXPLODES, IN PIXELS. 0 = NO SHAKE"; g_pu_pkey[0, 6] = "camera_shake";
g_pu_pmin[0, 6] = 0; g_pu_pmax[0, 6] = 60; g_pu_pstep[0, 6] = 1; g_pu_pdef[0, 6] = 12;
