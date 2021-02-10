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
    mas
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

MAC_IDS=(
    497799835 #Xcode
    430255202 #MacTracker
    572491815 #Textastic
    1493005285 #Logoist
    1435957248 #Drafts
    1449412482 #Reeder
    682658836 #Garageband
    1116599239 #NordVPN
    1276248849 #Diagrams
    1290358394 #Cardhop
    1147396723 #WhatsApp
    424389933 #Final Cut Pro
    577085396 #Unclutter
    993487541 #CARROT
    1019371109 #Balance Lock
    1224268771 #Screens
    1037126344 #Apple Configurator
    1289583905 #Pixelmator Pro
    1176895641 #Spark
    441258766 #Magnet
    425424353 #Unarchiver
    1482454543 #Twitter
    1478447657 #Geekbench
    409201541 #Pages
    1444383602 #GoodNotes
    747648890 #Telegram
    1120099014 #PDF Viewer
    640199958 #Developer
    639968404 #Parcel
    409203825 #Numbers
    461788075 #Movist
    409183694 #Keynote
    1018301773 #AdBlock Pro
)

mas install ${MAC_IDS[@]}