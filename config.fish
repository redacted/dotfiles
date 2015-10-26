# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Path to your custom folder (default path is ~/.oh-my-fish/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

# Custom plugins and themes may be added to ~/.oh-my-fish/custom
# Plugins and themes can be found at https://github.com/oh-my-fish/
Theme 'robbyrussell'
Theme 'fox'

Plugin 'theme'
Plugin 'emacs'
Plugin 'brew'
Plugin 'extract'
Plugin 'osx'
Plugin 'z'

set fish_plugins emacs theme brew extract osx z

source ~/.env.secure

export GOPATH=$HOME/go
set PATH $GOPATH/bin $PATH

alias psql_tunnel='ssh -N -L 5433:ds-advertising.ckr1zpkxvsg6.eu-west-1.rds.amazonaws.com:5432 ads_marketing'
