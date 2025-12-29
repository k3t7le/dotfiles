# dotfiles (stow-based)

macOS / Linux 공용 개발 환경 설정(dotfiles) 저장소  
GNU Stow 기반 심볼릭 링크 방식으로 관리한다.

---

## 구성 요소

- zsh
- oh-my-zsh (custom 위주)
- powerlevel10k
- fzf
- neovim
- ghostty

---

## 디렉토리 구조

```text
dotfiles
├── zsh
│   ├── .zshrc
│   ├── .zshrc.common
│   ├── .zshrc.mac
│   ├── .zshrc.linux
│
├── p10k
│   └── .p10k.zsh
│
├── nvim
│   └── .config
│       └── nvim
│
├── fzf
│   └── .fzf.zsh
│
```

---

## 사전 요구 사항

### macOS

```bash
brew install stow git fzf neovim
```

### Linux (Ubuntu 기준)

```bash
sudo apt install -y stow git fzf neovim
```

---

## 최초 설치 (새 PC / 재설치 후)

### 1. 저장소 클론

```bash
git clone git@github.com:USER/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

---

### 2. Oh-My-Zsh 설치 (필수)

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

> `.oh-my-zsh` 디렉토리는 설치형으로 유지  
> custom 설정만 dotfiles에서 관리

---

### 3. Stow 적용

```bash
stow zsh
stow p10k
stow nvim
stow fzf
stow ghostty
```

---

### 4. SSH 키 설정 (GitHub)

```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```

공개키 등록:
```bash
cat ~/.ssh/id_ed25519.pub
```

GitHub → Settings → SSH and GPG keys → Add SSH key

확인:
```bash
ssh -T git@github.com
```

---

## OS 분기 구조

`.zshrc`에서 자동 분기 처리됨

```zsh
case "$(uname)" in
  Darwin) source ~/.zshrc.mac ;;
  Linux)  source ~/.zshrc.linux ;;
esac
```

---

## Neovim + fzf

- `<leader>f` : 파일 검색
- `<leader>g` : ripgrep
- `<leader>b` : 버퍼 목록

---

## 업데이트 방법

```bash
cd ~/dotfiles
git pull
stow zsh p10k nvim fzf git
```

---

## 제거 방법

```bash
cd ~/dotfiles
stow -D zsh
stow -D p10k
stow -D nvim
stow -D fzf
stow -D ghostty
```

---

## License

Personal use
