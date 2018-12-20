#!/bin/bash

###############################################################################
# setup-brew
#
# A shell script to automate system tool setup for Mac OS X.
###############################################################################


###############################################################################
# Install Xcode command line tools
###############################################################################
echo "Installing Xcode Command Line Tools..."
xcode-select --install


###############################################################################
# Check for Homebrew, else install
###############################################################################
echo "Checking for, or Installing Homebrew..."
if [ -z `command -v brew` ]; then
    echo "Brew is missing! Installing it..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi;


###############################################################################
# Make sure we're on latest Homebrew
###############################################################################
echo "Homebrew: updating..."
brew update


###############################################################################
# Upgrade any already-installed formulae
###############################################################################
echo "Homebrew: upgrading..."
brew upgrade


###############################################################################
# Install utilities
###############################################################################
echo "Homebrew: updating default unix tools..."
brew install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
brew install zsh-syntax-highlighting
chsh -s $(which zsh)

brew install bash-completion
brew install coreutils
brew install findutils
brew install moreutils


###############################################################################
# Install binaries and other packages
###############################################################################
echo "Homebrew: installing binaries and other packages..."
brew install ffmpeg --with-libvpx
brew install git
brew install heroku/brew/heroku
brew install httpie
brew install imagemagick --with-webp
brew install mackup
brew install mas
brew install node
brew install nvm
brew install npm
brew install python
sudo easy_install pip
brew install tree
brew install wget --with-iri
brew install kubernetes-cli
brew install kubernetes-helm
brew install asciinema
brew install bosh-cli
brew install go
brew install govc
brew install kubectx
brew install lolcat
brew install nmap
brew install om
brew install uaa-cli
brew install openshift-cli
brew install sqlite
brew install watch


###############################################################################
# Run Homebrew cleanup to remove installation/cached files
###############################################################################
echo "Homebrew: cleaning up..."
brew cleanup


###############################################################################
# Install Node Packages with NPM
###############################################################################
#echo "Node: installing Yarn/NPM packages…"
#yarn global add @squarespace/server
#yarn global add contentful-cli
#yarn global add eslint
#yarn global add firebase-tools
#yarn global add grunt-cli
#yarn global add gulp
#yarn global add http-server
#yarn global add hpm-cli
#yarn global add imageoptim-cli
#yarn global add js-beautify
#yarn global add markdown-pdf
#yarn global add netlify-cli
#yarn global add newman
#yarn global add nodemon
#yarn global add now
#yarn global add squarespace-cli
#yarn global add svgo
#yarn global add uglify
#yarn global add ultradns-node-cli
#yarn global add vue-cli
#yarn global add webpack
#yarn global add webpack-dev-server
#yarn global add wt-cli


###############################################################################
# Install applications with Homebrew Cask
###############################################################################
echo "Homebrew Cask: installing apps..."
brew cask install 1password
brew cask install adobe-creative-cloud
brew cask install alfred
brew cask install dash
brew cask install docker
brew cask install dropbox
brew cask install google-cloud-sdk
brew cask install google-chrome
brew cask install iterm2
brew cask install obs
brew cask install postman
brew cask install slack
brew cask install spotify
brew cask install visual-studio-code
brew cask install whatsapp


###############################################################################
# Execute installers downloaded with Homebrew Cask
###############################################################################
echo "Opening installers..."

echo "Opening Installer: Adobe Creative Cloud"
open /usr/local/Caskroom/adobe-creative-cloud/latest/Creative\ Cloud\ Installer.app/


###############################################################################
# Cleanup
###############################################################################
brew cask cleanup


###############################################################################
# Install applications with mas-cli (Mac App Store CLI)
###############################################################################
echo "mas-cli: installing Mac App Store apps..."
# DaisyDisk
mas install 411643860
# Speedtest
mas install 1153157709
# WiFi Explorer
mas install 494803304


echo "macOS Config, Dev Tools, Apps are Done Setup!"