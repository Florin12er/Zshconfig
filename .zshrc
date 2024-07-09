#colorscript
#$HOME/.local/bin/colorscript -r

#neofetch
#fastfetch --load-config ~/.config/fastfetch/neofetch.jsonc

#cool neofetch
#fastfetch --load-config ~/.config/fastfetch/config.jsonc

#pokemons
#pokemon-colorscripts --no-title -r 1,3,6

#tree
#cbonsai -p 

# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#export EDITOR='nvim'
export TERM='kitty'
export TERMINAL='kitty'
export BROWSER='firefox'
export HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..)"
export HUGGING_FACE_HUB_TOKEN="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"
export HUGGINGFACE_API_KEY="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"

if [ -d "$HOME/.local/bin" ] ;
 then PATH="$HOME/.local/bin:$PATH"
fi

#  ┬  ┌─┐┌─┐┌┬┐  ┌─┐┌┐┌┌─┐┬┌┐┌┌─┐
#  │  │ │├─┤ ││  ├┤ ││││ ┬││││├┤ 
#  ┴─┘└─┘┴ ┴─┴┘  └─┘┘└┘└─┘┴┘└┘└─┘
[[ -s /home/florin/.autojump/etc/profile.d/autojump.sh ]] && source /home/florin/.autojump/etc/profile.d/autojump.sh

autoload -Uz add-zsh-hook
autoload -Uz vcs_info
precmd () { vcs_info }
_comp_options+=(globdots)

zstyle ':completion:*' verbose true
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS} 'ma=48;5;197;1'
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*:warnings' format "%B%F{red}No matches for:%f %F{magenta}%d%b"
zstyle ':completion:*:descriptions' format '%F{yellow}[-- %d --]%f'
zstyle ':vcs_info:*' formats ' %B%s-[%F{magenta}%f %F{yellow}%b%f]-'

#  ┬ ┬┌─┐┬┌┬┐┬┌┐┌┌─┐  ┌┬┐┌─┐┌┬┐┌─┐
#  │││├─┤│ │ │││││ ┬   │││ │ │ └─┐
#  └┴┘┴ ┴┴ ┴ ┴┘└┘└─┘  ─┴┘└─┘ ┴ └─┘
expand-or-complete-with-dots() {
  echo -n "\e[31m…\e[0m"
  zle expand-or-complete
  zle redisplay
}
zle -N expand-or-complete-with-dots
bindkey "^I" expand-or-complete-with-dots

#  ┬ ┬┬┌─┐┌┬┐┌─┐┬─┐┬ ┬
#  ├─┤│└─┐ │ │ │├┬┘└┬┘
#  ┴ ┴┴└─┘ ┴ └─┘┴└─ ┴ 
HISTFILE=~/.config/zsh/zhistory
HISTSIZE=5000
SAVEHIST=5000

#  ┌─┐┌─┐┬ ┬  ┌─┐┌─┐┌─┐┬    ┌─┐┌─┐┌┬┐┬┌─┐┌┐┌┌─┐
#  ┌─┘└─┐├─┤  │  │ ││ ││    │ │├─┘ │ ││ ││││└─┐
#  └─┘└─┘┴ ┴  └─┘└─┘└─┘┴─┘  └─┘┴   ┴ ┴└─┘┘└┘└─┘
setopt AUTOCD              # change directory just by typing its name
setopt PROMPT_SUBST        # enable command substitution in prompt
setopt MENU_COMPLETE       # Automatically highlight first element of completion menu
setopt LIST_PACKED		   # The completion menu takes less space.
setopt AUTO_LIST           # Automatically list choices on ambiguous completion.
setopt HIST_IGNORE_DUPS	   # Do not write events to history that are duplicates of previous events
setopt HIST_FIND_NO_DUPS   # When searching history don't display results already cycled through twice
setopt COMPLETE_IN_WORD    # Complete from both ends of a word.

#  ┌┬┐┬ ┬┌─┐  ┌─┐┬─┐┌─┐┌┬┐┌─┐┌┬┐
#   │ ├─┤├┤   ├─┘├┬┘│ ││││├─┘ │ 
#   ┴ ┴ ┴└─┘  ┴  ┴└─└─┘┴ ┴┴   ┴
# function dir_icon {
#   if [[ "$PWD" == "$HOME" ]]; then
#     echo "%B%F{cyan}%f%b"
#   else
#     echo "%B%F{cyan}%f%b"
#   fi
# }
#
# PS1='%B%F{blue}%f%b  %B%F{magenta}%n%f%b $(dir_icon)  %B%F{red}%~%f%b${vcs_info_msg_0_} %(?.%B%F{green}.%F{red})%f%b '

#
#  ┌─┐┬  ┬ ┬┌─┐┬┌┐┌┌─┐
#  ├─┘│  │ ││ ┬││││└─┐
#  ┴  ┴─┘└─┘└─┘┴┘└┘└─┘
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/powerlevel10k/powerlevel10k.zsh-theme
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/fzf-zsh-plugin/fzf-zsh-plugin.plugin.zsh
source /usr/share/zsh/plugins/zsh-you-should-use/you-should-use.plugin.zsh
source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

autoload -Uz compinit
autoload -U compinit && compinit -u
for dump in ~/.config/zsh/zcompdump(N.mh+24); do
  compinit -d ~/.config/zsh/zcompdump
done

compinit -C -d ~/.config/zsh/zcompdump


#  ┌─┐┬  ┬┌─┐┌─┐
#  ├─┤│  │├─┤└─┐
#  ┴ ┴┴─┘┴┴ ┴└─┘
alias mirrors="sudo reflector --verbose --latest 5 --country 'United States' --age 6 --sort rate --save /etc/pacman.d/mirrorlist"
alias neofetch="fastfetch"
alias doomfetch="fastfetch --load-config ~/.config/fastfetch/doom.jsonc"
alias emacs="emacsclient -c -a 'emacs'"
alias lf="lfrun"
alias add="git add"
alias commit="git commit"
alias note="nb"
alias push="git push"
alias pull="git pull"
alias status="git status"
alias config="git config"
alias remote="git remote add origin"
alias ai2="ollama run mistral"
alias ai="ollama run llama3"
alias iai="ollama run llama2-uncensored"
alias size="ls -lh --blocks=size"
alias grub-update="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias mantenimiento="yay -Sc && sudo pacman -Scc"
alias purga="sudo pacman -Rns $(pacman -Qtdq)"
alias update="paru -Syu"
alias matrix="cmatrix -u 9"
alias vm-on="sudo systemctl start libvirtd.service"
alias gorun="fresh"
alias vm-off="sudo systemctl stop libvirtd.service"
alias train="source /home/florin/scripts/train.sh"
alias say="cowsay"
alias sound="alsamixer"
alias vs="cava"
alias name="figlet"
alias rainbow="lolcat"
alias meow="nyancat"
alias joke="source /home/florin/scripts/joke.sh"
alias rjoke="source /home/florin/scripts/rainbowjoke.sh"
alias memory="sudo dust"

alias musica="ncmpcpp"
alias tree='tree -a -I .git'
alias lazy="lazygit"
alias browser="flatpak run io.gitlab.librewolf-community"
alias vim="nvim"
alias vm="nvim"
alias vi="/usr/bin/vim"
alias ivm="nvim"
alias nano="nvim"
alias cat="bat"
alias h="tldr"
alias file="nemo"
alias dfile="dolphin"

setopt glob_dots    # no special treatment for file names with a leading dot
setopt no_auto_menu # require an extra TAB press to open the completion menu

export PATH="$PATH:/home/florin/.cargo/bin"
export PATH="$PATH:/home/florin/repos/EDGE-classic"
export PATH="$PATH:/usr/bin/golangci-lint"
export PATH="$PATH:/home/florin/.dotnet/tools/csharp-ls"
export PATH="$PATH:/home/florin/.dotnet/tools"
export PATH="$PATH:/home/florin/.dotnet/tools/dotnet-csharpier"
export PATH="$PATH:/usr/bin/csharp-ls"
export PATH="$PATH:/usr/share/dotnet"
export PATH="$PATH:/usr/bin/mono"
export PATH="$PATH: /usr/bin/gdformat"
export PATH="$PATH: /usr/bin/gdlint"
export PATH="$HOME/.tmuxifier/bin:$PATH"
export PATH=$PATH:~/go/bin
export DOTNET_ROOT=$HOME/.dotnet
export PATH=/usr/bin:$PATH
eval "$(tmuxifier init -)"
export PATH="$PATH:/opt/flutter/bin"
export PATH="$HOME/bin:$PATH"
export PATH="$PATH:/usr/bin"
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:~/.config/emacs/bin
alias ls='lsd -a --group-directories-first'
alias ll='lsd -la --group-directories-first'
eval "$(atuin init zsh)"

export PATH=$PATH:/var/lib/snapd/snap/bin
alias sortty='python3 /usr/local/bin/sortty-bin/sortty.py'
eval "$(fzf --zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
