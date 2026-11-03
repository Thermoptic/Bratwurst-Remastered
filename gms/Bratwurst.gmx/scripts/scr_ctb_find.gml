/// scr_ctb_find(slot)
// Capture the Bratwurst (D-082): instansen for ett levande skepp med spelarplats slot, annars noone. Korven minns bara en spelarplats (aldrig en instans),
// sa att den aldrig kan peka pa ett forstort eller borttaget skepp.
g_ct_fs = argument0;
with (obj_player)
{
    if (alive && slot == g_ct_fs) { return id; }
}
return noone;
