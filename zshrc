# load outside files
if [ -f ~/.bash/env ]; then
  . ~/.bash/env
fi

if [ -f ~/.bash/aliases ]; then
  . ~/.bash/aliases
fi

for file in $(ls ~/.zsh); do
  . ~/.zsh/$file
done

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
