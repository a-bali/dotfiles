#!/bin/bash

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --key-bindings --completion --no-update-rc --no-zsh --no-fish

if command -v brew >/dev/null; then
  brew install bat exa fd tree bash-completion urlview
elif command -v apt >/dev/null; then
  sudo apt install bat exa fd-find tree bash-completion urlview
  mkdir -p ~/.local/bin
  ln -s $(which fdfind) ~/.local/bin/fd
  ln -s $(which batcat) ~/.local/bin/bat
fi

