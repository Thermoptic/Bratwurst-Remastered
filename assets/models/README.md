# Models

`sausage.svg` is the editable source of the Bratwurst sausage model (used on the title screen and menu background, and later for Capture the Bratwurst).

1. Open `sausage.svg` in a vector program (Inkscape, Illustrator, Affinity, or even a text editor).
2. Draw or edit lines inside the group `id="model"` (red). Lines, polylines, polygons, rectangles and paths with straight lines or curves all work; curves are split into 8 straight segments. The group `id="guide"` (grid, centre mark) is ignored.
3. Units are ship units (the sausage is about 320 long), y points down like on screen, (0,0) is the centre of the model.
4. Save, then run `python tools/svg_to_model.py` (add `--check` to only print the number of points and lines). It writes `gms/Bratwurst.gmx/scripts/scr_data_sausage.gml`, replacing the generated version.
5. Press F5 in GameMaker and look at the title screen.

`python tools/make_sausage_svg.py` rewrites `sausage.svg` from the built-in generated shape (this overwrites your drawing).
