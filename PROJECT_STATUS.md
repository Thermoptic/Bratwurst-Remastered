# PROJECT_STATUS — Bratwurst Remastered

Recovery handover written 2026-10-25 after a Windows reinstall. Facts below are labelled VERIFIED (checked against files) or INFERENCE. This file does not replace `CLAUDE.md`, `CHANGELOG.md` or `docs/`.

## Architecture and key locations
- Engine: GameMaker Studio 1.4 (GML must stay GMS 1.4 compatible, see `CLAUDE.md`).
- Project file: `gms/Bratwurst.gmx/Bratwurst.project.gmx`. Contents: 5 objects (`obj_game`, `obj_player`, `obj_shot`, `obj_missile`, `obj_fx`), 1 room (`rm_arena`), 254 scripts, 38 sounds, 32 font files, 7 data files. VERIFIED.
- Docs: `docs/` (decisions in `docs/10_DECISIONS.md`, test plan in `docs/08_TEST_PLAN.md`, Race docs in `docs/race/`), `gms/README.md` for GMS 1.4 quirks.
- Tools: `tools/` (Python and PowerShell generators, Ghidra exports). Analysis output: `analysis/`.
- `original/` (27 original files: executable, `Bratwurst.doc`, 15 `.SOB` ships) is reference only, never modify. It is in `.gitignore`, so it is NOT on GitHub. Keep a separate backup. Checksums: `docs/12_SOURCE_CHECKSUMS.md`.
- Rodchenko font atlases are gitignored (commercial font, D-073/D-074).

## Git state at recovery
- Branch `main`, commit `a57682a` ("Ship select: auto-scale ships into the radar circle…", D-075). 51 linear commits, 2026-10-13 to 2026-10-20. VERIFIED.
- `origin` = https://github.com/Thermoptic/Bratwurst-Remastered.git. VERIFIED 2026-10-25 with `git ls-remote origin` (after GitHub login): remote `main` and HEAD = `a57682ad0408da3d880569071c796aff6878f4d3`, identical to local `main` at that time. Only `main` exists on the remote (the repo is private, so it needs login).
- Git 2.56.0.3 is installed at `D:\program\Git\cmd\git.exe`; system config has `core.autocrlf=true` and `credential.helper=manager`. GameMaker Studio 1.4 is at `D:\program\GameMaker-Studio14\GameMaker-Studio.exe`.
- No other branches, no stashes. VERIFIED.
- Working tree equals HEAD. `git status` was clean apart from this file. (An early raw-byte hash check showed 328 files "differing" only by CRLF vs LF; that was an artifact of ignoring `core.autocrlf=true`, not a real change.) No missing or untracked files except this one (`original/` is gitignored). VERIFIED.
- Some files carry 2026-10-22 timestamps (project file, `Default.config.gmx`, `fnt_lg_k*`). Content equals HEAD, so likely an IDE re-save. INFERENCE.

## Recovery warnings
- No `.gitattributes` exists; line endings rely on `core.autocrlf=true` in the machine's Git config. A different Git setup could show phantom CRLF changes. Consider adding `.gitattributes` (`* text=auto`) as a separate, approved commit.
- Before `git pull`/`reset`/`checkout`, run `git status` and review.
- The Claude Code terminal may have a stale PATH; use `D:\program\Git\cmd\git.exe` or refresh PATH.
- Back up the whole folder including `original/`.

## Implementation status
| System | Status |
|---|---|
| Physics, collisions, wall slide, energy/lives | Implemented (user confirmed running 2026-10-13) |
| Classic, Galaxy Duel, Asteroids | Implemented, needs testing |
| Race | Stages 1–7 coded; Stage 8 checklist (`docs/race/RACE_STAGE8_CHECKLIST.md`) largely unrun |
| Map editor, Powerup Editor, specials, menus, music, pause menu, gamepad | Implemented, many changelog entries say "Ej körd" (not run) |
| Capture the Bratwurst | Documented only (menu placeholder "COMING SOON", sausage model is decoration) |
| The Hidden-inspired mode | Not found |
| Online multiplayer | Not found |
| Windows export | Not verified; do not export before the game is verified to start and play |

Build/run has NOT been verified since the reinstall.

## Last known development task (INFERENCE)
Ship select auto-scaling (D-075), marked not run. Open Race items: Stage 8 tests, no race time limit, ship select still shows weapon choice in Race.

## Next steps
1. (Done) Git installed, remote verified in sync.
2. Back up the folder.
3. Open in GMS 1.4, press F5, confirm start, fonts and `Music/` load.
4. Run the Stage 8 checklist and record results in `docs/` and `CHANGELOG.md`.
5. Then resume feature work (decide Race time limit; write specs for Capture the Bratwurst / Hidden mode).

## Instructions for future Claude Code sessions
- Read `CLAUDE.md` first; follow its rules (GMS 1.4 only, never touch `original/`, document decisions in `docs/10_DECISIONS.md` and `CHANGELOG.md`, state how each change was tested).
- Do not treat design docs or prompts as proof a feature exists; check the code.
- Update this file when branch, commit or status changes.
