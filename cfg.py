import os
import shutil
import subprocess
import sys

def initialise_script(base_name, extension, source_dir, destination_dir, from_python=False, header=""):
    source_path = os.path.join(source_dir, base_name+".py") if from_python else os.path.join(source_dir, base_name+extension)
    print("source_path:", source_path)
    destination_path = os.path.join(destination_dir, base_name+extension)

    if from_python:
        with open(destination_path, "w") as f:
            if header != "":
                f.write(header+"\n")
            f.write("python"+" "+source_path+"\n")
    else:
        shutil.copyfile(source_path, destination_path)

    if os.name == "posix":
        subprocess.run(["chmod", "+x", destination_path])

def get_dirs(file_path):
    with open(file_path, "r") as f:
        return [line.strip() for line in f if line.strip()]

def os_format_env_string(file_path):
    if os.name == "nt":
        return file_path.rstrip(os.sep)
    elif os.name == "posix":
        return "\""+file_path.rstrip(os.sep)+"\""

def main():
    # get relevant directories
    cfgs_dir = os.path.dirname(os.path.abspath(__file__))
    dev_dir = os.path.dirname(cfgs_dir)
    my_dir = os.path.dirname(dev_dir)
    home_dir = os.path.expanduser("~")
    bin_dir = os.path.join(dev_dir, "bin")

    # define platform-specific properties
    if os.name == "nt":
        header = "@echo off"
        global_set = "set"
        init_script_name = "shin.bat"
        extension = ".bat"
        nvim_dir = os.path.join(home_dir, "AppData", "Local", "nvim")
        emacs_dir = os.path.join(home_dir, "AppData", "Roaming", ".emacs.d")
        path_and_sep = ";%PATH%"
    elif os.name == "posix":
        header = "#!/usr/bin/env bash"
        global_set = "export"
        init_script_name = ".bash_profile"
        extension = ""
        nvim_dir = os.path.join(home_dir, ".config", "nvim")
        emacs_dir = os.path.join(home_dir, ".emacs.d")
        path_and_sep = ":$PATH"

    # create shell init file and add directory variables
    with open(os.path.join(cfgs_dir, init_script_name), "w") as f:
        f.write(header+"\n")
        f.write(global_set+" "+"MYDIR="+os_format_env_string(my_dir)+"\n")
        f.write(global_set+" "+"DEVDIR="+os_format_env_string(dev_dir)+"\n")
        f.write(global_set+" "+"CFGSDIR="+os_format_env_string(cfgs_dir)+"\n")
        f.write("cd"+" "+"\""+dev_dir+"\"\n")
        if sys.platform == "darwin":
            f.write("eval \"$(/opt/homebrew/bin/brew shellenv)\"\n")
        f.write(global_set+" "+"PATH="+os_format_env_string(bin_dir+path_and_sep)+"\n")


    # get subdirectories names
    my_dirs = get_dirs(os.path.join(cfgs_dir, "my_dirs.txt"))
    dev_dirs = get_dirs(os.path.join(cfgs_dir, "dev_dirs.txt"))

    # create subdirectories
    for dir in my_dirs:
        os.makedirs(os.path.join(my_dir, dir), exist_ok=True)
    for dir in dev_dirs:
        os.makedirs(os.path.join(dev_dir, dir), exist_ok=True)

    # create or copy files
    initialise_script("vscin", extension, cfgs_dir, bin_dir, from_python=True, header=header)
    initialise_script("venvin", extension, cfgs_dir, bin_dir)
    if os.name == "posix":
        initialise_script("runemacs", extension, cfgs_dir, bin_dir)
    initialise_script("juplab", extension, cfgs_dir, bin_dir)

    # modify command prompt on windows
    if os.name == "nt":
        subprocess.run(["powershell", "-noprofile", "-file", os.path.join(cfgs_dir, "cmd_cfg.ps1")])

    # set up neovim
    os.makedirs(nvim_dir, exist_ok=True)
    shutil.copyfile(os.path.join(cfgs_dir, "init.vim"), os.path.join(nvim_dir, "init.vim"))

    # set up emacs
    os.makedirs(os.path.join(emacs_dir, "backups"), exist_ok=True)
    os.makedirs(os.path.join(emacs_dir, "autosaves"), exist_ok=True)
    with open(os.path.join(emacs_dir, "custom.el"), "w") as f:
        pass
    shutil.copyfile(os.path.join(cfgs_dir, "init.el"), os.path.join(emacs_dir, "init.el"))

    # set up git
    shutil.copyfile(os.path.join(cfgs_dir, ".gitconfig"), os.path.join(home_dir, ".gitconfig"))

    # set up music
    shutil.rmtree(os.path.join(home_dir, "Music", "my_music"), ignore_errors=True)
    shutil.copytree(os.path.join(my_dir, "g", "music"), os.path.join(home_dir, "Music", "my_music"))

    # set up bash profile
    if os.name == "posix":
        shutil.copyfile(os.path.join(cfgs_dir, init_script_name), os.path.join(home_dir, init_script_name))

if __name__ == "__main__":
    main()
