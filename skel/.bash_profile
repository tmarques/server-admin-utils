# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# sudoedit VIM
EDITOR=vim
VISUAL=$EDITOR
export EDITOR VISUAL
