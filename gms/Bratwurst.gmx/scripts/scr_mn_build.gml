/// scr_mn_build()
// Bygger huvudmenyn som data (noder + barn). Att lagga till en rad = en rad har. Noderna: root = 0.
// Typer: 0 undermeny, 1 handling (g_mn_act: 1 start, 2 avsluta, 3 aterstall val), 2 av/pa, 3 tal, 4 val ur lista, 5 text.
var root, modes, opts, ctrls, quit, n, p, c;
g_mn_cnt = 0;
root = scr_mn_add(0, "MAIN", "BRATWURST - REHEATED");
modes = scr_mn_add(0, "GAME MODES", "START A MATCH AND CHOOSE HOW MANY PLAYERS");
opts = scr_mn_add(0, "OPTIONS", "COLOUR THEME, WINDOW AND SCREEN EFFECTS");
ctrls = scr_mn_add(0, "CONTROLS", "KEYS AND GAMEPAD BUTTONS. PLACEHOLDER MAPPING, THE ORIGINAL IS UNKNOWN. READ ONLY FOR NOW");
quit = scr_mn_add(1, "QUIT", "EXIT TO WINDOWS");
g_mn_act[quit] = 2;
scr_mn_link(root, modes); scr_mn_link(root, opts); scr_mn_link(root, ctrls); scr_mn_link(root, quit);

// GAME MODES
n = scr_mn_add(1, "START", "OPEN THE SHIP SELECT SCREEN WITH THE CHOSEN NUMBER OF PLAYERS");
g_mn_act[n] = 1;
scr_mn_link(modes, n);
n = scr_mn_add(3, "PLAYERS", "NUMBER OF PLAYERS, 1 TO 4. MORE CAN ALSO JOIN ON THE SHIP SELECT SCREEN");
scr_mn_setting(n, g_SV_PLAYERS, 1, 4, "gameplay.players");
scr_mn_link(modes, n);

// OPTIONS
n = scr_mn_add(4, "THEME", "BASE16 COLOUR THEME FOR THE WHOLE GAME. THE COLOURS ARE READ FROM THEMES.INI");
scr_mn_setting(n, g_SV_THEME, 0, g_th_count - 1, "theme.name");
scr_mn_link(opts, n);
n = scr_mn_add(4, "ACCENT", "WHICH OF THE 16 COLOURS IS THE MAIN HIGHLIGHT");
scr_mn_setting(n, g_SV_ACCENT, 0, 6, "theme.accent");
scr_mn_link(opts, n);
n = scr_mn_add(4, "WINDOW", "SIZE OF THE GAME WINDOW");
scr_mn_setting(n, g_SV_SCALE, 0, 3, "display.scale");
scr_mn_link(opts, n);
n = scr_mn_add(2, "VSYNC", "SYNC WITH THE MONITOR TO AVOID TEARING");
scr_mn_setting(n, g_SV_VSYNC, 0, 1, "display.vsync");
scr_mn_link(opts, n);
n = scr_mn_add(2, "SCANLINES", "OLD CRT LINES OVER THE WHOLE PICTURE");
scr_mn_setting(n, g_SV_SCAN, 0, 1, "display.scanlines");
scr_mn_link(opts, n);
n = scr_mn_add(2, "PHOSPHOR GLOW", "SOFT GLOW AROUND TEXT");
scr_mn_setting(n, g_SV_GLOW, 0, 1, "display.glow");
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
c = scr_mn_add(5, "SPECIAL", "FIRE THE SPECIAL WEAPON"); g_mn_text[c] = "B"; scr_mn_link(p, c);
c = scr_mn_add(5, "THRUST", "ENGINE THRUST"); g_mn_text[c] = "X / RT"; scr_mn_link(p, c);
c = scr_mn_add(5, "SHIP SELECT", "BACK TO SHIP SELECT DURING A MATCH"); g_mn_text[c] = "START"; scr_mn_link(p, c);
c = scr_mn_add(5, "PLAYERS", "CYCLE 1 TO 4 PLAYERS"); g_mn_text[c] = "BACK"; scr_mn_link(p, c);

g_mn_depth = 0;
g_mn_stk_node[0] = root;
g_mn_stk_sel[0] = 0;
