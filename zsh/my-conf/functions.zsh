##
##  Functions
##

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

# open man pages in Preview.app
pman () {
    man -t "${1}" | open -f -a /Applications/Preview.app
}



## get examples for a command from cmdfu
function cmdfu() {
    curl "http://www.commandlinefu.com/commands/matching/$@/$(echo -n $@ | openssl base64)/plaintext" --silent 
}

