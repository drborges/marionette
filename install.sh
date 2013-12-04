#!/bin/sh

usage() {
  echo '[ERROR] --path parameter must be an absolute path'
  echo ''
  echo 'Usage:'
  echo "  $0 [--path /absolute/destination/path]"
  exit 1
}

install () {
  MARIONETTE_HOME=$1
  [[ $SHELL = '/bin/zsh' ]] && ENV=$HOME/.zshrc || ENV=$HOME/.bashrc

  git clone https://github.com/drborges/marionette.git $MARIONETTE_HOME
  sed -n '/alias marionette=/!p' $ENV > tmp && mv -f tmp $ENV
  echo "alias marionette=${MARIONETTE_HOME}/bin/marionette" >> $ENV
}

install_with_path() {
  case $1 in
    /*) install $1
      ;;
     *) usage
      ;;
  esac
}

case "$1" in
  help)
    usage
  ;;
  --path)
    install_with_path $2
  ;;
  *)
    install $PWD/marionette
  ;;
esac

exit 0
