# === PC state commands ===
alias reboot='sudo systemctl reboot'                              # Gracefully reboot PC
alias shutdown='sudo systemctl poweroff'                          # Gracefully shutdown PC
alias uefi='systemctl reboot --firmware-setup'                    # Boot into UEFI 

# === Helpfull Shortcuts ===
alias ll='ls -lah'                                                # Ls shortcut
alias reload='clear && source $BASHRC'                            # Reload bashconfig 
alias ducks='sudo du -ah --max-depth=1 | sort -hr | head -n 11'   # List biggest files in current dir
alias cd..='cd ..'                                                # Gets rid of command not found
alias vim='nvim'                                                  # Redirect vim commands to neovim

# === Uncategorized ===
alias nano='$HOME/.dotfiles/.memes/activate-nano.sh'              # Display prank message
alias icat='kitten icat'                                          # Preview images inside terminal


# === Disown App And Start It From Terminal ===
alias phpstorm='nohup phpstorm > /dev/null 2>&1 &'                # Start PHPStorm in background without any output
alias filezilla='nohup filezilla > /dev/null 2>&1 &'              # Start FileZilla in background without any output
alias thunderbird='nohup thunderbird -P > /dev/null 2>&1 &'       # Start Thunderbird in background without any output
