#!/usr/bin/env bash

set -e

# Source: https://gist.github.com/davejamesmiller/1965569
ask() {
  while true; do
    if [ "${2:-}" = "Y" ]; then
      prompt="Y/n"
      default=Y
    elif [ "${2:-}" = "N" ]; then
      prompt="y/N"
      default=N
    else
      prompt="y/n"
      default=
    fi
    read -p "$1 [$prompt] " REPLY </dev/tty
    if [ -z "$REPLY" ]; then
      REPLY=$default
    fi
    case "$REPLY" in
      Y*|y*) return 0 ;;
      N*|n*) return 1 ;;
    esac
  done
}

dir=`pwd`

if ask "Install symlink for .config" Y; then
  ln -sfn ${dir}/.config ${HOME}/
fi

if ask "Install symlink for .spacemacs" Y; then
  ln -sfn ${dir}/.spacemacs ${HOME}/.spacemacs
fi

if ask "Install symlink for .pentadactylrc" Y; then
  ln -sfn ${dir}/.pentadactylrc ${HOME}/.pentadactylrc
fi

if ask "Install symlink for .Xresources?" Y; then
  ln -sf ${dir}/.Xresources ${HOME}/.Xresources
fi

if ask "Install symlink for .xinitrc?" Y; then
  ln -sf ${dir}/.xinitrc ${HOME}/.xinitrc
fi

if ask "Install symlink for .Xmodmap?" Y; then
  ln -sf ${dir}/.Xmodmap ${HOME}/.Xmodmap
fi

if ask "Install symlink for .i3blocks.conf?" Y; then
  ln -sf ${dir}/.i3blocks.conf ${HOME}/.i3blocks.conf
fi

if ask "Install symlink for .scripts?" Y; then
  ln -sfn ${dir}/.scripts ${HOME}/
fi

if ask "Install symlink for .screenlayout?" Y; then
  ln -sfn ${dir}/.screenlayout ${HOME}/
fi

if ask "Install symlink for .i3?" Y; then
  ln -sfn ${dir}/.i3 ${HOME}/
fi

if ask "Install vim config?" Y; then
  mkdir -p ${HOME}/.vim/autoload
  mkdir -p ${HOME}/.vim/yankring_history
  ln -sfn ${dir}/plug.vim ${HOME}/.vim/autoload/
fi
