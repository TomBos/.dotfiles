# Minimal .bashrc
export LANG="en_US.UTF-8"
export CLICOLOR=1


# Start sway on TTY1
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ];then
  startx
fi


# Set colorful prompt
# Account names → red
# Hostname → green
# Directories → blue
export PS1='\[\033[01;31m\]\u\[\033[00m\]@\[\033[01;32m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '


# Ensure correct PATH
export PATH="$HOME/bin:/usr/local/bin:/usr/bin:/bin"


# Enable color for ls and listing commands
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias la='ls -A --color=auto'  # Lists all except . and .. with colors
    alias ll='ls -l --color=auto'  # Long listing with colors
    alias l='ls -CF --color=auto'  # Compact listing with colors
fi


# Load custom aliases if available
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


# Enable Bash autocompletion support
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi


# Load custom bash functions
if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi


# Load Custom exports and paths
if [ -d ~/.exports ]; then
   for file in ~/.exports/*; do
     if [ -f "$file" ]; then
        source "$file"     
     fi
   done 
fi


# Display Fast Fetch
if command -v fastfetch &>/dev/null; then
  # Load Fast Fetch with logo
  fastfetch --my-config
else
  echo -e "Fastfetch is not available."
fi

