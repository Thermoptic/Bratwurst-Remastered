/// scr_mn_build()
// Bygger huvudmenyn som data (noder + barn). Att lagga till en rad = en rad har. Noderna: root = 0.
// Typer: 0 undermeny, 1 handling (g_mn_act: 1 start, 2 avsluta, 3 aterstall val), 2 av/pa, 3 tal, 4 val ur lista, 5 text.
var root, modes, opts, ctrls, quit, n, p, c, classic, pe, pt, pk;
g_mn_cnt = 0;
root = scr_mn_add(0, "MAIN", "BRATWURST - REHEATED");
modes = scr_mn_add(0, "GAME MODES", "CHOOSE A GAME MODE");
opts = scr_mn_add(0, "OPTIONS", "COLOUR THEME, SCREEN MODE AND SCREEN EFFECTS");
ctrls = scr_mn_add(0, "CONTROLS", "KEYS AND GAMEPAD BUTTONS. PLACEHOLDER MAPPING, THE ORIGINAL IS UNKNOWN. READ ONLY FOR NOW");
quit = scr_mn_add(1, "QUIT", "EXIT TO WINDOWS");
g_mn_act[quit] = 2;
scr_mn_link(root, modes); scr_mn_link(root, opts); scr_mn_link(root, ctrls); scr_mn_link(root, quit);

// GAME MODES
// Spellagen: Classic ar dagens match (START). De andra ar tomma platshallare tills de byggs.
p = scr_mn_add(0, "CLASSIC", "THE CLASSIC MATCH. LAST SHIP FLYING WINS");
scr_mn_link(modes, p);
classic = p;
n = scr_mn_add(1, "START", "OPEN THE SHIP SELECT SCREEN. SET PLAYERS AND MAP BELOW");
g_mn_act[n] = 1;
scr_mn_link(p, n);
n = scr_mn_add(3, "PLAYERS", "NUMBER OF PLAYERS, 1 TO 4. MORE CAN ALSO JOIN ON THE SHIP SELECT SCREEN");
scr_mn_setting(n, g_SV_PLAYERS, 1, 4, "gameplay.players");
scr_mn_link(classic, n);
n = scr_mn_add(4, "MAP", "THE ARENA FOR THE MATCH. MAKE YOUR OWN WITH THE MAP EDITOR");
scr_mn_setting(n, g_SV_MAP, 0, max(0, g_lv_count - 1), "gameplay.map");
g_mn_map_node = n;
scr_mn_link(classic, n);
n = scr_mn_add(3, "ROUNDS", "HOW MANY ROUNDS A MATCH HAS. THE LAST SHIP FLYING WINS A ROUND, THE MOST ROUND WINS TAKES THE MATCH");
scr_mn_setting(n, g_SV_ROUNDS, 1, 15, "gameplay.rounds");
scr_mn_link(classic, n);
n = scr_mn_add(3, "LIFE", "LIVES PER ROUND. THE ORIGINAL HAS 6 LIVES, WHICH IS THE MAXIMUM. YOU CAN LOWER IT BUT NOT RAISE IT");
scr_mn_setting(n, g_SV_LIVES, 1, g_START_LIVES, "gameplay.lives");
scr_mn_link(classic, n);
n = scr_mn_add(2, "POWERUPS", "POWERUP ORBS APPEAR ON THE MAP: THE FIRST ONE 5 SECONDS AFTER THE ROUND STARTS, THEN A NEW ONE 10 SECONDS AFTER ONE IS PICKED UP. FIRE IT WITH THE B BUTTON");
scr_mn_setting(n, g_SV_PUCL, 0, 1, "gameplay.powerups_classic");
scr_mn_link(classic, n);
p = scr_mn_add(0, "ASTRO DUEL", "ONE HIT KILLS. THREE SHOTS THEN A 4 SECOND RELOAD. BIGGER SHOTS, FAST MISSILES AND TURBO ONLY");
scr_mn_link(modes, p);
n = scr_mn_add(1, "START", "OPEN THE SHIP SELECT SCREEN FOR ASTRO DUEL. SET PLAYERS, MAP AND LIFE BELOW");
g_mn_act[n] = 5;
scr_mn_link(p, n);
n = scr_mn_add(3, "PLAYERS", "NUMBER OF PLAYERS, 1 TO 4. MORE CAN ALSO JOIN ON THE SHIP SELECT SCREEN");
scr_mn_setting(n, g_SV_PLAYERS, 1, 4, "gameplay.players");
scr_mn_link(p, n);
n = scr_mn_add(4, "MAP", "THE ARENA FOR THE MATCH. MAKE YOUR OWN WITH THE MAP EDITOR");
scr_mn_setting(n, g_SV_MAP2, 0, max(0, g_lv_count - 1), "gameplay.map_astro");
g_mn_mode[n] = 1;
g_mn_map_node2 = n;
scr_mn_link(p, n);
n = scr_mn_add(3, "ROUNDS", "HOW MANY ROUNDS A MATCH HAS. THE LAST SHIP FLYING WINS A ROUND, THE MOST ROUND WINS TAKES THE MATCH");
scr_mn_setting(n, g_SV_ROUNDS, 1, 15, "gameplay.rounds");
scr_mn_link(p, n);
n = scr_mn_add(3, "LIFE", "LIVES PER ROUND. EVERY HIT TAKES ONE LIFE, SO WITH 1 LIFE YOU DIE ON A SINGLE HIT");
scr_mn_setting(n, g_SV_ADLIVES, 1, 9, "astro.lives");
scr_mn_link(p, n);
n = scr_mn_add(2, "POWERUPS", "POWERUP ORBS APPEAR ON THE MAP: THE FIRST ONE 5 SECONDS AFTER THE ROUND STARTS, THEN A NEW ONE 10 SECONDS AFTER ONE IS PICKED UP. FIRE IT WITH THE B BUTTON");
scr_mn_setting(n, g_SV_PUAD, 0, 1, "astro.powerups");
scr_mn_link(p, n);
p = scr_mn_add(0, "ASTEROIDS", "AN EMPTY ARENA. ROCKS FLY IN FROM THE SIDES AND SPLIT WHEN SHOT: BIG, MEDIUM, SMALL. A ROCK HIT COSTS 10, 5 OR 1 ENERGY");
scr_mn_link(modes, p);
n = scr_mn_add(1, "START", "OPEN THE SHIP SELECT SCREEN FOR ASTEROIDS. SET PLAYERS, ROUNDS AND LIFE BELOW");
g_mn_act[n] = 6;
scr_mn_link(p, n);
n = scr_mn_add(3, "PLAYERS", "NUMBER OF PLAYERS, 1 TO 4. MORE CAN ALSO JOIN ON THE SHIP SELECT SCREEN");
scr_mn_setting(n, g_SV_PLAYERS, 1, 4, "gameplay.players");
scr_mn_link(p, n);
n = scr_mn_add(3, "LEVEL", "HOW HARD IT IS, 1 TO 5. EVERY LEVEL DOUBLES EVERYTHING: THE NUMBER OF ROCKS, HOW FAST THEY ARRIVE AND HOW FAST THEY MOVE. LEVEL 1 IS THE BASE");
scr_mn_setting(n, g_SV_ASLV, 1, 5, "asteroids.level");
scr_mn_link(p, n);
n = scr_mn_add(3, "ROUNDS", "HOW MANY ROUNDS A MATCH HAS. THE LAST SHIP FLYING WINS A ROUND, THE MOST ROUND WINS TAKES THE MATCH");
scr_mn_setting(n, g_SV_ROUNDS, 1, 15, "gameplay.rounds");
scr_mn_link(p, n);
n = scr_mn_add(3, "LIFE", "LIVES PER ROUND. THE SAME SETTING AS IN CLASSIC");
scr_mn_setting(n, g_SV_LIVES, 1, g_START_LIVES, "gameplay.lives");
scr_mn_link(p, n);
n = scr_mn_add(2, "POWERUPS", "POWERUP ORBS APPEAR ON THE MAP: THE FIRST ONE 5 SECONDS AFTER THE ROUND STARTS, THEN A NEW ONE 10 SECONDS AFTER ONE IS PICKED UP. FIRE IT WITH THE B BUTTON");
scr_mn_setting(n, g_SV_PUAS, 0, 1, "asteroids.powerups");
scr_mn_link(p, n);
p = scr_mn_add(0, "RACE", "NOT BUILT YET");
scr_mn_link(modes, p);
n = scr_mn_add(5, "STATUS", "THIS GAME MODE IS NOT BUILT YET"); g_mn_text[n] = "COMING SOON";
scr_mn_link(p, n);
p = scr_mn_add(0, "CAPTURE THE BRATWURST", "NOT BUILT YET");
scr_mn_link(modes, p);
n = scr_mn_add(5, "STATUS", "THIS GAME MODE IS NOT BUILT YET"); g_mn_text[n] = "COMING SOON";
scr_mn_link(p, n);
// OPTIONS
n = scr_mn_add(4, "THEME", "BASE16 COLOUR THEME FOR THE WHOLE GAME. THE COLOURS ARE READ FROM THEMES.INI");
scr_mn_setting(n, g_SV_THEME, 0, g_th_count - 1, "theme.name");
scr_mn_link(opts, n);
n = scr_mn_add(4, "ACCENT", "WHICH OF THE 16 COLOURS IS THE MAIN HIGHLIGHT");
scr_mn_setting(n, g_SV_ACCENT, 0, 6, "theme.accent");
scr_mn_link(opts, n);
n = scr_mn_add(4, "SCREEN MODE", "WINDOW SIZE OR FULLSCREEN");
scr_mn_setting(n, g_SV_SCALE, 0, 3, "display.scale");
scr_mn_link(opts, n);
n = scr_mn_add(3, "ZOOM", "HOW FAR THE CAMERA ZOOMS OUT, 1 TO 10. 1 IS THE NORMAL ZOOM, EACH STEP SHOWS MORE OF THE ARENA AND 10 SHOWS TWICE AS MUCH");
scr_mn_setting(n, g_SV_ZOOM, 1, 10, "display.zoom");
scr_mn_link(opts, n);
n = scr_mn_add(2, "SOLID COLORS", "FILL ALL SOLID WALLS AND SHIPS WITH THEIR COLOUR. OFF = OUTLINES ONLY, LIKE THE ORIGINAL");
scr_mn_setting(n, g_SV_SOLID, 0, 1, "display.solid_colors");
scr_mn_link(opts, n);
n = scr_mn_add(3, "VOLUME", "MUSIC VOLUME, 10 PERCENT TO 100 PERCENT. DEFAULT 70 PERCENT. 0 PERCENT (OFF) TURNS THE MUSIC OFF. A RANDOM SONG STARTS EVERY ROUND. LB / RB CHANGES SONG IN THE MENUS");
scr_mn_setting(n, g_SV_VOL, 0, 10, "audio.volume");
scr_mn_link(opts, n);
n = scr_mn_add(2, "SOUND EFFECTS", "SHOTS, EXPLOSIONS AND CRASHES: THE SOUNDS FROM THE ORIGINAL GAME");
scr_mn_setting(n, g_SV_SFX, 0, 1, "audio.sfx");
scr_mn_link(opts, n);
n = scr_mn_add(2, "VSYNC", "SYNC WITH THE MONITOR TO AVOID TEARING");
scr_mn_setting(n, g_SV_VSYNC, 0, 1, "display.vsync");
scr_mn_link(opts, n);
n = scr_mn_add(2, "SCANLINES AND GLOW", "OLD CRT LINES OVER THE WHOLE PICTURE AND A SOFT GLOW AROUND TEXT");
scr_mn_setting(n, g_SV_SCAN, 0, 1, "display.scanlines");
scr_mn_link(opts, n);
n = scr_mn_add(1, "MAP EDITOR", "DRAW SOLID WALLS AND BOXES WITH THE MOUSE, PLACE START POSITIONS AND SAVE YOUR OWN MAPS");
g_mn_act[n] = 4;
scr_mn_link(opts, n);
n = scr_mn_add(5, "DATA FOLDER", "WHERE SETTINGS.INI AND THEMES.INI ARE SAVED");
g_mn_text[n] = game_save_id;
scr_mn_link(opts, n);
n = scr_mn_add(1, "RESET OPTIONS", "SET ALL OPTIONS BACK TO THE DEFAULTS");
g_mn_act[n] = 3;
scr_mn_link(opts, n);

// CONTROLS (endast visning; PLACEHOLDER-mappning, se gms/README.md)
p = scr_mn_add(0, "PLAYER 1", "KEYBOARD. PLACEHOLDER MAPPING"); scr_mn_link(ctrls, p);
c = scr_mn_add(5, "TURN", "TURN LEFT AND RIGHT"); g_mn_text[c] = "LEFT / RIGHT"; scr_mn_link(p, c);
c = scr_mn_add(5, "CANNON", "FIRE THE CANNON"); g_mn_text[c] = "UP"; scr_mn_link(p, c);
c = scr_mn_add(5, "SPECIAL", "FIRE THE SPECIAL WEAPON"); g_mn_text[c] = "DOWN"; scr_mn_link(p, c);
c = scr_mn_add(5, "THRUST", "ENGINE THRUST"); g_mn_text[c] = "SPACE / R-CTRL"; scr_mn_link(p, c);
p = scr_mn_add(0, "PLAYER 2", "KEYBOARD. PLACEHOLDER MAPPING"); scr_mn_link(ctrls, p);
c = scr_mn_add(5, "TURN", "TURN LEFT AND RIGHT"); g_mn_text[c] = "A / D"; scr_mn_link(p, c);
c = scr_mn_add(5, "CANNON", "FIRE THE CANNON"); g_mn_text[c] = "W"; scr_mn_link(p, c);
c = scr_mn_add(5, "SPECIAL", "FIRE THE SPECIAL WEAPON"); g_mn_text[c] = "S"; scr_mn_link(p, c);
c = scr_mn_add(5, "THRUST", "ENGINE THRUST"); g_mn_text[c] = "L-SHIFT"; scr_mn_link(p, c);
p = scr_mn_add(0, "PLAYER 3", "KEYBOARD OR GAMEPAD 3. PLACEHOLDER MAPPING"); scr_mn_link(ctrls, p);
c = scr_mn_add(5, "TURN", "TURN LEFT AND RIGHT"); g_mn_text[c] = "J / L"; scr_mn_link(p, c);
c = scr_mn_add(5, "CANNON", "FIRE THE CANNON"); g_mn_text[c] = "I"; scr_mn_link(p, c);
c = scr_mn_add(5, "SPECIAL", "FIRE THE SPECIAL WEAPON"); g_mn_text[c] = "K"; scr_mn_link(p, c);
c = scr_mn_add(5, "THRUST", "ENGINE THRUST"); g_mn_text[c] = "O"; scr_mn_link(p, c);
p = scr_mn_add(0, "PLAYER 4", "GAMEPAD 4 ONLY. THE ORIGINAL USED A FOUR PLAYER ADAPTER"); scr_mn_link(ctrls, p);
c = scr_mn_add(5, "INPUT", "NO KEYBOARD KEYS FOR PLAYER 4"); g_mn_text[c] = "GAMEPAD 4"; scr_mn_link(p, c);
p = scr_mn_add(0, "GAMEPAD", "XBOX CONTROLLER. CONTROLLER 1 = PLAYER 1 AND SO ON"); scr_mn_link(ctrls, p);
c = scr_mn_add(5, "TURN", "LEFT STICK OR D-PAD"); g_mn_text[c] = "STICK / D-PAD"; scr_mn_link(p, c);
c = scr_mn_add(5, "CANNON", "FIRE THE CANNON"); g_mn_text[c] = "A"; scr_mn_link(p, c);
c = scr_mn_add(5, "SPECIAL", "FIRE THE SPECIAL WEAPON"); g_mn_text[c] = "Y"; scr_mn_link(p, c);
c = scr_mn_add(5, "THRUST", "ENGINE THRUST"); g_mn_text[c] = "X / RT"; scr_mn_link(p, c);
c = scr_mn_add(5, "POWERUP", "FIRE THE POWERUP YOU HAVE PICKED UP. RAILGUN: HOLD TO CHARGE, LET GO TO FIRE"); g_mn_text[c] = "B"; scr_mn_link(p, c);
c = scr_mn_add(5, "NEXT SPECIAL", "SWITCH TO THE NEXT SPECIAL WEAPON DURING A MATCH"); g_mn_text[c] = "BACK"; scr_mn_link(p, c);
c = scr_mn_add(5, "WEAPON POD", "SWITCH THE POD THE SPECIAL WEAPON FIRES FROM"); g_mn_text[c] = "LB"; scr_mn_link(p, c);
c = scr_mn_add(5, "DRIFT", "HOLD WHILE YOU THRUST TO SLIDE SIDEWAYS"); g_mn_text[c] = "LT + THRUST"; scr_mn_link(p, c);
c = scr_mn_add(5, "REVERSE", "HOLD ALONE (NO THRUST) TO BACK UP SLOWLY"); g_mn_text[c] = "LT"; scr_mn_link(p, c);
c = scr_mn_add(5, "PAUSE", "PAUSE MENU DURING A MATCH"); g_mn_text[c] = "START"; scr_mn_link(p, c);

// POWERUP EDITOR (hemlig: visas i Options nar man trycker P dar, se scr_mn_step). En undermeny per powerup med dess parametrar ur scr_data_powerups.
g_mn_opts_node = opts;
g_mn_pu_linked = false;
pe = scr_mn_add(0, "POWERUP EDITOR", "SECRET MENU. SET UP EVERY POWERUP: SIZE, SPEED, SHOCKWAVE, PARTICLES AND DAMAGE");
g_mn_pu_node = pe;
for (pt = 0; pt < g_PU_COUNT; pt += 1)
{
    p = scr_mn_add(0, g_pu_name[pt], "PARAMETERS FOR THIS POWERUP. LEFT / RIGHT CHANGES THE VALUE");
    scr_mn_link(pe, p);
    for (pk = 0; pk < g_pu_np[pt]; pk += 1)
    {
        n = scr_mn_add(3, g_pu_pname[pt, pk], g_pu_pdesc[pt, pk]);
        scr_mn_setting(n, g_SV_PU + pt * g_PU_STRIDE + pk, g_pu_pmin[pt, pk], g_pu_pmax[pt, pk], "powerup_" + g_pu_key[pt] + "." + g_pu_pkey[pt, pk]);
        g_mn_step[n] = g_pu_pstep[pt, pk];
        scr_mn_link(p, n);
    }
}

g_mn_depth = 0;
g_mn_stk_node[0] = root;
g_mn_stk_sel[0] = 0;
