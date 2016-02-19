# Path to oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="gallois"
# ZSH_THEME="robbyrussell"

# Uncomment the following line if you want to disable marking untracked files under VCS as dirty.
# This makes repository status check for large repositories much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(cpanm git colored-man command-not-found dirhistory history node npm taskwarrior web-search wd)

export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/usr/bin/python2:$HOME/bin"

source $ZSH/oh-my-zsh.sh

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh"

# ranger
export RANGER_LOAD_DEFAULT_RC=FALSE

# default editor
export EDITOR=/usr/bin/vim

# aliases
source $HOME/.aliases

# tmux stuff
# export ZSH_TMUX_AUTOSTART=true

# nvm config
export NVM_DIR="/home/greg/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# node repl history
export NODE_REPL_HISTORY_FILE=$HOME/.config/noderepl_history.log

# ls dircolors in termite
eval $(dircolors ~/.dircolors)

# very simple backup function
function make-bak () {
  for file in "$@"; do
    newname=${file}.$(date +%Y%m%d.%H%M.bak)
    mv $file $newname
    cp -p -R $newname $file
    echo "$file backed up to $newname"
  done
}

# very simple restore function
function restore-bak () {
  for file in "$@"; do
    ln=$(expr length $file)
    ext=$(expr substr $file $((ln - 3)) $((ln)))
    affix=$(expr substr $file $((ln - 18)) $((ln)))
    base=$(expr substr $file 1 $((ln - 18)))
    if [ $ext == ".bak" ] && [ $((ln)) -gt 18 ]; then
      mv $file /tmp/tempfile
      cp -p -R $base $file
      cp -p -R /tmp/tempfile $base
      rm /tmp/tempfile
      echo "$base restored ($file kept)"
    else
      echo "$file is not a valid -date +%f.bak- file"
    fi
  done
}
