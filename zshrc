# Path to your oh-my-zsh configuration.
ZSH=$HOME/etc/zsh/oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"
DEFAULT_USER=$(whoami)
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew cp extract osx pip python battery)

source $ZSH/oh-my-zsh.sh


##############################################
# Above: oh-my-zsh
# Below: My configs
##############################################

##
##  Set paths correctly
##

path=(
/usr/local/bin 
/usr/local/sbin
~/local/bin
~/etc/bin
~/local/sbin
/usr/local/sbin
/usr/local/share/python
/usr/local/cuda/bin
/usr/X11/bin
/usr/bin 
/usr/sbin
/usr/texbin
/bin 
/sbin
$PATH
) 

manpath=( 
$MANPATH
/usr/man 
/usr/share/man 
/usr/local/man 
/usr/local/git/man
~/local/man/man1
)

#cdpath=( $cdpath ~ ..  /) 

# remove duplicate entries from path,cdpath,manpath & fpath
typeset -U path cdpath manpath fpath

# other paths
export NODE_PATH=$NODE_PATH:/usr/local/lib/node

#export DYLD_FALLBACK_LIBRARY_PATH=$DYLD_FALLBACK_LIBRARY_PATH:/Users/steven/local/lib:/usr/local/cuda/lib:/usr/local/lib

export EVOLVERPATH=$HOME/Documents/Research/Evolver/fe:$HOME/Documents/Research/Evolver/doc  

export PYTHONPATH=/usr/local/lib/python:~/local/python:$PYTHONPATH    

setopt PROMPT_SUBST
export RPS1='$(battery_pct_prompt)'

# z
. `brew --prefix`/etc/profile.d/z.sh

# grc
source "`brew --prefix`/etc/grc.bashrc"
GRC=`which grc`
if [ "$TERM" != dumb ] && [ -n GRC ]
then
    alias colourify="$GRC -es --colour=auto"
    alias configure='colourify ./configure'
    alias diff='colourify diff'
    alias make='colourify make'
    alias gcc='colourify gcc'
    alias g++='colourify g++'
    alias as='colourify as'
    alias gas='colourify gas'
    alias ld='colourify ld'
    alias netstat='colourify netstat'
    alias ping='colourify ping'
    alias traceroute='colourify /usr/sbin/traceroute'
fi                  


## Aliases
#
alias backup_nexus="adb backup -f Nexus4.ab -apk -shared -all -nosystem"
alias backup_nexus_sdcard="adb pull /sdcard/"

alias mmv="noglob zmv -W" # change extension

# vim muscle memory
alias :q=exit
alias :e='vim'
alias gvim='open -a MacVim '

alias clj='rlwrap clj'
alias foam_tunnel='ssh -f -N -L 2222:www.tcd.ie:22 netsoc'
alias evolver='rlwrap evolver'
alias evolver_orig='~/local/bin/evolver'            

# sorted du
alias du_sort="du | sort -nr | cut -f2- | xargs du -hs"           

# remote commands
alias check_cluster="ssh tchpc slurm_report.py"

# octave
alias octave_launch="exec '/Applications/Octave.app/Contents/Resources/bin/octave'"      

## Exports
export EDITOR=/usr/local/bin/vim      

## Clojure settings
export CLASSPATH=$CLASSPATH:/usr/local/Cellar/clojure-contrib/1.2.0/clojure-contrib.jar 
export JAVA_OPTS='-Xms512m -Xmx2048m -server'

for dir_ in  $HOME/local/java/jars_dir $HOME/.cljr/lib 
do
    if [ -d $dir_ ]; then
        export CLASSPATH=$CLASSPATH:$dir_/'*'
    fi
done      

alias socks-tunnel="ssh -D 9999 netsoc"
alias work-git="source ~/etc/bin/work" # need to set up a socks proxy localhost:9999 to work!       

## Functions
#
quit () {
        for app in $*; do
                osascript -e 'quit app "'$app'"'
        done
}

relaunch () {
        for app in $*; do
                osascript -e 'quit app "'$app'"';
                open -a $app
        done
}

# display processes tree in less
pst ()
{ 
    local pid
    pid=$(ps -ax | grep $1 | grep -v grep | awk '{ print $1 }')
    pstree -p $pid  | less -S 
}

# search for various types or README file in dir and display them in $PAGER
readme ()
{
    local files
    files=(./(#i)*(read*me|lue*m(in|)ut)*(ND))
    if (($#files))
    then $EDITOR $files
    else
        print 'No README files.'
    fi
}      
