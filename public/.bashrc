# WELCOME TO YOUR FIRST .bashrc!
# After you make changes, you'll have to run `source ~/.bashrc`
# in order to see them in your current shell.


# Case-insensitive `ls f*` (both "F" files and "f" files listed)
# If you want case-insensitive tab-completion, put
# `set completion-ignore-case on` in ~/.inputrc
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
# (lets you press the up arrow to see things you typed last week)
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Cycle through tab-complete name collisions rather than listing them
# (When you type 'Do' in ~ and hit Tab, it will first just complete
# 'Documents', then when you hit Tab again, it will complete 'Downloads')
bind '"\t":menu-complete'

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

# Make vim the default editor
export EDITOR="vim -f"
# make `man <whatever>` open in less; the -R makes less support color
export MANPAGER="less -R"
# Highlight section titles in manual pages
export LESS_TERMCAP_md="$ORANGE"

# Larger bash history (allow 32³ entries; default is 500)
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups
# Make some commands not show up in history, if you want
#export HISTIGNORE="cd:cd -:pwd;exit:date:* --help"


### Shortcuts ###
# Easier navigation: .., ..., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

# Shortcuts
alias g="git"
alias v="vim"

# List all files colorized in long format, including hidden files
alias ll='ls -alFGh'

# List only directories
alias lsd='ls -l | grep "^d"'

# Show directories with trailing slash when `ls`ing
alias ls='ls -p'

# Always use color output for `ls`
if [[ "$OSTYPE" =~ ^darwin ]]; then
  alias ls="command ls -G"
else
  alias ls="command ls --color"
	export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
fi



### Pretty Prompt! ###
# The Prompt is where you enter commands.
# By default, it shows your name and your current directory,
# but you can make it look however you want.
#
# This prompt requires a special font from
# https://github.com/Lokaltog/vim-powerline/wiki/Patched-fonts
# (I recommend Ubuntu Mono).
#
# Since it's ugly when you don't have that,
# it's been disabled by default.

# Make the terminal support more colors
if [[ $COLORTERM = gnome-* && $TERM = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
	export TERM=gnome-256color
elif infocmp xterm-256color >/dev/null 2>&1; then
	export TERM=xterm-256color
fi

## Color variables, so they're easier to use
# Reset
Reset='\[\e[0m\]'           # Text Reset

# Regular Colors
Black='\[\e[0;30m\]'        # Black
Red='\[\e[0;31m\]'          # Red
Green='\[\e[0;32m\]'        # Green
Yellow='\[\e[0;33m\]'       # Yellow
Blue='\[\e[0;34m\]'         # Blue
Purple='\[\e[0;35m\]'       # Purple
Cyan='\[\e[0;36m\]'         # Cyan
White='\[\e[0;37m\]'        # White

# Bold
BBlack='\[\e[1;30m\]'       # Black
BRed='\[\e[1;31m\]'         # Red
BGreen='\[\e[1;32m\]'       # Green
BYellow='\[\e[1;33m\]'      # Yellow
BBlue='\[\e[1;34m\]'        # Blue
BPurple='\[\e[1;35m\]'      # Purple
BCyan='\[\e[1;36m\]'        # Cyan
BWhite='\[\e[1;37m\]'       # White

# Underline
UBlack='\[\e[4;30m\]'       # Black
URed='\[\e[4;31m\]'         # Red
UGreen='\[\e[4;32m\]'       # Green
UYellow='\[\e[4;33m\]'      # Yellow
UBlue='\[\e[4;34m\]'        # Blue
UPurple='\[\e[4;35m\]'      # Purple
UCyan='\[\e[4;36m\]'        # Cyan
UWhite='\[\e[4;37m\]'       # White

# Background
On_Black='\[\e[40m\]'       # Black
On_Red='\[\e[41m\]'         # Red
On_Green='\[\e[42m\]'       # Green
On_Yellow='\[\e[43m\]'      # Yellow
On_Blue='\[\e[44m\]'        # Blue
On_Purple='\[\e[45m\]'      # Purple
On_Cyan='\[\e[46m\]'        # Cyan
On_White='\[\e[47m\]'       # White

# High Intensty
IBlack='\[\e[0;90m\]'       # Black
IRed='\[\e[0;91m\]'         # Red
IGreen='\[\e[0;92m\]'       # Green
IYellow='\[\e[0;93m\]'      # Yellow
IBlue='\[\e[0;94m\]'        # Blue
IPurple='\[\e[0;95m\]'      # Purple
ICyan='\[\e[0;96m\]'        # Cyan
IWhite='\[\e[0;97m\]'       # White

# Bold High Intensty
BIBlack='\[\e[1;90m\]'      # Black
BIRed='\[\e[1;91m\]'        # Red
BIGreen='\[\e[1;92m\]'      # Green
BIYellow='\[\e[1;93m\]'     # Yellow
BIBlue='\[\e[1;94m\]'       # Blue
BIPurple='\[\e[1;95m\]'     # Purple
BICyan='\[\e[1;96m\]'       # Cyan
BIWhite='\[\e[1;97m\]'      # White

# High Intensty backgrounds
On_IBlack='\[\e[0;100m\]'   # Black
On_IRed='\[\e[0;101m\]'     # Red
On_IGreen='\[\e[0;102m\]'   # Green
On_IYellow='\[\e[0;103m\]'  # Yellow
On_IBlue='\[\e[0;104m\]'    # Blue
On_IPurple='\[\e[10;95m\]'  # Purple
On_ICyan='\[\e[0;106m\]'    # Cyan
On_IWhite='\[\e[0;107m\]'   # White

# On a Mac with homebrew, you should `brew install git` to get this
# This will give errors if you don't have homebrew, so it's been
# commented out by default
#if [ -f `brew --prefix`/etc/bash_completion ]; then
  #source `brew --prefix`/etc/bash_completion

  #export GIT_PS1_SHOWDIRTYSTATE=1
  #export GIT_PS1_SHOWSTASHSTATE=1
  #export GIT_PS1_SHOWUNTRACKEDFILES=1
#else
  function parse_git_dirty() {
    [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo " * ⮁ "
  }
  function __git_ps1() {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
  }
#fi

# UNCOMMENT THE "PS1" LINE ONCE YOU HAVE A FONT FROM
# https://github.com/Lokaltog/vim-powerline/wiki/Patched-fonts

# And finally, ladies & gentleman, the prompt itself!
#PS1="${BIBlue}${On_Black} \W ${Black}⮀${Purple} \$(__git_ps1 %s' ⮁ ')${Reset}"

# For a pretty complete-looking list of what special characters you can use
# (like the "\W" above), check out
# http://linuxconfig.org/Bash_prompt_basics#3-bash-prompt-special-characters
