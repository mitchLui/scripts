#!/bin/sh

echo "Setting up machine $HOSTNAME..."

echo "Installing Rosetta 2..."

/usr/sbin/softwareupdate --install-rosetta --agree-to-license

echo "Installing Xcode developer tools..."

xcode-select --install

echo "Installing homebrew..."

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew bundle

echo "Installing Python..."

PYTHON_VER="3.10.6"

pyenv install $PYTHON_VER
pyenv global $PYTHON_VER

brew cleanup

echo `"Installing pip packages..."`

PIP_PACKAGES=(
    pre-commit
    requests
    flask
    flask_cors
    six
    gspread
    oauth2client
    urllib3
    pandas
    numpy
    bs4
    python-dotenv
    pymysql
    dearpygui
    lxml
    mutagen
    loguru
    flake8
    scipy
    fastapi
    uvicorn
    pytest
    black
    matplotlib
    sqlmodel
)

pip3 install ${PIP_PACKAGES[@]}

echo "Setting up ghc..."

export BOOTSTRAP_HASKELL_NONINTERACTIVE=1
export BOOTSTRAP_HASKELL_GHC_VERSION=9.0.1

curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh

echo "Setting up bash..."

cd

mkdir Local\ Documents

cat > .zshrc <<- EOM
PROMPT='%F{22}%B%n%b%f %F{92}%1~%f $ '

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias doc="cd ~/Documents"
alias ld="cd ~/Local\ Documents/"
alias proj="cd ~/projects"

autoload -U compinit && compinit
zmodload -i zsh/complist
EOM




