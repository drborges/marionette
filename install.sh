#!/bin/bash

usage() {
  echo "Usage:"
  echo "$0 /installation/path"
}

install () {
  $MARIONETTE_HOME=$1
  $ENV=$HOME/.bashrc

  git clone http://code.premierinc.com/source/scm/puppet/premierinc-marionette.git $MARIONETTE_HOME
  sed -i '/alias marionette=/d' $ENV
  echo "alias marionette=${MARIONETTE_HOME}/bin/marionette" >> $ENV
}

case "$1" in
  help)
    usage
    exit 0
  ;;
  --path)
    install $1
  ;;
  *)
    install $PWD
  ;;
esac

exit 0
