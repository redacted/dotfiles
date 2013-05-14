
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

fpath=($ZSH_HOME/completions $fpath)

export NODE_PATH=$NODE_PATH:/usr/local/lib/node

#export DYLD_FALLBACK_LIBRARY_PATH=$DYLD_FALLBACK_LIBRARY_PATH:/Users/steven/local/lib:/usr/local/cuda/lib:/usr/local/lib

export EVOLVERPATH=$HOME/Documents/Research/Evolver/fe:$HOME/Documents/Research/Evolver/doc
export PYTHONPATH=/usr/local/lib/python2.7/site-packages::~/local/python:$PYTHONPATH