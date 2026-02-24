# Repository Guidelines

## Project Structure & Module Organization
- Root config files: `hyprland.conf`, `hypridle.conf`, `hyprlock.conf`, `hyprpaper.conf`, `colors.conf`.
- Scripts: `Scripts/` contains helper shell scripts (e.g., `Scripts/battery_notify.sh`, `Scripts/music-status.sh`).
- Assets: `Images/` for UI/lockscreen artwork and `Fonts/` for bundled font files.

This repo is a Hyprland configuration set; changes usually involve editing the `*.conf` files and the scripts they reference.

## Build, Test, and Development Commands
- `hyprctl reload` reloads Hyprland config after edits without restarting the session.
- `bash Scripts/battery_notify.sh` runs the battery notifier script directly for quick validation.
- `bash Scripts/music-status.sh --title` outputs current track title; use `--artist` or `--art` for other outputs.

No build system is present; changes are applied by reloading Hyprland or restarting related daemons (`hypridle`, `hyprpaper`, `hyprlock`).

## Coding Style & Naming Conventions
- Shell scripts are `bash` and use 2-space indentation. Keep logic simple and prefer POSIX utilities.
- Hyprland config blocks use 4-space indentation inside `{}` (see `hyprland.conf`).
- Naming: keep file names descriptive and lowercase where possible; config files end with `.conf` and scripts end with `.sh`.

## Testing Guidelines
- There is no automated test suite. Validate changes by reloading config and exercising the affected behavior.
- Script checks: run the script manually and verify expected output or notifications.

## Commit & Pull Request Guidelines
- No commit message convention is defined in this repo. Use short, imperative summaries (e.g., "Adjust gaps and borders").
- PRs should describe the change scope and include before/after screenshots for visual tweaks (themes, layouts, lockscreen).
- Note any new dependencies (e.g., `playerctl`, `swww-daemon`) and where they are used.

## Configuration Tips
- Keep external paths consistent. For example, `Scripts/music-status.sh` references a fallback art path; update it if your wallpapers move.
- When adding new scripts, wire them from `hyprland.conf` via `exec-once` and test with `hyprctl reload`.
