/// scr_proj_hit(x1, y1, x2, y2, radius, owner_slot, age)

// Astro Duel: svep en projektil fran (x1,y1) till (x2,y2) (varldspixlar) och returnera forsta levande skepp som traffas, annars noone.

// Testar var 6:e pixel langs stracka (sa snabba missiler inte flyger igenom skepp) och, om radius > 0, aven fyra punkter runt (projektilens storlek).

// Agaren hoppas over de forsta 8 tickens liv sa att skottet inte traffar det egna skeppet vid pod-positionen.

var dist, n, s, t;

g_pj_hit = noone;

g_pj_r = argument4;

g_pj_owner = argument5;

g_pj_age = argument6;

dist = point_distance(argument0, argument1, argument2, argument3);

n = max(1, ceil(dist / 6));

for (s = 1; s <= n; s += 1)

{

    t = s / n;

    g_pj_x = argument0 + (argument2 - argument0) * t;

    g_pj_y = argument1 + (argument3 - argument1) * t;

    with (obj_player)

    {

        if (alive && !race_fin && g_pj_hit == noone)

        {

            if (!(slot == g_pj_owner && g_pj_age < 8) && !scr_ctb_friend(g_pj_owner, slot))   // Capture the Bratwurst: Mini Nuke gar igenom lagkamrater (D-082)

            {

                if (scr_point_in_ship(g_pj_x, g_pj_y)) { g_pj_hit = id; }

                else if (g_pj_r > 0)

                {

                    if (scr_point_in_ship(g_pj_x + g_pj_r, g_pj_y)) { g_pj_hit = id; }

                    else if (scr_point_in_ship(g_pj_x - g_pj_r, g_pj_y)) { g_pj_hit = id; }

                    else if (scr_point_in_ship(g_pj_x, g_pj_y + g_pj_r)) { g_pj_hit = id; }

                    else if (scr_point_in_ship(g_pj_x, g_pj_y - g_pj_r)) { g_pj_hit = id; }

                }

            }

        }

    }

    if (g_pj_hit != noone) { break; }

}

return g_pj_hit;

