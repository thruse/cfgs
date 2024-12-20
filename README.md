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
* Add more non-dev programs to `cfg`
* Add more of my usual directories to `cfg` (forgot some)
* Add `.reg` files, specifically one to stop run as administrator confirmation prompt
* Add automatic execution of registry files into `cfg`
* Replicate `cfg` for unix
* Possible idea: in `cfg`, copies instead of symlinks?
