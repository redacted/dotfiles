ZSH_HOME=$HOME/etc/zsh

source $ZSH_HOME/antigen/antigen.zsh

antigen use oh-my-zsh

DEFAULT_USER=$(whoami)

antigen theme $ZSH_HOME/redacted-mh.zsh-theme

antigen bundles <<EOBUNDLES
    git
    brew
    extract
    battery
    tmuxinator

    zsh-users/zsh-syntax-highlighting
    zsh-users/zsh-history-substring-search
    zsh-users/zsh-completions
EOBUNDLES

antigen apply

##############################################

## Zsh options
setopt PROMPT_SUBST
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_ALL_DUPS
COMPLETION_WAITING_DOTS=true

autoload -U zmv

##  Set paths correctly

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
/usr/local/share/man
/usr/local/git/man
~/local/man/
)

#cdpath=( $cdpath ~ ..  /)

# remove duplicate entries from path,cdpath,manpath & fpath
typeset -U path cdpath manpath fpath

# other paths
export NODE_PATH=$NODE_PATH:/usr/local/lib/node

#export DYLD_FALLBACK_LIBRARY_PATH=$DYLD_FALLBACK_LIBRARY_PATH:/Users/steven/local/lib:/usr/local/cuda/lib:/usr/local/lib

export EVOLVERPATH=$HOME/Documents/Research/Evolver/fe:$HOME/Documents/Research/Evolver/doc
export PYTHONPATH=/usr/local/lib/python2.7/site-packages::~/local/python:$PYTHONPATH

export RPS1='$(battery_pct_prompt)'
export RPROMPT='$(battery_pct_prompt)''$(git_prompt_info)'


# z
. `brew --prefix`/etc/profile.d/z.sh

# tmuxinator
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator
export SHELL=zsh

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
alias mmv="noglob zmv -W" # change extension

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
# export CLASSPATH=$CLASSPATH:/usr/local/Cellar/clojure-contrib/1.2.0/clojure-contrib.jar
# export JAVA_OPTS='-Xms512m -Xmx2048m -server'
#
# for dir_ in  $HOME/local/java/jars_dir $HOME/.cljr/lib
# do
#     if [ -d $dir_ ]; then
#         export CLASSPATH=$CLASSPATH:$dir_/'*'
#     fi
# done

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

# man pages in preview
function man-preview() {
  man -t "$@" | open -f -a Preview
}
# use google translate + mplayer to say things
say_google ()
{
    if [[ "${1}" =~ -[a-z]{2} ]]
    then
        local lang=${1#-};
        local text="${*#$1}";
    else local lang=${LANG%_*};
        local text="$*";
    fi;
    mplayer "http://translate.google.com/translate_tts?ie=UTF-8&tl=${lang}&q=${text}" &> /dev/null ;
}
