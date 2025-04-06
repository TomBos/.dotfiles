# === PC state commands ===
alias reboot='sudo systemctl reboot'                              # Gracefully reboot PC
alias shutdown='sudo systemctl poweroff'                          # Gracefully shutdown PC
alias uefi='systemctl reboot --firmware-setup'                    # Boot into UEFI 

# === Helpfull Shortcuts ===
alias lah='ls -lah'                                               # Ls shortcut
alias reload='clear && source $BASHRC'                            # Reload bashconfig 
alias ducks='sudo du -ah --max-depth=1 | sort -hr | head -n 11'   # List biggest files in current dir
alias cd..='cd ..'                                                # Gets rid of command not found
alias vim='nvim'                                                  # Redirect vim commands to neovim

# === Uncategorized ===
alias nano='$HOME/.dotfiles/.memes/activate-nano.sh'              # Display prank message

