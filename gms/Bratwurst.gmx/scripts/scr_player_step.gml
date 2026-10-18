/// scr_player_step()
// Kors i obj_player, en tick. Foljer originalets spelarrutin (hunk0 0x16a4-0x18d8, docs/15 steg 3):
//   1) svang med accelererande vinkelhastighet  2) pod-positioner  3) kanon  4) thrust  5) gravitation+motstand+integration
//   6) vaggkrasch  7) dod/respawn.  Specialvapen (bit3) ar INTE implementerat i Fas 1.
var a, p, fired_all, sh, shx, shy, tw, ta, tm, thr, spd, vcap, f, slowf, ra;
if (!alive)
{
    scr_trail_update();   // driftsparet tonar ut aven nar skeppet ar borta
    scr_drift_sound();
    // nedrakning till aterskapning (D: 3 sekunder efter att ett liv forlorats)
    if (respawn_t > 0)
    {
        respawn_t -= 1;
        if (respawn_t == 0) { alive = true; scr_player_respawn(); }
    }
    exit;
}
scr_player_input();
if (g_game_mode == 2 && g_race_cd > 0)
{
    // Race: under startnedrakningen kan man inte gasa (och inte backa) (D-060)
    in_thrust = false; in_drift = false;
}
if (g_game_mode == 2 && race_fin)
{
    // Race: ett skepp som kommit i mal skjuter inte och anvander inga vapen (D-058)
    in_fire = false; in_special = false; in_powerup = false; in_pu_hold = false;
}
if (ad_inv > 0) { ad_inv -= 1; }
if (race_slow > 0) { race_slow -= 1; }
if (race_msg_t > 0) { race_msg_t -= 1; }   // Race: fartminskning efter vapentraff (D-055)
if (g_game_mode == 1 && ad_dmg > 0)
{
    // Galaxy Duel (D-051): skadat skepp, 6 s. Bara gas och svang; inga vapen (kanon, specialvapen, powerup). Skadan repareras sjalv.
    ad_dmg -= 1;
    if (ad_dmg <= 0) { ad_dmg = 0; ad_inv = 0; energy = energy_max; }   // reparerad: som nytt, en ny traff skadar igen
    in_fire = false; in_special = false; in_powerup = false; in_pu_hold = false;
    scr_ad_fx(false);
}
if (in_shipcyc && g_game_mode != 2) { scr_player_change_ship(1); }   // test: byt skepp under matchen
if ((in_podcyc || in_psel) && sp_nsel > 0) { sp_pod_i = (sp_pod_i + 1) mod sp_nsel; }   // byt specialpod (position pa skeppet) under matchen
if (in_wsel && g_game_mode != 2) { scr_special_switch(); }   // byt specialvapen under matchen

if (boost_timer > 0) { boost_timer -= 1; }
prev_px = px; prev_py = py; prev_ang = ang;
// DRIFT (D-030, test): bara medan man gasar och halller in drift-knappen och ror sig (inte stillastaende)
reversing = (in_drift && !in_thrust);   // REVERSE (D-030): bara drift-knappen utan gas = backa langsamt
drifting = (in_drift && in_thrust && !drift_rc && drift_fuel > 0 && (vx * vx + vy * vy) >= g_DRIFT_MINSPEED * g_DRIFT_MINSPEED);
// DRIFTING FUEL (D-052): bara medan man driftar gar drivmedel at (1 tick per tick), resten sparas. Tom matare: laddas pa g_DRIFT_RECHARGE ticks (6 s), drift avstangd tills den ar full.
if (drift_fuel > g_DRIFT_FUEL) { drift_fuel = g_DRIFT_FUEL; }
if (drifting)
{
    drift_fuel -= 1;
    if (drift_fuel <= 0) { drift_fuel = 0; if (g_game_mode != 2) { drift_rc = true; } }   // Race: ingen automatisk laddning (D-055)
}
else if (drift_rc)
{
    drift_fuel += g_DRIFT_FUEL / g_DRIFT_RECHARGE;
    if (drift_fuel >= g_DRIFT_FUEL) { drift_fuel = g_DRIFT_FUEL; drift_rc = false; }
}

// 1) Svang: vinkel -/+= w; w += TURN_ACC; utan svang w = TURN_INIT; w <= TURN_MAX (VERIFIERAD, kod 0x16a4-0x1718)
var turned;
turned = false;
tw = turn_w;
if (drifting) { tw = floor(turn_w * g_DRIFT_TURN); }   // drift: snabbare vridning
if (in_left)  { turned = true; ang -= tw; turn_w += turn_acc; }
if (in_right) { turned = true; ang += tw; turn_w += turn_acc; }
if (spin_v != 0)
{
    // vridning efter skeppskrock (D-028): vinkelhastigheten dar ut
    spin_f += spin_v;
    if (spin_f >= 1) { ang += floor(spin_f); spin_f -= floor(spin_f); }
    if (spin_f <= -1) { ang -= floor(-spin_f); spin_f += floor(-spin_f); }
    spin_v *= 0.9;
    if (abs(spin_v) < 0.03) { spin_v = 0; spin_f = 0; }
}
ang = ((ang mod 256) + 256) mod 256;
if (!turned) { turn_w = turn_init; }
if (turn_w > turn_max) { turn_w = turn_max; }

// 2) Pod-positioner med nya vinkeln
scr_player_outline();

// 3) Kanon: alla pods skjuter, 1 ammo per skott, RELOAD ticks mellan salvor (VERIFIERAD, kod 0x1732-0x17ca)
if (reload > 0) { reload -= 1; }
if (g_game_mode == 1)
{
    // GALAXY DUEL (D-023): tre skott, sedan 4 s nedkylning. Ett skott per knapptryck (kantat), hur snabbt som helst; ingen ammo.
    if (ad_cool > 0)
    {
        ad_cool -= 1;
        if (ad_cool <= 0) { ad_charges = g_AD_SHOTS; }
    }
    if (in_fire && !fire_prev && ad_cool <= 0 && ad_charges > 0 && instance_number(obj_shot) < g_MAX_SHOTS)
    {
        for (p = 0; p < nk; p += 1)
        {
            if (pod_rear[p] && !rear_fire) { continue; }
            a = (ang + g_ship_pod_ang[ship, p]) mod 256;
            sh = instance_create(0, 0, obj_shot);
            sh.px = pod_wx[p];
            sh.py = pod_wy[p];
            scr_boost_vel(-g_psin[a] * power(2, shot_shift), g_pcos[a] * power(2, shot_shift));   // D-042: + skeppets fart framat, sa att man inte kor in i sina skott
            sh.vx = vx * g_SHOT_INHERIT + g_bv_x;   // D-031: skeppets sidofart ar inte med, riktningen ar exakt skeppets
            sh.vy = vy * g_SHOT_INHERIT + g_bv_y;
            sh.owner = slot;
        }
        ad_charges -= 1;
        scr_sfx_play(snd_sfx_shot, 0, 1);
        if (ad_charges <= 0) { ad_cool = g_AD_COOLDOWN; }
    }
}
else if (in_fire && reload <= 0 && (g_game_mode != 2 || cannon_ammo > 0) && instance_number(obj_shot) < g_MAX_SHOTS)
{
    fired_all = true;
    ra = (g_game_mode == 2);   // Race: ett skott (salva) kostar 1 ammo oavsett antal kanoner (D-055)
    for (p = 0; p < nk; p += 1)
    {
        if (pod_rear[p] && !rear_fire) { continue; }   // bakatpods lasta tills powerup (rear_fire)
        if (!ra && cannon_ammo <= 0) { fired_all = false; break; }
        a = (ang + g_ship_pod_ang[ship, p]) mod 256;
        sh = instance_create(0, 0, obj_shot);
        sh.px = pod_wx[p];
        sh.py = pod_wy[p];
        scr_boost_vel(-g_psin[a] * power(2, shot_shift), g_pcos[a] * power(2, shot_shift));   // D-042: + skeppets fart framat, sa att man inte kor in i sina skott
        sh.vx = vx * g_SHOT_INHERIT + g_bv_x;   // D-031: skeppets sidofart ar inte med, riktningen ar exakt skeppets
        sh.vy = vy * g_SHOT_INHERIT + g_bv_y;
        sh.owner = slot;
        if (!ra) { cannon_ammo -= 1; }
    }
    if (ra && fired_all) { cannon_ammo -= 1; }
    if (fired_all) { reload = reload_val; scr_sfx_play(snd_sfx_shot, 0, 1); }
}

fire_prev = in_fire;

// 3b) Specialvapen (val under de forsta 5 s, sedan avfyrning)
scr_special_select();
scr_special_fire();
if (in_powerup && pu_have == 1) { scr_powerup_fire(); }   // Mini Nuke: ett tryck
scr_railgun_update();   // Railgun: hall inne for att ladda, slapp for att avfyra (D-036)   // B (gamepad): avfyra hallen powerup (D-035)

// 4) Thrust: vx -= sin*THRUST>>3,  vy += cos*THRUST>>3 (VERIFIERAD, kod 0x184a-0x186e)
slowf = 1;
if (g_game_mode == 1 && ad_dmg > 0) { slowf = g_AD_SLOW; }   // Galaxy Duel: skadat skepp, 60 % langsammare (D-051)
if (g_game_mode == 2 && race_slow > 0) { slowf = g_RACE_SLOW; }   // Race: 80 % langsammare efter vapentraff (D-055)
thr = thrust * slowf;
if (in_thrust)
{
    ta = ang;
    tm = thr;
    if (drifting)
    {
        // drift: gasen riktas utat fran svangen (skeppet glider i sidled) och ar starkare (g_DRIFT_THRUST)
        if (in_left) { ta = (ang + g_DRIFT_ANG) mod 256; }
        if (in_right) { ta = ((ang - g_DRIFT_ANG) mod 256 + 256) mod 256; }
        tm = thr * g_DRIFT_THRUST;
        // SIDE THRUSTER (D-039): en sidotruster puttar skeppet ut ur kurvan, mot skeppets motsatta sida mot svangen (sv hoger = puff at vanster, sv vanster = puff at hoger)
        if (in_right && !in_left) { vx += floor(g_pcos[ang] * thr * g_DRIFT_SIDE / 8); vy += floor(g_psin[ang] * thr * g_DRIFT_SIDE / 8); }
        if (in_left && !in_right) { vx -= floor(g_pcos[ang] * thr * g_DRIFT_SIDE / 8); vy -= floor(g_psin[ang] * thr * g_DRIFT_SIDE / 8); }
    }
    vx -= floor(g_psin[ta] * tm / 8);
    vy += floor(g_pcos[ta] * tm / 8);
}
else if (reversing)
{
    // backa: svag gas at motsatt hall mot nosen (g_REVERSE_THRUST av vanlig gas)
    vx += floor(g_psin[ang] * thr * g_REVERSE_THRUST / 8);
    vy -= floor(g_pcos[ang] * thr * g_REVERSE_THRUST / 8);
}

// 5) Gravitation, hastighetsproportionellt motstand (drag/256), integration (VERIFIERAD, kod 0x187c-0x18b0)
// PLACEHOLDER (Fas 2): ett skepp som star stilla (v = 0) paverkas inte av gravitation tills det far thrust eller blir traffat,
// sa att det star helt stilla vid spawn. Originalet tillampar gravitation direkt (OKAND om skeppen faller vid start).
var ax, ay;
if (vx != 0 || vy != 0 || in_thrust || reversing)
{
    ax = vx;
    ay = vy + g_SHIP_GRAV;   // D-024: ingen gravitation pa skeppen (g_SHIP_GRAV = 0)
    // luftmotstand, avrundat mot noll (annars driver ett positivt langsamt skepp for evigt), och full stillestand nar farten ar liten
    vx = ax - sign(ax) * floor(abs(ax) * drag / 256);
    vy = ay - sign(ay) * floor(abs(ay) * drag / 256);
    if (!in_thrust && !reversing && abs(vx) < 24 && abs(vy) < 24) { vx = 0; vy = 0; }
    if (slowf < 1)
    {
        // skadat/avbromsat skepp: fart over slowf * 1,1 av normal topphastighet (gas * 160 / 8 * 256 / motstand) bromsas ned snabbt (D-051, D-055)
        vcap = slowf * 1.1 * thrust * 5120 / max(1, drag);
        spd = sqrt(vx * vx + vy * vy);
        if (spd > vcap) { f = max(vcap / spd, 0.9); vx = floor(vx * f); vy = floor(vy * f); }
    }
    px += vx;
    py += vy;
}
scr_player_outline();

// 6) Vaggkrasch (VERIFIERAD formel, kod ~0x2730): tillbaka till forra positionen, skada = (vx^2+vy^2)>>16 >>6 + ticks,
//    hastighet = -v/4. Kollisionsmetoden (segmentskarning i varldsrymd) ar en PLACEHOLDER; originalet testar bitmappar i skarmrymd.
if (scr_player_hits_wall())
{
    px = prev_px; py = prev_py; ang = prev_ang;
    // gnistor: antal och fart okar med kraschhastigheten (1/256 px per tick)
    scr_spark_burst(floor(px / 256), floor(py / 256), clamp(floor(sqrt(vx * vx + vy * vy) / 120), 2, 40), 1.1 + min(2.2, sqrt(vx * vx + vy * vy) / 3500), scr_slot_colour(slot));
    if (abs(vx) > 1000 || abs(vy) > 1000) { scr_sfx_play(snd_sfx_crash, 2, 1); }   // original: ljud bara om farten ligger utanfor +-1000 (0x5dc4)
    if (g_game_mode != 1 && g_game_mode != 2) { energy -= floor(floor((vx * vx + vy * vy) / 65536) / 64) + 1; }   // Galaxy Duel och Race: ingen vaggskada (D-053)
    vx = floor(-vx / 4);
    vy = floor(-vy / 4);
    scr_player_outline();
}

// 7) Dod: energi <= 0 -> liv-1; om liv kvar: aterskapa, annars eliminerad (VERIFIERAD, kod 0x3f12)
if (energy <= 0)
{
    scr_player_lose_life();   // exploderar, tar ett liv och startar nedrakningen
}
scr_trail_update();   // driftspar (D-030)
scr_drift_sound();   // driftljud (loop)
