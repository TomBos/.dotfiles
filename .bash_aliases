# == Enable color for ls and listing commands ==
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias la='ls -A --color=auto'  # Lists all except . and .. with colors
    alias ll='ls -l --color=auto'  # Long listing with colors
    alias l='ls -CF --color=auto'  # Compact listing with colors
fi


# == PC state commands ==
alias reboot='systemctl reboot'									# Gracefully reboot PC
alias shutdown='systemctl poweroff'								# Gracefully shutdown PC
alias uefi='systemctl reboot --firmware-setup'					# Boot into UEFI 


# == Helpfull Shortcuts ==
alias ll='ls -lah'												# Ls shortcut
alias reload='clear && source $BASHRC'							# Reload bashconfig 
alias ducks='sudo du -ahxd1 | sort -hr | head -n 11'			# List biggest files and directories in current dir
alias cd..='cd ..'												# Gets rid of command not found
alias mv='mv -i'												# Prevent overriding files without prompt
alias icat='kitten icat'										# View image using icat
alias copy='xclip -selection clipboard'							# Copy text into clipboard

# == Uncategorized ==
alias nano='$HOME/.dotfiles/.memes/activate-nano.sh'			# Display prank message


# == Disown App And Start It From Terminal ==
alias filezilla='nohup filezilla > /dev/null 2>&1 &'			# Start FileZilla in background without any output
alias firefox='nohup firefox -P > /dev/null 2>&1 &'				# Start Firerfox in background without any output
alias mullvad-vpn='nohup mullvad-vpn > /dev/null 2>&1 &'		# Start Mullvad in background without any output

