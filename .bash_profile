if [ -f ~/.profile ]; then
 source ~/.profile
fi

if [ -f ~/.bashrc ]; then
 source ~/.bashrc
fi


# Added by OrbStack: command-line tools and integration
# Comment this line if you don't want it to be added again.
source ~/.orbstack/shell/init.bash 2>/dev/null || :
