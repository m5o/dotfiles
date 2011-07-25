# Colors ----------------------------------------------------------
export TERM=xterm-color
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export CLICOLOR=1


# Setup some colors to use later in interactive shell or scripts
# Make sure you understand how to use \[ and \] correctly in your PS1 string 
# so that bash knows how long your prompt-string actually renders on screen. 
# This is so it can redraw your command-line correctly when you move beyond a single line command.
export COLOR_NC='\[\033[0m\]' # No Color
export COLOR_WHITE='\[\033[1;37m\]'
export COLOR_BLACK='\[\033[0;30m\]'
export COLOR_BLUE='\[\033[0;34m\]'
export COLOR_LIGHT_BLUE='\[\033[1;34m\]'
export COLOR_GREEN='\[\033[0;32m\]'
export COLOR_LIGHT_GREEN='\[\033[1;32m\]'
export COLOR_CYAN='\[\033[0;36m\]'
export COLOR_LIGHT_CYAN='\[\033[1;36m\]'
export COLOR_RED='\[\033[0;31m\]'
export COLOR_LIGHT_RED='\[\033[1;31m\]'
export COLOR_PURPLE='\[\033[0;35m\]'
export COLOR_LIGHT_PURPLE='\[\033[1;35m\]'
export COLOR_BROWN='\[\033[0;33m\]'
export COLOR_YELLOW='\[\033[1;33m\]'
export COLOR_GRAY='\[\033[1;30m\]'
export COLOR_LIGHT_GRAY='\[\033[0;37m\]'
alias colors_env="set | egrep 'COLOR_\w*'"  # lists all the colors



# Bring in the other files ----------------------------------------------------

if [ -z "$PS1" ]; then # If runnign interactively
  export PATH=/usr/local/bin:/usr/local/sbin:$PATH
fi

for file in $(ls ~/.bash); do
  source ~/.bash/$file
done

