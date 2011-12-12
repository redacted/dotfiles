## 
##  Settings for TCD proxy
##
export PROXY_ENABLED=''

if [ $(uname) = Darwin ]; then
    # the proxy scripts require Mac-only features
    export PROXY_ENABLED=`ruby ~/etc/bin/proxy_enabled.rb` 
fi

alias socks-tunnel="ssh -D 9999 netsoc"
alias work-git="source ~/etc/bin/work" # need to set up a socks proxy localhost:9999 to work!

# if not zero length string
if [ ! -z $PROXY_ENABLED ]; then
    # script creates string of form user:pass@server:port
    export PROXY=`ruby ~/local/bin/proxy_getter.rb` 
    export HTTP_PROXY=$PROXY
    export HTTPS_PROXY=$PROXY
    export http_proxy=$PROXY
    export https_proxy=$PROXY
    work-git
fi      
