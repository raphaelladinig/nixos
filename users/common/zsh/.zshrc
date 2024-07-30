# setup completions
autoload -U compinit && compinit

# plugins
if [[ -f "$HOME/.zsh/plugins/zsh-fast-syntax-highlighting/share/zsh/site-functions/fast-syntax-highlighting.plugin.zsh" ]]; then
  source "$HOME/.zsh/plugins/zsh-fast-syntax-highlighting/share/zsh/site-functions/fast-syntax-highlighting.plugin.zsh"
fi
if [[ -f "$HOME/.zsh/plugins/zsh-autosuggestions/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]]; then
  source "$HOME/.zsh/plugins/zsh-autosuggestions/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi
if [[ -f "$HOME/.zsh/plugins/zsh-fzf-tab/share/fzf-tab/fzf-tab.plugin.zsh" ]]; then
  source "$HOME/.zsh/plugins/zsh-fzf-tab/share/fzf-tab/fzf-tab.plugin.zsh"
fi

# starship
eval "$(starship init zsh)"

# history
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# shell integrations
source <(fzf --zsh)
eval "$(zoxide init zsh)"

# aliases
alias v="nvim"
alias g="lazygit"

# yazi
function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
