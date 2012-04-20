##
##  Environment variables
##

export EDITOR=/usr/local/bin/vim

# building with new xcode
export ARCHFLAGS="-arch x86_64"

# oh-my-zsh auto updates unnecessary 
export DISABLE_AUTO_UPDATE="true"   
unset GREP_OPTIONS          # issues with cmake if set         

## Clojure settings
export CLASSPATH=$CLASSPATH:/usr/local/Cellar/clojure-contrib/1.2.0/clojure-contrib.jar
export JAVA_OPTS='-Xms512m -Xmx2048m -server'

for dir_ in  $HOME/local/java/jars_dir $HOME/.cljr/lib 
do
    if [ -d $dir_ ]; then
        export CLASSPATH=$CLASSPATH:$dir_/'*'
    fi
done   

## rbenv
#eval "$(rbenv init -)"
