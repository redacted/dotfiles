## 
##  ZSH settings
## 

# no beeping
setopt nobeep nohistbeep nolistbeep

setopt appendhistory APPEND_HISTORY SHARE_HISTORY
setopt autocd 
setopt extendedglob

##
##  History settings - across shells
## 

# The file to save the history in when an interactive shell exits.
HISTFILE=${HOME}/.zsh_history

# The maximum number of events stored in the internal history list.
HISTSIZE=10000

# The maximum number of history events to save in the history file.
SAVEHIST=10000

# maximum size of the directory stack.
DIRSTACKSIZE=20


# term title
#case $TERM in
  #xterm*|rxvt)
      #precmd () { print -Pn "\e]0;%~\a" }
    #;;
#esac



