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

brew install bash-completion
brew install coreutils
brew install findutils
brew install moreutils


###############################################################################
# Install binaries and other packages
###############################################################################
echo "Homebrew: installing binaries and other packages..."
brew tap starkandwayne/cf
brew install git
brew link --force git
brew install heroku/brew/heroku
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
brew install cloudfoundry/tap/bosh-cli
brew install go
brew install govmomi/tap/govc
brew install kubectx
brew install lolcat
brew install nmap
brew install starkandwayne/cf/om
brew install starkandwayne/cf/uaa-cli
brew install openshift-cli
brew install watch
brew install draft
brew install f3
brew install faas-cli
brew install git-flow-avh
brew install jq
brew install wakeonlan
brew install grep
brew install openssh
brew install ansible
brew install hub

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
brew cask install cleanmymac
brew cask install dash
brew cask install discord
brew cask install homebrew/cask-versions/docker-edge
brew cask install dropbox
brew cask install google-cloud-sdk
brew cask install google-chrome
brew cask install iterm2
brew cask install kaleidoscope
brew cask install obs
brew cask install postman
brew cask install powershell
brew cask install vagrant
brew cask install vagrant-manager
brew cask install virtualbox
brew cask install slack-beta
brew cask install spotify
brew cask install sourcetree
brew cask install snagit
brew cask install vlc
brew cask install microsoft-teams
brew cask install vmware-fusion
brew cask install visual-studio-code
brew cask install the-unarchiver
brew cask install whatsapp
brew cask install minikube
brew cask install minishift
brew cask install joinme
brew cask install cyberduck
brew cask install mongodb-compass
brew cask install camtasia
brew cask install smcfancontrol
brew cask install homebrew/cask-drivers/razer-synapse
brew cask install parsec
brew cask install onedrive
brew cask install homebrew/cask-drivers/synology-cloud-station-backup
brew cask install homebrew/cask-drivers/synology-drive
brew cask install timing
brew cask install plex-media-player
brew cask install backblaze
brew cask install charles
brew cask install zoomus
brew cask install private-internet-access
brew cask install wireshark
brew cask install spotify-notifications
brew cask install tunnelblick
brew cask install evernote
brew cask install cubicsdr
brew cask install twitch
brew cask install steam
brew cask install royal-tsx
brew cask install origin
brew cask install minecraft
brew cask install grammarly
brew cask install epic-games
brew cask install audio-hijack

###############################################################################
# Execute installers downloaded with Homebrew Cask
###############################################################################
echo "Opening installers..."

echo "Opening Installer: Adobe Creative Cloud"
open /usr/local/Caskroom/adobe-creative-cloud/latest/Creative\ Cloud\ Installer.app/
echo "Opening Installer: Backblaze"
open /usr/local/Caskroom/backblaze/latest/Backblaze\ Installer.app/

###############################################################################
# Cleanup
###############################################################################
brew cleanup


###############################################################################
# Install applications with mas-cli (Mac App Store CLI)
###############################################################################
echo "mas-cli: installing Mac App Store apps..."

mas install 411643860 # DaisyDisk
mas install 585829637 # Todoist
mas install 924726344 # Deliveries
mas install 1006739057 # Neptunes
mas install 1402042596 # AdBlock
mas install 497799835 # Xcode
mas install 425955336 # Skitch
mas install 1018899653 # HeliumLift
mas install 1142578753 # OmniGraffle
mas install 568494494 # Pocket
mas install 1404231964 # UPRIGHT GO Desktop
mas install 1090488118 # Gemini 2

###############################################################################
# Install fonts for iTerm
###############################################################################
echo "Installing Fonts"
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

echo "macOS Config, Dev Tools, Apps are Done Setup!"