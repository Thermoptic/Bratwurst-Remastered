# Music

Source mp3 files for the in-game playlist. `tools/gen_tracks.py` converts them to ogg sound resources
(`gms/Bratwurst.gmx/sound/audio/snd_music_N.ogg`, built into the game) and analyses them for the equalizer
(`gms/Bratwurst.gmx/datafiles/viz_N.txt`, an Included File). The track order is fixed in `tools/tracks.txt`.

To add a song: put the mp3 here and run `python tools/gen_tracks.py`.

Rights status: the Thermoptic tracks are the project owner's own music (SANNOLIK, to be confirmed by the owner).
The title song (`snd_title_music`, 3Elks - Das Bratwurst, DnB edit) is a third-party track; check its licence
before making this repository public or distributing a build.
