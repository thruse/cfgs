# Configurations (cfgs)

## Steps for setting up on a new machine

- Decide what you want your directory to be. For the purposes of these instructions, let this directory be `~/foo`.
- On macOS install Homebrew by running `bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`.
- Download the `g` folder on Google Drive to `~/Downloads` using a web browser.
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
- Run `~/foo/dev/cfgs/cfg --install ; . ~/.bash_profile` or `%userprofile%/foo/dev/cfgs/cfg --install & %userprofile%/foo/dev/cfgs/cmd_profile`

## Notes

Make sure to install non-games in their default locations.

Make sure you don't modify existing environment variables outside the `local_profile` file, or there may be unintended effects.

This setup works on modern systems. (Currently macOS and Windows.)

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

- Add an option for custom locations of `DEVDIR` and `MYDIR`.
