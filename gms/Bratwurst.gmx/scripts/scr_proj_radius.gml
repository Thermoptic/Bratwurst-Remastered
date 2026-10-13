/// scr_proj_radius()
// Projektilens traffradie i varldspixlar i Astro Duel: 1,5 skarmenheter (halva den ritade storleken 3) gjorda 30 % storre, sa det blir
// latttare att traffa. I Classic anvands en punkt (radie 0).
return 1.5 * 1.3 * 32768 / max(1, g_zoom);
