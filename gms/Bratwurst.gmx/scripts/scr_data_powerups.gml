/// scr_data_powerups()
// Powerup-definitioner (D-035). Varje powerup har namn, en pixelikon (11 tecken per rad, # = pixel) och upp till 8 parametrar som kan stallas in i den
// hemliga Powerup Editor (Options, tryck P). g_pu_np[t] = antal parametrar, g_pu_pname/pdesc/pkey[t, k] = namn, beskrivning och ini-nyckel,
// g_pu_pmin/pmax/pstep/pdef[t, k] = intervall, steg och standardvarde. Installningarna ligger i g_sv[g_SV_PU + t * g_PU_STRIDE + k] (g_PU_STRIDE = 12 parametrar per powerup) (settings.ini, [powerup_<namn>]).
// Nya powerups: lagg till en post har, ett fall i scr_powerup_fire och eventuell effektkod; menyn och sparandet byggs av datan.
g_PU_COUNT = 3;   // poster i editorn och installningarna
g_PU_SPAWN = 2;   // bara de forsta (riktiga powerups) kan dyka upp som orbs; post 2 (DRIFT) ar bara en sida i Powerup Editor
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
// ---- 1: RAILGUN (halls inne for att ladda, slapp for att avfyra en stral genom hela banan) ----
g_pu_name[1] = "RAILGUN";
g_pu_key[1] = "railgun";
g_pu_icon[1, 0] = ".....#.....";
g_pu_icon[1, 1] = "....###....";
g_pu_icon[1, 2] = "....###....";
g_pu_icon[1, 3] = "#...###...#";
g_pu_icon[1, 4] = "#...###...#";
g_pu_icon[1, 5] = "#..#####..#";
g_pu_icon[1, 6] = "#...###...#";
g_pu_icon[1, 7] = "#...###...#";
g_pu_icon[1, 8] = "....###....";
g_pu_icon[1, 9] = ".....#.....";
g_pu_icon[1, 10] = ".....#.....";
g_pu_np[1] = 8;
g_pu_pname[1, 0] = "CHARGE TIME"; g_pu_pdesc[1, 0] = "SECONDS YOU HAVE TO HOLD THE POWERUP BUTTON TO CHARGE THE RAILGUN. LET GO EARLIER AND IT IS CANCELLED"; g_pu_pkey[1, 0] = "charge_time";
g_pu_pmin[1, 0] = 1; g_pu_pmax[1, 0] = 10; g_pu_pstep[1, 0] = 1; g_pu_pdef[1, 0] = 4;
g_pu_pname[1, 1] = "BEAM SPEED"; g_pu_pdesc[1, 1] = "TIME THE BEAM TAKES TO TRAVEL ACROSS THE WHOLE MAP, IN TENTHS OF A SECOND (5 = HALF A SECOND)"; g_pu_pkey[1, 1] = "sweep_time";
g_pu_pmin[1, 1] = 1; g_pu_pmax[1, 1] = 30; g_pu_pstep[1, 1] = 1; g_pu_pdef[1, 1] = 5;
g_pu_pname[1, 2] = "BEAM HOLD TIME"; g_pu_pdesc[1, 2] = "HOW LONG THE BEAM STAYS ON SCREEN BEFORE IT FADES, IN TENTHS OF A SECOND (20 = 2 SECONDS)"; g_pu_pkey[1, 2] = "hold_time";
g_pu_pmin[1, 2] = 0; g_pu_pmax[1, 2] = 100; g_pu_pstep[1, 2] = 5; g_pu_pdef[1, 2] = 20;
g_pu_pname[1, 3] = "BEAM FADE TIME"; g_pu_pdesc[1, 3] = "HOW LONG THE BEAM TAKES TO FADE AWAY, IN TENTHS OF A SECOND (10 = 1 SECOND)"; g_pu_pkey[1, 3] = "fade_time";
g_pu_pmin[1, 3] = 1; g_pu_pmax[1, 3] = 50; g_pu_pstep[1, 3] = 1; g_pu_pdef[1, 3] = 10;
g_pu_pname[1, 4] = "BEAM WIDTH"; g_pu_pdesc[1, 4] = "THICKNESS OF THE BEAM IN MAP PIXELS. A THICKER BEAM IS EASIER TO HIT WITH AND LOOKS BIGGER"; g_pu_pkey[1, 4] = "beam_width";
g_pu_pmin[1, 4] = 1; g_pu_pmax[1, 4] = 40; g_pu_pstep[1, 4] = 1; g_pu_pdef[1, 4] = 6;
g_pu_pname[1, 5] = "DAMAGE"; g_pu_pdesc[1, 5] = "DAMAGE TO A SHIP THE BEAM HITS. 100 KILLS ANY SHIP AT ONCE (IN ASTRO DUEL ANY HIT KILLS)"; g_pu_pkey[1, 5] = "damage";
g_pu_pmin[1, 5] = 0; g_pu_pmax[1, 5] = 100; g_pu_pstep[1, 5] = 1; g_pu_pdef[1, 5] = 100;
g_pu_pname[1, 6] = "CAMERA SHAKE"; g_pu_pdesc[1, 6] = "HOW HARD THE PICTURE SHAKES WHEN THE RAILGUN FIRES, IN PIXELS. 0 = NO SHAKE"; g_pu_pkey[1, 6] = "camera_shake";
g_pu_pmin[1, 6] = 0; g_pu_pmax[1, 6] = 60; g_pu_pstep[1, 6] = 1; g_pu_pdef[1, 6] = 8;
g_pu_pname[1, 7] = "CHARGE BALL SIZE"; g_pu_pdesc[1, 7] = "SIZE OF THE GLOWING BALL IN FRONT OF THE SHIP WHEN FULLY CHARGED, IN MAP PIXELS"; g_pu_pkey[1, 7] = "ball_size";
g_pu_pmin[1, 7] = 4; g_pu_pmax[1, 7] = 50; g_pu_pstep[1, 7] = 2; g_pu_pdef[1, 7] = 18;
// ---- 2: DRIFT (ingen powerup: inte spawnbar, bara en sida i Powerup Editor for drift och reverse, D-030) ----
g_pu_name[2] = "DRIFT";
g_pu_key[2] = "drift";
g_pu_np[2] = 9;
g_pu_pname[2, 0] = "MIN SPEED"; g_pu_pdesc[2, 0] = "SPEED YOU NEED TO START DRIFTING (THRUST + LEFT TRIGGER). BELOW IT NOTHING HAPPENS"; g_pu_pkey[2, 0] = "min_speed";
g_pu_pmin[2, 0] = 0; g_pu_pmax[2, 0] = 3000; g_pu_pstep[2, 0] = 50; g_pu_pdef[2, 0] = 500;
g_pu_pname[2, 1] = "TURN BOOST"; g_pu_pdesc[2, 1] = "HOW MUCH FASTER THE SHIP TURNS WHILE DRIFTING, IN PERCENT (150 = 1.5 TIMES)"; g_pu_pkey[2, 1] = "turn_boost";
g_pu_pmin[2, 1] = 100; g_pu_pmax[2, 1] = 400; g_pu_pstep[2, 1] = 10; g_pu_pdef[2, 1] = 150;
g_pu_pname[2, 2] = "SLIDE ANGLE"; g_pu_pdesc[2, 2] = "HOW FAR OUT FROM THE TURN THE THRUST IS PUSHED, IN STEPS OF 1/256 TURN (34 = ABOUT 48 DEGREES). MORE = SLIDES MORE SIDEWAYS"; g_pu_pkey[2, 2] = "slide_angle";
g_pu_pmin[2, 2] = 0; g_pu_pmax[2, 2] = 64; g_pu_pstep[2, 2] = 1; g_pu_pdef[2, 2] = 34;
g_pu_pname[2, 3] = "DRIFT THRUST"; g_pu_pdesc[2, 3] = "STRENGTH OF THE THRUST WHILE DRIFTING COMPARED WITH NORMAL THRUST, IN PERCENT"; g_pu_pkey[2, 3] = "drift_thrust";
g_pu_pmin[2, 3] = 25; g_pu_pmax[2, 3] = 300; g_pu_pstep[2, 3] = 5; g_pu_pdef[2, 3] = 117;
g_pu_pname[2, 4] = "REVERSE THRUST"; g_pu_pdesc[2, 4] = "STRENGTH WHEN BACKING UP (LEFT TRIGGER ALONE, NO THRUST) COMPARED WITH NORMAL THRUST, IN PERCENT"; g_pu_pkey[2, 4] = "reverse_thrust";
g_pu_pmin[2, 4] = 0; g_pu_pmax[2, 4] = 100; g_pu_pstep[2, 4] = 5; g_pu_pdef[2, 4] = 25;
g_pu_pname[2, 5] = "TRAIL LENGTH"; g_pu_pdesc[2, 5] = "HOW LONG THE LIGHT TRAILS BEHIND THE SHIP ARE, IN POINTS (ONE PER TICK, SO IT ALSO DEPENDS ON SPEED)"; g_pu_pkey[2, 5] = "trail_length";
g_pu_pmin[2, 5] = 4; g_pu_pmax[2, 5] = 120; g_pu_pstep[2, 5] = 4; g_pu_pdef[2, 5] = 40;
g_pu_pname[2, 6] = "ENGINE SOUND"; g_pu_pdesc[2, 6] = "VOLUME OF THE DRIFT ENGINE SOUND, IN PERCENT. 0 = SILENT"; g_pu_pkey[2, 6] = "sound_volume";
g_pu_pmin[2, 6] = 0; g_pu_pmax[2, 6] = 100; g_pu_pstep[2, 6] = 5; g_pu_pdef[2, 6] = 45;
g_pu_pname[2, 7] = "TRAIL WIDTH"; g_pu_pdesc[2, 7] = "THICKNESS OF THE LIGHT TRAILS, IN PERCENT OF THE NORMAL WIDTH"; g_pu_pkey[2, 7] = "trail_width";
g_pu_pmin[2, 7] = 20; g_pu_pmax[2, 7] = 300; g_pu_pstep[2, 7] = 10; g_pu_pdef[2, 7] = 100;
g_pu_pname[2, 8] = "SIDE THRUSTER"; g_pu_pdesc[2, 8] = "SIDEWAYS PUSH WHILE DRIFTING: A THRUSTER PUSHES THE SHIP OUT OF THE CURVE (TURN RIGHT = PUSH LEFT, TURN LEFT = PUSH RIGHT), IN PERCENT OF NORMAL THRUST. ONLY WHILE THRUSTING AND TURNING"; g_pu_pkey[2, 8] = "side_thruster";
g_pu_pmin[2, 8] = 0; g_pu_pmax[2, 8] = 400; g_pu_pstep[2, 8] = 5; g_pu_pdef[2, 8] = 60;
