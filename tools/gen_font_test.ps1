# TILLFALLIGT (D-073): genererar typsnittsresurser for FONT TEST-sidan (Options -> FONT TEST) ur TTF-filer direkt (inga installerade typsnitt behovs).
# Kor: powershell -ExecutionPolicy Bypass -File tools/gen_font_test.ps1
# Skriver gms/Bratwurst.gmx/fonts/fnt_ft_<typsnitt>_<storlek>_<aa>.font.gmx + .png (glyfatlas, vit text med alfa, proportionell breddtabell per tecken).
# Storlekar (punkter): 8, 10, 14, 20, 28. aa = 1 med kantutjamning, 0 utan (skarp, kantig). Typsnitten 1 och 2 (Rodchenko, ParaType) ar KOMMERSIELLA: lagg inte atlasfilerna
# i git och ta inte med dem i en distribuerad version utan licens. Radera allt med: tools/remove_font_test.ps1.
Add-Type -AssemblyName System.Drawing
$root = Split-Path -Parent $PSScriptRoot
$outDir = Join-Path $root "gms\Bratwurst.gmx\fonts"
$ufont = Join-Path $env:LOCALAPPDATA "Microsoft\Windows\Fonts"
$fonts = @(
    @{ i = 0; label = "CASCADIA MONO (NU)"; file = "C:\Windows\Fonts\CascadiaMono.ttf"; lic = "SIL OFL 1.1 (FRI)" },
    @{ i = 1; label = "RODCHENKO LIGHT"; file = (Join-Path $ufont "Rodchenko-Light.ttf"); lic = "PARATYPE KOMMERSIELL - BARA LOKALT TEST" },
    @{ i = 2; label = "RODCHENKO COND LIGHT"; file = (Join-Path $ufont "RodchenkoCond-Light.ttf"); lic = "PARATYPE KOMMERSIELL - BARA LOKALT TEST" },
    @{ i = 3; label = "BEBAS NEUE"; file = (Join-Path $ufont "BebasNeue-Regular.ttf"); lic = "SIL OFL 1.1 (FRI)" },
    @{ i = 4; label = "DOTO"; file = (Join-Path $ufont "Doto-Regular.ttf"); lic = "SIL OFL 1.1 (FRI)" },
    @{ i = 5; label = "PIXELIFY SANS"; file = (Join-Path $ufont "PixelifySans-Regular.ttf"); lic = "SIL OFL 1.1 (FRI)" },
    @{ i = 6; label = "INTEL ONE MONO"; file = (Join-Path $ufont "IntelOneMono-Regular.ttf"); lic = "SIL OFL 1.1 (FRI)" }
)
$sizes = @(8, 10, 14, 20, 28)
$last = 127
$cols = 16
$data = New-Object System.Text.StringBuilder
[void]$data.AppendLine("/// scr_ftest_data()")
[void]$data.AppendLine("// TILLFALLIGT (D-073), genererad av tools/gen_font_test.ps1 - redigera inte for hand. Typsnitt for FONT TEST-sidan: g_ft_n typsnitt, g_ft_name/g_ft_lic[typsnitt], g_ft_pt[storlek],")
[void]$data.AppendLine("// g_ft_f[(typsnitt * 5 + storlek) * 2 + aa] = typsnittsresursen (aa 1 = kantutjamning, 0 = utan).")
[void]$data.AppendLine("g_ft_n = $($fonts.Count);")
$n = 0
foreach ($f in $fonts) {
    if (-not (Test-Path $f.file)) { Write-Warning ("saknas: " + $f.file); continue }
    $pfc = New-Object System.Drawing.Text.PrivateFontCollection
    $pfc.AddFontFile($f.file)
    $fam = $pfc.Families[0]
    [void]$data.AppendLine(('g_ft_name[{0}] = "{1}"; g_ft_lic[{0}] = "{2}";' -f $f.i, $f.label, $f.lic))
    for ($si = 0; $si -lt $sizes.Count; $si++) {
        $pt = $sizes[$si]
        $font = New-Object System.Drawing.Font($fam, [single]$pt, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point)
        $tmp = New-Object System.Drawing.Bitmap 8, 8
        $tmp.SetResolution(96, 96)
        $g0 = [System.Drawing.Graphics]::FromImage($tmp)
        $fmt = [System.Drawing.StringFormat]::GenericTypographic
        $fmt.FormatFlags = $fmt.FormatFlags -bor [System.Drawing.StringFormatFlags]::MeasureTrailingSpaces
        $adv = @{}
        $cw = 1
        for ($c = 32; $c -le $last; $c++) {
            $a = [int][math]::Round($g0.MeasureString([string][char]$c, $font, 4000, $fmt).Width)
            if ($a -lt 1) { $a = 1 }
            $adv[$c] = $a
            if ($a -gt $cw) { $cw = $a }
        }
        $cw = $cw + 2
        $ch = [int][math]::Ceiling($font.GetHeight($g0))
        $g0.Dispose(); $tmp.Dispose()
        $count = $last - 32 + 1
        $rows = [int][math]::Ceiling($count / $cols)
        $pad = 2
        $W = $pad + $cols * ($cw + $pad)
        $H = $pad + $rows * ($ch + $pad)
        foreach ($aa in @(1, 0)) {
            $name = "fnt_ft_{0}_{1}_{2}" -f $f.i, $si, $aa
            $bmp = New-Object System.Drawing.Bitmap $W, $H, ([System.Drawing.Imaging.PixelFormat]::Format32bppArgb)
            $bmp.SetResolution(96, 96)
            $g = [System.Drawing.Graphics]::FromImage($bmp)
            $g.Clear([System.Drawing.Color]::Transparent)
            if ($aa -eq 1) { $g.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::AntiAliasGridFit }
            else { $g.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::SingleBitPerPixelGridFit }
            $brush = [System.Drawing.Brushes]::White
            $glyphs = New-Object System.Text.StringBuilder
            for ($c = 32; $c -le $last; $c++) {
                $i = $c - 32
                $x = $pad + ($i % $cols) * ($cw + $pad)
                $y = $pad + [math]::Floor($i / $cols) * ($ch + $pad)
                if ($c -gt 32 -and $c -lt 127) {
                    $g.DrawString([string][char]$c, $font, $brush, [single]($x + 1), [single]$y, $fmt)
                }
                [void]$glyphs.AppendLine(('    <glyph character="{0}" x="{1}" y="{2}" w="{3}" h="{4}" shift="{5}" offset="0"/>' -f $c, $x, $y, $cw, $ch, $adv[$c]))
            }
            $g.Dispose()
            $bmp.Save((Join-Path $outDir ($name + ".png")), [System.Drawing.Imaging.ImageFormat]::Png)
            $bmp.Dispose()
            $aaVal = 0
            if ($aa -eq 1) { $aaVal = 3 }
            $xml = @"
<!--This Document is generated by GameMaker, if you edit it by hand then you do so at your own risk!-->
<font>
  <name>$($fam.Name)</name>
  <size>$pt</size>
  <bold>0</bold>
  <renderhq>-1</renderhq>
  <italic>0</italic>
  <charset>0</charset>
  <aa>$aaVal</aa>
  <includeTTF>0</includeTTF>
  <TTFName></TTFName>
  <texgroups>
    <texgroup0>0</texgroup0>
  </texgroups>
  <ranges>
    <range0>32,$last</range0>
  </ranges>
  <glyphs>
$($glyphs.ToString().TrimEnd())
  </glyphs>
  <kerningPairs/>
  <image>$name.png</image>
</font>
"@
            $utf8 = New-Object System.Text.UTF8Encoding($false)
            [System.IO.File]::WriteAllText((Join-Path $outDir ($name + ".font.gmx")), $xml, $utf8)
            [void]$data.AppendLine(('g_ft_f[{0}] = {1};' -f ((($f.i * 5 + $si) * 2) + $aa), $name))
            $n++
        }
    }
}
$pts = ($sizes | ForEach-Object { [string]$_ }) -join ", "
for ($si = 0; $si -lt $sizes.Count; $si++) { [void]$data.AppendLine(('g_ft_pt[{0}] = {1};' -f $si, $sizes[$si])) }
$scripts = Join-Path $root "gms\Bratwurst.gmx\scripts"
$utf8 = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllText((Join-Path $scripts "scr_ftest_data.gml"), $data.ToString(), $utf8)
Write-Host ("klart: {0} typsnittsresurser" -f $n)
