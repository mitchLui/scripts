#!/bin/sh

echo "Switching to bash..."

chsh -s /bin/bash

echo "Setting up machine $HOSTNAME..."

echo "Installing Xcode developer tools"

xcode-select --install

echo "Installing homebrew"

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

echo "Upgrading bash..."

brew install bash
exec bash

echo "Tapping into taps..."

TAPS=(
    homebrew/cask-version
    skanehira/docui
)

brew tap ${TAPS[@]}

echo "Installing packages..."

PACKAGES=(
    cask
    python
    golang
    openjdk
    node
    tree
    wget
    htop
    neofetch
    docker
    kubectl
    kind
    bash-completion
    ffmpeg
    vim
    git
    pyenv
    youtube-dl
    mysql
    ghc
    cabal-install
)

brew install ${PACKAGES[@]}

echo "Installing casks..."

CASKS=(
    ngrok
    safari-technology-preview
    microsoft-edge
    minikube
    docker
    visual-studio-code
    postman
    mysqlworkbench
    terminus
    virtualbox
    vagrant
)

brew install --cask ${CASKS[@]}

echo "Cleaning up..."

brew cleanup

echo "Installing pip packages..."

PIP_PACKAGES=(
    pre-commit
    requests
    flask
    flask_cors
    fbmessenger
    six
    gspread
    oauth2client
    urllib3
    pandas
    numpy
    bs4
    python-dotenv
    pymysql
    lxml
    mutagen
    loguru
    flake8
    scipy
    fastapi
    uvicorn
)

pip3 install ${PIP_PACKAGES[@]}

