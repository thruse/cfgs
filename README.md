# Configurations (cfgs)
## Steps for setting up on a new machine
* On macOS install Homebrew by running `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`.
* Install Git.
* Decide what you want your directory to be. For the purposes of these instructions, let this directory be `~/foo`.
* Clone this repository into `~/foo/dev`. (Most important step.)
* Start a priviledged shell session.
* Run `~/foo/dev/cfgs/cfg`.

## Notes
Make sure the drive Windows is installed on is the C: drive and generally install non-games in their default locations.
This setup works on modern systems.
Install things for the first time with `cfg`, but delete things manually to get `cfg` to reinstall them.

## Todo
* Install vscode extensions on Windows `code --install-extension "ms-vscode.cpptools"` etc.
* Configure python venv
* Configure and install python on Windows
* Add more non-dev programs to `cfg` (Discord, Gimp, OBS, VLC, Kindle?, ...)
* Winget GIMP: check for gimp directory before installing (don't know the path to gimp, probably c:\program files\gimp) check when home. Similar to emacs winget cant detect that it's not installed I think (check this too with winget list)
* Add more of my usual directories to `cfg` (forgot some)
* macOS settings (set text size?)
* Check if `echo @echo off>%userprofile%\set_mydir.bat` works properly
* Uninstall things that aren't already on Brew on macOS (Spotify, Discord, Gimp, Chrome, OBS) and install through brew (add to Brewfile)
* Perhaps do more in PowerShell on Windows
* Possily remove dependency on having `c:` be the system drive (by using `%windir%`, `%programfiles%`, ...)
