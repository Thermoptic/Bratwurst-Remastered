/// scr_missile_step()
// Kors i obj_missile, en tick. Originalets specialvapenobjekt (hunk0 0x610c, handlers 0x63ea / 0x6406, docs/15 steg 5):
//   MISSILE:  x += v; timer -= 1; borta (explosion) nar timer <= 0 (50 ticks).
//   GUIDED:   timer += 1; timer < 0: rakt; timer >= 225: borta utan att rora sig; annars styr mot narmaste levande spelare
//             (OBS: inklusive agaren, som i originalet): v -= (d * F) >> 8, F = (108e6 + timer*0x493e0)/(d2 + 60000), |v| <= 0x1400.
//   Traff i vagg: explosion. Traff i skepp: position -= v, energi -12 (MISSILE) / -5 (GUIDED), impuls (v_obj - v)*16 >> BOUNCE.
var expired, wxp, wyp, tol, ff, sk, sa, ss, kd, hr, ffx, kmul, mx1, my1, mr;
kd = mtype;
if (mtype == 3) { kd = 4; }   // Mini Nuke (powerup): explosionstyp 4
expired = false;
if (mtype == 1 || mtype == 3)
{
    px += vx;
    py += vy;
    mtimer -= 1;
    if (mtimer <= 0) { expired = true; }
}
if (mtype == 2)
{
    mtimer += 1;
    if (mtimer >= 225) { expired = true; }
    else
    {
        if (mtimer >= 0)
        {
            scr_nearest_player(px, py, -1);
            if (g_near_id != noone)
            {
                ff = floor((108000000 + mtimer * 300000) / (g_near_d2 + 60000));
                vx -= floor(g_near_dx * ff / 256);
                vx = max(-5120, min(5120, vx));
                vy -= floor(g_near_dy * ff / 256);
                vy = max(-5120, min(5120, vy));
            }
        }
        px += vx;
        py += vy;
    }
}
// pixelpartikelsvans: tva partiklar per tick utlagda langs senaste tickens rorelse, med liten slumpmassig sidofart och kort livslangd
for (sk = 0; sk < 2; sk += 1)
{
    sa = random(2 * pi);
    ss = random(0.35) * 32768 / max(1, g_zoom);
    scr_spark_one((px - vx * sk / 2) / 256, (py - vy * sk / 2) / 256, cos(sa) * ss, sin(sa) * ss, 8 + irandom(16), 1 + irandom(1), choose(g_c[10], g_c[9], g_c[6]));
}
if (expired) { ffx = scr_fx_spawn(px, py, kd, 1); ffx.fowner = owner; instance_destroy(); exit; }   // fowner: vems explosion ringen ar (kills och friendly fire, D-082)

wxp = floor(px / 256);
wyp = floor(py / 256);
tol = max(1, 32768 / g_zoom);
if (scr_seg_hits_wall(floor((px - vx) / 256), floor((py - vy) / 256), wxp, wyp, tol)) { ffx = scr_fx_spawn(px, py, kd, g_FX_IMPACT); ffx.fowner = owner; instance_destroy(); exit; }

hx = wxp;
hy = wyp;
if (!variable_instance_exists(id, "mage")) { mage = 0; }
mage += 1;
g_hit_id = noone;
if (g_game_mode == 1 || mtype == 3)
{
    hr = scr_proj_radius();
    if (mtype == 3) { hr = msize; }   // Mini Nuke: traffradie = projektilens storlek (Powerup Editor)
    g_hit_id = scr_proj_hit(floor((px - vx) / 256), floor((py - vy) / 256), wxp, wyp, hr, owner, mage);
}
// Traff pa skeppets linjer (D-087): i alla lagen provas missilens vag sedan forra tickens position mot skeppens linjer (scr_missile_hits_ship), inte bara punkten i slutpositionen,
// sa att en missil som ror vid en linje eller hoppar over en tunn del traffar. Missilens egen agare hoppas over de forsta 8 tickens liv (missilen skapas vid skeppets pod).
if (g_hit_id == noone)
{
    mx1 = floor((px - vx) / 256);
    my1 = floor((py - vy) / 256);
    mr = 2.4 * 32768 / max(1, g_zoom);   // missilens ritade karna (2,4 skarmenheter) i varldspixlar
    if (mtype == 3) { mr = msize; }      // Mini Nuke: storleken ur Powerup Editor, som forut
    with (obj_player)
    {
        if (alive && !race_fin && g_hit_id == noone && !scr_ctb_friend(other.owner, slot))   // Capture the Bratwurst: missiler gar igenom lagkamrater (D-082)
        {
            if (!(slot == other.owner && other.mage < 8))
            {
                if (scr_missile_hits_ship(mx1, my1, other.hx, other.hy, mr)) { g_hit_id = id; }
            }
        }
    }
}
if (g_hit_id != noone)
{
    px -= vx;
    py -= vy;
    kmul = 1;
    if (mtype == 1) { kmul = g_ML_KNOCK; }   // KNOCKBACK i Powerup Editor (D-069)
    with (g_hit_id)
    {
        if (g_game_mode == 3) { scr_ctb_hurt(other.owner, true); }   // missil: bararen tappar korven (D-084)   // Capture the Bratwurst (D-082)
        if (g_game_mode == 5) { scr_sw_hit(1, other.vx, other.vy); }   // Super Smashwurst: +Push (MISSILE PUSH) och knuff i missilens riktning (D-085)
        else if (g_game_mode == 1) { scr_ad_hit(); }
        else if (g_game_mode == 2) { scr_race_hit(); }   // Race: icke-dodlig, bara fartminskning (D-055)   // Galaxy Duel: forsta traffen skadar, nasta dodar (D-051)
        else if (other.mtype == 3) { energy -= g_sv[g_SV_PU + 4]; }   // Mini Nuke: direktskada ur Powerup Editor
        else if (other.mtype == 1) { energy -= g_DMG_MSL; } else { energy -= g_DMG_GUIDED; }
        if (g_game_mode != 5)
        {
            vx += floor((other.vx - vx) * 16 * kmul / power(2, bounce));
            vy += floor((other.vy - vy) * 16 * kmul / power(2, bounce));
        }
    }
    scr_spark_burst(wxp, wyp, 12 + irandom(5), 2.2, scr_slot_colour(g_hit_id.slot));
    ffx = scr_fx_spawn(px, py, kd, g_FX_IMPACT);
    ffx.fowner = owner;
    if (mtype != 3) { ffx.fdone[g_hit_id.slot] = 1; }   // skeppet som traffades direkt far inte ringens skada ocksa (D-068; Mini Nuke oforandrad: direktskada + chockvag)
    instance_destroy();
}
