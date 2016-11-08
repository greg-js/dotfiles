#
# Executes commands at the start of an interactive session.
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/usr/bin/python2:$HOME/bin:$(ruby -e 'print Gem.user_dir')/bin:$HOME/.cargo/bin:/root/.gem/ruby/2.3.0/bin:$PATH"

# ssh
export SSH_KEY_PATH="~/.ssh"

# default editor
export EDITOR=/usr/bin/vim

# aliases
source $HOME/.aliases

# nvm config
# export NVM_DIR="/home/greg/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# node repl history
export NODE_REPL_HISTORY_FILE=$HOME/.config/noderepl_history.log

# ls dircolors in termite
# eval $(dircolors ~/.dircolors)

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

wd() {
  . /home/greg/bin/wd/wd.sh
}

# begin wdn setup
wdn() {
	source $(npm root -g)/wdn/bin/wdn.sh
}
source <(wdn --completion)
# end wdn setup

# rust
# export RUST_SRC_PATH=/usr/src/rust/src
export PAGER=/usr/bin/less

function match_filename() {
  find "$1" -iname "*$2*" -print
}

function match_contents() {
  grep -Ri "$1" -e "$2"
}

function matchrun_filename() {
  find "$1" -iname "*$2*" -print0 | xargs -0 ls -l
}

function matchrun_contents() {
  grep -Ri "$1" -e "$2" -lZ | xargs -0 "${@:3}"
}
