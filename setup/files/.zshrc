export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
zstyle ':omz:update' mode disabled
DISABLE_MAGIC_FUNCTIONS="true"
COMPLETION_WAITING_DOTS="true"
plugins=(git command-not-found grc history tmux zsh-syntax-highlighting zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

# User config
export EDITOR='nano'
export PATH="$PATH:/root/.local/bin:/usr/share/doc/python3-impacket/examples/:$HOME/.local/bin"
export LANG="en_US.UTF-8" LANGUAGE="en_US:en" LC_ALL="en_US.UTF-8"
export DISPLAY="$DISPLAY"
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true'
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#222222,bg=#aaaaaa,bold,underline"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Aliases
alias ls='ls --color=yes'
alias unzip_seclists="tar xvf /usr/share/seclists.tar.lzma -C /usr/share"
