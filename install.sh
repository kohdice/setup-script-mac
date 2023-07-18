#!/bin/bash

SCRIPTS_DIR="${HOME}/setup"
TARBALL="https://github.com/kohdice/setup-script-mac/archive/refs/heads/main.tar.gz"

echo "Checking operating system..."
sleep 1

if [ "$(uname)" = "Darwin" ]; then
  echo "=> MacOS"
  sleep 1; echo
  echo "---------------------------------------------"
  echo "           Setup has been started.           "
  echo "---------------------------------------------"
  echo

  # Clone scripts
  if [ ! -d ${SCRIPTS_DIR} ]; then
    echo "Cloning setup scripts repository..."
    sleep 1; echo
    curl -L ${TARBALL} -o main.tar.gz
    tar -zxvf main.tar.gz
    rm -f main.tar.gz
    mv -f setup-script-mac-main "${SCRIPTS_DIR}"
    echo
    echo "=> Done"
    echo
  fi

  # Scripts for MacOS
  ${HOME}/setup/scripts/init.sh
  ${HOME}/setup/scripts/brew.sh
  ${HOME}/setup/scripts/tools.sh
else
  echo "($(uname)) is not supported."
  exit 1
fi

echo "---------------------------------------------"
echo "          Setup has been completed.          "
echo "---------------------------------------------"
