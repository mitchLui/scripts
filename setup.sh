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

echo "Tapping into taps..."

TAPS=(
    homebrew/cask-versions
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
)

brew install ${PACKAGES[@]}

echo "Installing casks..."

CASKS=(
    ngrok
    microsoft-edge
    microsoft-office
    docker
    visual-studio-code
    postman
    mysqlworkbench
    terminus
    virtualbox
    vagrant
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
)

mas install ${MAC_IDS[@]}

cd ~/Downloads

APP_URLS=(
    https://desktop-release.notion-static.com/Notion-2.0.11.dmg
    https://download01.logi.com/web/ftp/pub/controldevices/unifying/unifying1.3.375_mac.zip
    https://teams.microsoft.com/downloads/desktopurl?env=production&plat=osx&arch=&download=true
    https://coderunnerapp.com/download
    https://coderunner.nyc3.cdn.digitaloceanspaces.com/CodeRunner-4.0.3.zip
    https://charliemonroesoftware.com/trial/downie/v4/Downie_4_4208.dmg
    https://charliemonroesoftware.com/trial/permute/v3/Permute_3_2338.dmg
    https://desktop.figma.com/mac/Figma.zip
    https://dl.devmate.com/com.macpaw.CleanMyMac4/CleanMyMacX.dmg
    https://downloads.imazing.com/mac/iMazing/iMazing2forMac.dmg
    https://daisydiskapp.com/downloads/DaisyDisk.zip
    https://s3.amazonaws.com/cindori/Sensei.dmg
    https://github.com/qmk/qmk_toolbox/releases/download/0.0.21/QMK.Toolbox.app.zip
    https://github.com/the-via/releases/releases/download/v1.3.1/via-1.3.1-mac.dmg
    https://www.dropbox.com/s/m9c49ia10kx3g2b/BootMapperClient.mac.zip?dl=0
    https://cachefly.alfredapp.com/Alfred_4.3.1_1214.dmg
    https://enduranceapp.com/downloads/Endurance3.1.zip
    https://v2.airbuddy.app/download
    https://crystalidea.com/downloads/macsfancontrol.zip
    https://d2oxtzozd38ts8.cloudfront.net/loopback/download/Loopback.zip
    https://download01.logi.com/web/ftp/pub/techsupport/cameras/Webcams/LogiCameraSettings_3.0.23.pkg
    https://downloads.caldigit.com/CalDigit_TS3_Plus_Firmware_Updater.zip
    https://downloads.caldigit.com/CalDigit-Docking-Station-Utility.zip
    https://cdn.eltima.com/download/downloader_mac.dmg
    https://coconut-flavour.com/downloads/coconutBattery_latest.zip
    https://d1k3ac1niusr4e.cloudfront.net/soulver.zip
    https://download01.logi.com/web/ftp/pub/techsupport/options/Options_8.36.76.zip
    https://download.parallels.com/desktop/v16/16.1.3-49160/ParallelsDesktop-16.1.3-49160.dmg
    https://github.com/glouel/AerialCompanion/releases/latest/download/AerialCompanion.dmg
    https://www.macbartender.com/B2/updates/B4Latest/Bartender%204.dmg
    https://zoom.us/client/latest/Zoom.pkg
    https://github.com/sqlitebrowser/sqlitebrowser/releases/download/v3.12.1/DB.Browser.for.SQLite-3.12.1-v2.dmg
    https://github.com/DigiDNA/Silicon/releases/download/1.0.3/Silicon.app.zip
    https://devimages-cdn.apple.com/design/resources/download/SF-Symbols-2.1.dmg
    https://d2oxtzozd38ts8.cloudfront.net/audiohijack/download/AudioHijack.zip
    https://d2oxtzozd38ts8.cloudfront.net/soundsource/download/SoundSource.zip
)

wget ${APP_URLS[@]}

#TODO SETUP SYSTEM PREFERENCES
