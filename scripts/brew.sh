#!/bin/bash

function open_app_store {
  echo "Please sign in with your Apple ID"
  sleep 1; echo "Open the App Store."
  sleep 1; open -a App\ Store
}

function login_check {
  while true; do
    echo -n "$* [Y/n]: (default: n) "
    read -r ANSWER
    case $ANSWER in
      [Yy]*)
        return 0
        ;;
      *)
        open_app_store
        ;;
    esac
  done
}

if login_check "Have you signed in with your Apple ID?"; then
  cp "${HOME}"/setup/Brewfile "${HOME}"/.Brewfile
  brew bundle --global
  echo
  echo "=> Done"
  echo
fi
