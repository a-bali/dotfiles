#!/bin/bash

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --key-bindings --completion --no-update-rc --no-zsh --no-fish

if command -v brew >/dev/null; then
  brew install bat exa fd tree bash-completion
elif command -v apt >/dev/null; then
  apt install bat exa fd tree bash-completion
fi

