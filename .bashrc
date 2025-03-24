# Minimal .bashrc
export LANG="en_US.UTF-8"
export CLICOLOR=1

# Set colorful prompt
export PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "

# Ensure correct PATH
export PATH="$HOME/bin:/usr/local/bin:/usr/bin:/bin"

# Load custom aliases if available
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# CUSTOM COMMANDS
# ALIAS FILE IS IN ~/.bash_aliases
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
export BASHRC="$HOME/.bashrc"

# LOAD NVM (node version manager)
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# use NodeJS 22 by default
nvm use 22 > /dev/null
