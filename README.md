# Configurations (cfgs)
## Steps for setting up on a new machine
* On macOS install Homebrew by running `bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`.
* Install Git.
* Decide what you want your directory to be. For the purposes of these instructions, let this directory be `~/foo`.
* Clone this repository into `~/foo/dev`. (Most important step.)
* Start a priviledged shell session.
* Run `~/foo/dev/cfgs/cfg --install ; . ~/.bash_profile` or `%userprofile%/foo/dev/cfgs/cfg --install & %userprofile%/foo/dev/cfgs/shin`

## Notes
Make sure to install non-games in their default locations.
This setup works on modern systems. (Currently macOS and Windows.)
Install things for the first time with `cfg`, but delete things manually to get `cfg` to reinstall them.
For more things to add (for example automation of macOS system settings) look at https://github.com/mathiasbynens/dotfiles and https://github.com/holman/dotfiles.
### Possibly useful things
* `powershell -c winget list ^| select-string winget` because `winget list --source winget` doesn't work
* `brew uninstall --zap formula-name` may fully uninstall all files related to `formula-name`.
* `winget export c:\path\to\packages.json --source winget --include-versions` to get installed `winget` stuff.
* `brew bundle dump --file=/path/to/Brewfile` to get installed `homebrew` stuff.

## Todo
* When I decide on some `pip` packages on `python`, include `requirements.txt` in the `cfg`. `pip freeze > requirements.txt`, `pip install --requirement /path/to/requirements.txt`
* Add more non-dev programs to `cfg` (Discord, Gimp, OBS, VLC, Kindle?, ...)
* Add more of my usual directories to `cfg` (forgot some)
* macOS settings (set text size?)
* Perhaps do more in PowerShell on Windows
* Add `shin` to my `bin` (think about this) (maybe not)
* AuCTeX/LaTeX workflow (see `$MYDIR/dev/tmp/auctex_test`)
* Linux support
* Possibly install a newer version of bash from homebrew. Don't see much point in this though.

