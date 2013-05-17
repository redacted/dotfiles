# grc
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

alias socks-tunnel="ssh -D 9999 netsoc"
alias work-git="source ~/etc/bin/work" # need to set up a socks proxy localhost:9999 to work!

alias lsa='ls -lah'
#alias l='ls -la'
alias ll='ls -l'
alias la='ls -lA'
alias sl=ls # often screw this up

# Will cd into the top of the current repository
# or submodule.
alias grt='cd $(git rev-parse --show-toplevel || echo ".")'

# fasd
# jump to recently used items
alias a='fasd -a' # any
alias s='fasd -si' # show / search / select
alias d='fasd -d' # directory
alias f='fasd -f' # file
alias z='fasd_cd -d' # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # interactive directory jump
alias fst='fasd -a -e "subl -n"'
alias o='a-e open'
