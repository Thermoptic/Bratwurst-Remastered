# Raderar FONT TEST (D-073): typsnittsresurserna fnt_ft_*, sidans skript (scr_ftest_*), och rader i projektfilen. Raderar INTE raderna i Options/menyn eller i spelkoden;
# de tas bort for hand enligt docs/10_DECISIONS.md D-073 (en rad i scr_mn_build, en i scr_mn_step, en i scr_game_step, en i scr_game_draw, en i scr_game_create).
$root = Split-Path -Parent $PSScriptRoot
$gmx = Join-Path $root "gms\Bratwurst.gmx"
Get-ChildItem (Join-Path $gmx "fonts") -Filter "fnt_ft_*" | Remove-Item -Force
Get-ChildItem (Join-Path $gmx "scripts") -Filter "scr_ftest_*" | Remove-Item -Force
$p = Join-Path $gmx "Bratwurst.project.gmx"
$lines = [System.IO.File]::ReadAllLines($p) | Where-Object { $_ -notmatch "fnt_ft_" -and $_ -notmatch "scr_ftest_" }
[System.IO.File]::WriteAllLines($p, $lines, (New-Object System.Text.UTF8Encoding($false)))
Write-Host "FONT TEST-filerna raderade. Ta bort raderna i scr_mn_build, scr_mn_step, scr_game_step, scr_game_draw och scr_game_create."
