if [ -f ~/.env ]; then
  source ~/.env
fi

if [ -f ~/.aliases ]; then
  source ~/.aliases
fi

for file in $(ls ~/.bash); do
  source ~/.bash/$file
done

# Bring in the other files ----------------------------------------------------
if [ -f ~/.bashrc_help ]; then
  source ~/.bashrc_help
fi

if [ -f ~/.bashrc_app_specific ]; then
  source ~/.bashrc_app_specific
fi