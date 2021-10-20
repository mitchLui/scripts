#!/bin/sh

echo "Switching to bash..."

chsh -s /bin/bash

echo "Setting up machine $HOSTNAME..."

echo "Installing Xcode developer tools..."

xcode-select --install

echo "Installing homebrew..."

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

echo "Upgrading bash..."

brew install bash

echo "Tapping into taps..."

brew tap homebrew/cask-drivers
brew tap ethereum/ethereum
brew tap qmk/qmk

echo "Installing packages..."

PACKAGES=(
    cask
    golang
    openjdk
    node
    tree
    wget
    htop
    neofetch
    docker
    kubectl
    minikube
    kind
    bash-completion
    ffmpeg
    vim
    git
    docui
    pyenv
    mysql
    cabal-install
    mas
    tmux
    micro
    mvn
    pypy
    pyenv-pip-migrate
    qmk
    ethereum
    solidity
)

brew install ${PACKAGES[@]}

echo "Installing Python..."

PYTHON_VER="3.9.7"

pyenv install $PYTHON_VER
pyenv global $PYTHON_VER

echo "Installing casks..."

CASKS=(
    ngrok
    vagrant
    caldigit-docking-utility
    logitech-options
    logitech-unifying
    aerial
    airbuddy
    airfoil
    alfred
    audio-hijack
    logitech-camera-settings
    cleanmymac
    coconutbattery
    coderunner
    daisydisk
    db-browser-for-sqlite
    discord
    docker
    downie
    endurance
    figma
    firefox
    folx
    imazing
    ledger-live
    loopback
    macs-fan-control
    microsoft-office
    microsoft-teams
    minecraft
    minecraft-server
    mysqlworkbench
    parallels
    permute
    postman
    qmk-toolbox
    safari-technology-preview
    sensei
    sf-symbols
    soulver
    soundsource
    steam
    terminus
    via
    virtualbox
    visual-studio-code
    wifi-explorer
    zoom
    etrecheckpro
    binance
)

brew install --cask ${CASKS[@]}

echo `"Cleaning up..."`

brew cleanup

echo `"Installing pip packages..."`

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

MAC_IDS=(
    497799835  #Xcode
    1278508951 #Trello
    430255202  #MacTracker
    572491815  #Textastic
    1493005285 #Logoist
    1435957248 #Drafts
    1449412482 #Reeder
    682658836  #Garageband
    1116599239 #NordVPN
    1276248849 #Diagrams
    1290358394 #Cardhop
    1147396723 #WhatsApp
    424389933  #Final Cut Pro
    577085396  #Unclutter
    993487541  #CARROT
    1019371109 #Balance Lock
    1224268771 #Screens
    1037126344 #Apple Configurator
    1289583905 #Pixelmator Pro
    1176895641 #Spark
    441258766  #Magnet
    425424353  #Unarchiver
    1482454543 #Twitter
    1478447657 #Geekbench
    409201541  #Pages
    1444383602 #GoodNotes
    747648890  #Telegram
    1120099014 #PDF Viewer
    640199958  #Developer
    639968404  #Parcel
    409203825  #Numbers
    461788075  #Movist
    409183694  #Keynote
    1018301773 #AdBlock Pro
    1516894961 #Codye
    1453295546 #Markdown Editor Pro
    1465439395 #Dark Noise
    1232603544 #HTTPBot
    1243219105 #F5 Access
)

mas install ${MAC_IDS[@]}

npm install -g @vue/cli

echo "Setting up ghc..."

export BOOTSTRAP_HASKELL_NONINTERACTIVE=1
export BOOTSTRAP_HASKELL_GHC_VERSION=9.0.1

curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh

echo "Setting up bash..."

cd

mkdir Local\ Documents

cat > .bash_profile <<- EOM
source ~/.bash_prompt
source ~/.aliases

export BASH_SILENCE_DEPRECATION_WARNING=1
export PATH="~/.local/bin"
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="/usr/local/opt/openjdk@11/bin:$PATH"
export NODE_ENV=development

export PYENV_ROOT="$HOME/.pyenv"

export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$PYENV_ROOT/shims:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
[[ -f ~/.bashrc ]] && source ~/.bashrc # ghcup-env
EOM

cat > .bash_prompt <<- EOM
#!/usr/bin/env bash

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

#TERMINAL PROMPT

PS1="\[\e[01;92m\]\u\[\e[m\]" #username
PS1+=" "
PS1+="\[\e[0;95m\]\W\[\e[m\]" #current directory
PS1+=" "
PS1+="$ "

export PS1;
EOM

. .bash_profile

#TODO SETUP SYSTEM PREFERENCES


