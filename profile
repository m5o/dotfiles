# See following for more information: http://www.infinitered.com/blog/?p=10

# Identify OS and Machine -----------------------------------------
export OS=`uname -s | sed -e 's/  */-/g;y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/'`
export OSVERSION=`uname -r`; OSVERSION=`expr "$OSVERSION" : '[^0-9]*\([0-9]*\.[0-9]*\)'`
export MACHINE=`uname -m | sed -e 's/  */-/g;y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/'`
export PLATFORM="$MACHINE-$OS-$OSVERSION"
# Note, default OS is assumed to be OSX



# Load in .bashrc and environment ---------------------------------
if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi



# Welcome Messsage ------------------------------------------------
echo -e "\033[0;32;40mKernel Information: " `uname -smr`
echo -e "\033[0;33;40m`bash --version`"
echo -ne "\033[0;37;40mUptime: "; uptime
echo -ne "\033[0;34;40mServer time is: "; date



# Notes: ----------------------------------------------------------
# When you start an interactive shell (log in, open terminal or iTerm in OS X, 
# or create a new tab in iTerm) the following files are read and run, in this order:
#     profile
#     bashrc
#     .bash_profile (.profile) ??
#     .bashrc (only because this file is run (sourced) in .bash_profile/.profile)
#
# When an interactive shell, that is not a login shell, is started 
# (when you run "bash" from inside a shell, or when you start a shell in 
# xwindows [xterm/gnome-terminal/etc] ) the following files are read and executed, 
# in this order:
#     bashrc
#     .bashrc