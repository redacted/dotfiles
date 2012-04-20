##
##  Set paths correctly
##

path=(
~/.rbenv/shims
/usr/local/bin 
/usr/local/sbin
~/local/bin
~/etc/bin
~/.cljr/bin
/Applications/Grace.app/Contents/Resources/grace/bin
#/Applications/Octave.app/Contents/Resources/bin/
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

export DYLD_FALLBACK_LIBRARY_PATH=$DYLD_FALLBACK_LIBRARY_PATH:/Users/steven/local/lib:/usr/local/cuda/lib

export EVOLVERPATH=$HOME/Documents/Research/Evolver/fe:$HOME/Documents/Research/Evolver/doc  

export PYTHONPATH=/usr/local/lib/python:~/local/python:$PYTHONPATH
