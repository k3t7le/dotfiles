# ===== OS specific =====
case "$(uname)" in
  Darwin)
    # macOS: Homebrew 환경 먼저 적용
    if [[ -x "/opt/homebrew/bin/brew" ]]; then
      eval "$(/opt/homebrew/bin/brew shellenv)"
    fi

    # 이후 macOS 전용 명령
    fastfetch
    ;;
  Linux)
    # Linux: Homebrew 환경 먼저 적용
    if [[ -x "/home/linuxbrew/.linuxbrew/bin/brew" ]]; then
      eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    fi

    # 이후 Linux 전용 명령
    fastfetch
    ;;
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


