#!/bin/zsh

# Install Rosetta 2 for Apple Silicon
if [ "$(uname -m)" == "arm64" ] ; then
  echo "Install Rosetta 2..."
  /usr/sbin/softwareupdate --install-rosetta --agree-to-license
  echo
  echo "=> Done"
  echo
fi

# Install Xcode
echo "Install Xcode..."
xcode-select --install
echo
echo "=> Done"
echo


# Install Homebrew
echo "Install Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
if [ "$(uname -m)" == "arm64" ] ; then
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/"$USER"/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
  echo
  echo "=> Done"
  echo
fi
