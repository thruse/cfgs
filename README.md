# Configurations (cfgs)

## Steps for setting up on a new machine

- Decide what you want your directory to be. For the purposes of these instructions, let this directory be `~/foo`.
- On macOS install Homebrew by running `bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`.
- Install the `g` folder on Google Drive to `~/Downloads` using a web browser.
- On Windows
    - Install 7-Zip
    - `mkdir "%userprofile%\foo\tmp\drive_downloads" 2> nul`
    - `cd /d "%userprofile%\foo\tmp\drive_downloads"`
    - `del *`
    - `move "%userprofile%\downloads\g-*" .`
    - `rmdir /q /s "%userprofile%\foo\g"`
    - `7z x "*.zip" -o"%userprofile%\foo"`
- On Unix
    - `mkdir -p "$HOME/foo/tmp/drive_downloads" 2> /dev/null`
    - `cd "$HOME/foo/tmp/drive_downloads"`
    - `rm *`
    - `mv "$HOME/Downloads/g-*" .`
    - `rm -rf "$HOME/foo/g"`
    - `unzip '*.zip' -d "$HOME/foo"`
- Install Git.
- Clone this repository into `~/foo/dev`. (Most important step.)
- Start a priviledged shell session.
- Run `~/foo/dev/cfgs/cfg --install ; . ~/.bash_profile` or `%userprofile%/foo/dev/cfgs/cfg --install & %userprofile%/foo/dev/cfgs/shin`

## Notes

Make sure to install non-games in their default locations.

This setup works on modern systems. (Currently macOS and Windows.)

Install things for the first time with `cfg`, but delete things manually to get `cfg` to reinstall them.

For more things to add (for example automation of macOS system settings) look at https://github.com/mathiasbynens/dotfiles and https://github.com/holman/dotfiles.

`venvin` only works with `venv`s called `.venv`.

Only make files and directories with names following these rules
- start with a letter
- contain letters, numbers and underscores only.

### Possibly useful things

- `powershell -c winget list ^| select-string winget` because `winget list --source winget` doesn't work
- `brew uninstall --zap formula-name` may fully uninstall all files related to `formula-name`.
- `winget export --output c:\path\to\packages.json --source winget --include-versions` to get installed `winget` stuff.
- `brew bundle dump --file=/path/to/Brewfile` to get installed `homebrew` stuff.
- `python -m venv .venv` to make a new `python` `venv` called `.venv` in the current directory.

## Todo

- Fix weird bug on Windows where sometimes (unpredictably) the command prompt opens with an old raster font instead of the modern default.
- Improve `srm` to handle multiple files at once.
- When I decide on some `pip` packages on `python`, include `requirements.txt` in the `cfg`. `pip freeze > requirements.txt`, `pip install --requirement /path/to/requirements.txt`
- Add more non-dev programs to `cfg` (Discord, Gimp, OBS, VLC, Kindle?, ...)
- Add more of my usual directories to `cfg` (forgot some)
- macOS settings (set text size?)
- Perhaps do more in PowerShell on Windows
- Add `shin` to my `bin` (think about this) (maybe not) (probably no point, shin will have already been called anyway by the time the `bin` is on `path`)
- AuCTeX/LaTeX workflow (see `$DEVDIR/tmp/auctex_test` on my mac)
- Linux support
- Possibly install a newer version of bash from homebrew. Don't see much point in this though.
- Fix some registry entries not getting set -- possible process needs to be killed to make it work (tried explorer already)
- Possibly use `--` more (as in `if [ ! "$(basename "$(readlink -f -- "$0")")" = "cfg" ] ; then`) but it's difficult to tell when it's available and where it can be used.

