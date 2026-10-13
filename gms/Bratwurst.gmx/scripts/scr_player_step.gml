/// scr_player_step()
// Kors i obj_player, en tick. Foljer originalets spelarrutin (hunk0 0x16a4-0x18d8, docs/15 steg 3):
//   1) svang med accelererande vinkelhastighet  2) pod-positioner  3) kanon  4) thrust  5) gravitation+motstand+integration
//   6) vaggkrasch  7) dod/respawn.  Specialvapen (bit3) ar INTE implementerat i Fas 1.
var a, p, fired_all, sh, shx, shy;
if (!alive)
{
    // nedrakning till aterskapning (D: 3 sekunder efter att ett liv forlorats)
    if (respawn_t > 0)
    {
        respawn_t -= 1;
        if (respawn_t == 0) { alive = true; scr_player_respawn(); }
    }
    exit;
}
scr_player_input();
if (in_shipcyc) { scr_player_change_ship(1); }   // test: byt skepp under matchen
if ((in_podcyc || in_psel) && sp_nsel > 0) { sp_pod_i = (sp_pod_i + 1) mod sp_nsel; }   // byt specialpod (position pa skeppet) under matchen
if (in_wsel) { scr_special_switch(); }   // byt specialvapen under matchen

if (boost_timer > 0) { boost_timer -= 1; }
prev_px = px; prev_py = py; prev_ang = ang;

// 1) Svang: vinkel -/+= w; w += TURN_ACC; utan svang w = TURN_INIT; w <= TURN_MAX (VERIFIERAD, kod 0x16a4-0x1718)
var turned;
turned = false;
if (in_left)  { turned = true; ang -= turn_w; turn_w += turn_acc; }
if (in_right) { turned = true; ang += turn_w; turn_w += turn_acc; }
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
    // ASTRO DUEL (D-023): tre skott, sedan 4 s nedkylning. Ett skott per knapptryck (kantat), hur snabbt som helst; ingen ammo.
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
            sh.vx = vx - g_psin[a] * power(2, shot_shift);
            sh.vy = vy + g_pcos[a] * power(2, shot_shift);
            sh.owner = slot;
        }
        ad_charges -= 1;
        scr_sfx_play(snd_sfx_shot, 0, 1);
        if (ad_charges <= 0) { ad_cool = g_AD_COOLDOWN; }
    }
}
else if (in_fire && reload <= 0 && instance_number(obj_shot) < g_MAX_SHOTS)
{
    fired_all = true;
    for (p = 0; p < nk; p += 1)
    {
        if (pod_rear[p] && !rear_fire) { continue; }   // bakatpods lasta tills powerup (rear_fire)
        if (cannon_ammo <= 0) { fired_all = false; break; }
        a = (ang + g_ship_pod_ang[ship, p]) mod 256;
        sh = instance_create(0, 0, obj_shot);
        sh.px = pod_wx[p];
        sh.py = pod_wy[p];
        sh.vx = vx - g_psin[a] * power(2, shot_shift);
        sh.vy = vy + g_pcos[a] * power(2, shot_shift);
        sh.owner = slot;
        cannon_ammo -= 1;
    }
    if (fired_all) { reload = reload_val; scr_sfx_play(snd_sfx_shot, 0, 1); }
}

fire_prev = in_fire;

// 3b) Specialvapen (val under de forsta 5 s, sedan avfyrning)
scr_special_select();
scr_special_fire();

// 4) Thrust: vx -= sin*THRUST>>3,  vy += cos*THRUST>>3 (VERIFIERAD, kod 0x184a-0x186e)
if (in_thrust)
{
    vx -= floor(g_psin[ang] * thrust / 8);
    vy += floor(g_pcos[ang] * thrust / 8);
}

// 5) Gravitation, hastighetsproportionellt motstand (drag/256), integration (VERIFIERAD, kod 0x187c-0x18b0)
// PLACEHOLDER (Fas 2): ett skepp som star stilla (v = 0) paverkas inte av gravitation tills det far thrust eller blir traffat,
// sa att det star helt stilla vid spawn. Originalet tillampar gravitation direkt (OKAND om skeppen faller vid start).
var ax, ay;
if (vx != 0 || vy != 0 || in_thrust)
{
    ax = vx;
    ay = vy + g_SHIP_GRAV;   // D-024: ingen gravitation pa skeppen (g_SHIP_GRAV = 0)
    // luftmotstand, avrundat mot noll (annars driver ett positivt langsamt skepp for evigt), och full stillestand nar farten ar liten
    vx = ax - sign(ax) * floor(abs(ax) * drag / 256);
    vy = ay - sign(ay) * floor(abs(ay) * drag / 256);
    if (!in_thrust && abs(vx) < 24 && abs(vy) < 24) { vx = 0; vy = 0; }
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
    if (g_game_mode != 1) { energy -= floor(floor((vx * vx + vy * vy) / 65536) / 64) + 1; }   // Astro Duel: ingen vaggskada
    vx = floor(-vx / 4);
    vy = floor(-vy / 4);
    scr_player_outline();
}

// 7) Dod: energi <= 0 -> liv-1; om liv kvar: aterskapa, annars eliminerad (VERIFIERAD, kod 0x3f12)
if (energy <= 0)
{
    scr_player_lose_life();   // exploderar, tar ett liv och startar nedrakningen
}
