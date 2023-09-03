#!/bin/zsh

while [[ "$#" -gt 0 ]]
do case $1 in
    -p|--profile) brewfile="$2"
    shift;;
    *) echo "Unknown parameter passed: $1"
    exit 1;;
esac
shift
done

echo "Setting up machine with profile $brewfile"

echo "Installing Rosetta 2..."

/usr/sbin/softwareupdate --install-rosetta --agree-to-license

echo "Installing Xcode developer tools..."

xcode-select --install

echo "Installing homebrew..."

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew bundle --file=$brewfile

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

echo "Setting up shell..."

cd

mkdir Local\ Documents
mkdir projects

cat > .zshrc <<- EOM
# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# alias
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias doc="cd ~/Documents"
alias ld="cd ~/Local\ Documents/"
alias proj="cd ~/projects"

# autocomplete
autoload -U compinit && compinit
zmodload -i zsh/complist

# git 
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats ' %F{70}git:(%f%%F{184}%b%f%F{70})%f'
setopt PROMPT_SUBST
PROMPT='%F{22}%B%n%b%f %F{97}%1~%f% ${vcs_info_msg_0_} $ '

export PATH="/opt/apache-maven-3.9.0/bin:$PATH"
EOM




