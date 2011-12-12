#!/usr/bin/env python

import os
import os.path as path
import subprocess
import shlex
from argparse import ArgumentParser              

## Everything should work on *nix
## Tested on OS X only
## Requires access to git repos (https:// and git://)

## Configuration

SOURCE_ROOT = path.expandvars("$HOME/etc/")
TARGET_ROOT = path.expandvars("$HOME")

## Replace existing files?
FORCE_LINK = True

LINKS = {
        "git-files/gitconfig":".gitconfig",
        "git-files/gitignore":".gitignore",
        "vim":".vim",
        "vim/vimrc":".vimrc",
        "vim/gvimrc":".gvimrc",
        "zsh/oh-my-zsh":".oh-my-zsh",
        "zsh/zshrc":".zshrc",
        "ackrc":".ackrc",
        "ctags":".ctags",
        "irbrc":".irbrc",
        "screenrc":".screenrc",
        "tmux.conf":".tmux.conf",
        }


def do(string, desc=""):
    """ execute a string as a shell call """
    if len(desc) > 0: print(desc) 

    cmd = shlex.split(string)
    subprocess.call(cmd)


def cmd_line():
    parser = ArgumentParser()

    parser.add_argument("-l", "--link",
            action="store_true", 
            dest="link_all", 
            help="Link all required config files")
    parser.add_argument("-s", "--submodules", 
            action="store_true", 
            dest="submodules", 
            help="Install all git submodules" )
    parser.add_argument("-m", "--misc", 
            action="store_true", 
            dest="do_misc", 
            help="Miscellaneous tasks" )

    options = parser.parse_args() 

    if options.link_all: link_all()
    
    if options.submodules: do_submodules()

    if options.do_misc: misc()

    if not any(vars(options).values()):
        print("Try '-h' or '--help'")


def link(source, target):
    link_cmd = "ln -s {0} {1}".format(source, target)

    print("Linking {0} to {1}".format(source, target))

    if path.exists(target):
        if FORCE_LINK:
            os.remove(target)
            do(link_cmd)  
        else:
            print("Target for {0} exists, skipping".format(key))
    else:
        do(link_cmd)     


def misc():
    """ Hardcode specific setup steps here """
    ## Command-T
    print("-- Misc operations --")
    
    ## X11
    print("- Setting Xresources")
    os.chdir(SOURCE_ROOT)
    do("xrdb -merge Xresources")

    print("- Building Command-T extensions")
    os.chdir(path.join(SOURCE_ROOT, "vim/bundle/command-t/ruby/command-t"))
    do("ruby extconf.rb")
    do("make")

    ## Pyflakes
    print("- Getting pyflakes repo")
    os.chdir(path.join(SOURCE_ROOT, "vim/bundle/pyflakes-vim"))
    do("git submodule init")
    do("git submodule update")     


def link_all():
    """ Link the dotfiles to their correct locations """
    print("-- Linking --")
    for key in LINKS.keys():
        source = path.join(SOURCE_ROOT, key)
        target = path.join(TARGET_ROOT, LINKS[key]) 
        link(source, target)


def do_submodules():
    """ init submodules """
    start_dir = os.getcwd()
    os.chdir(SOURCE_ROOT)
    do("git submodule init", desc="-- Initializing git submodules --")
    do("git submodule update", "-- Cloning git submodules --")
    os.chdir(start_dir)


if __name__ == '__main__':
    cmd_line()
    

