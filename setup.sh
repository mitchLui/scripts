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

TAPS=(
    homebrew/cask-drivers
)

brew tap ${TAPS[@]}

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
    ghc
    cabal-install
    mas
    tmux
    micro
    mvn
    pypy
    pyenv-pip-migrate
    qmk
)

brew install ${PACKAGES[@]}

echo "Installing Python..."

PYTHON_VER="3.9.2"

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
)

pip3 install ${PIP_PACKAGES[@]}

MAC_IDS=(
    497799835  #Xcode
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

mas install ${MAC_IDS[@]}

echo "Setting up bash..."

cat > .bash_profile <<- EOM
source ~/.bash_prompt
source ~/.aliases

export BASH_SILENCE_DEPRECATION_WARNING=1
export PATH="~/.local/bin"
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
export PATH="/usr/local/opt/openjdk@11/bin:$PATH"
export JAVA_HOME=`/usr/libexec/java_home -v 11.0.11`
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
PS1+=">> "

export PS1;
EOM

cat > .bashrc <<- EOM
export BASH_SILENCE_DEPRECATION_WARNING=1
export JAVA_HOME=`/usr/libexec/java_home -v 11.0.11`
EOM

. .bash_profile

#TODO SETUP SYSTEM PREFERENCES

