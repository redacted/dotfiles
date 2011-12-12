##
##  Aliases 
##

alias mmv="noglob zmv -W" # change extension

# vim muscle memory
alias :q=exit
alias :e='vim'
alias gvim='open -a MacVim '

alias clj='rlwrap clj'
alias foam_tunnel='ssh -f -N -L 2222:www.tcd.ie:22 netsoc'
alias evolver='rlwrap evolver'
alias evolver_orig='~/local/bin/evolver'


alias l='ls'
alias ll='ls -AlhGrti'
alias la='ls -a'

alias lsa='ls -d .*' ## list only file beginning with "."
alias lsd='ls -d */' ## list only dirs

alias bd="popd"
alias back='cd "$OLDPWD";pwd  '

alias dirs='dirs -v'

# screen
alias resume="tmux attach"


# sorted du
alias du_sort="du | sort -nr | cut -f2- | xargs du -hs"  

# Nailgun for Clojure dev
alias ng-start="java vimclojure.nailgun.NGServer 127.0.0.1"
alias ng-stop="ng ng-stop"   

# pip outdated
alias pip-outdated="pip freeze | cut -d = -f 1 | xargs -n 1 pip search | grep -B2 'LATEST:'"

# remote commands
alias check_cluster="ssh tchpc slurm_report.py"

# octave
alias octave_launch="exec '/Applications/Octave.app/Contents/Resources/bin/octave'"
