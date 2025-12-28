# ===== os specific =====
case "$(uname)" in
  Darwin) /opt/homebrew/bin/fastfetch ;;
  Linux)  echo "Linux fastfetch add" ;; 
esac

# ===== base =====
export ZDOTDIR="$HOME"
export LANG=en_US.UTF-8

# ===== oh-my-zsh =====
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# ===== powerlevel10k =====
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# ===== common =====
source ~/.zshrc.common

# ===== os specific =====
case "$(uname)" in
  Darwin) source ~/.zshrc.mac ;;
  Linux)  source ~/.zshrc.linux ;;
esac


