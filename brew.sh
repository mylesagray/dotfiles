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
brew tap starkandwayne/cf azure/draft beeftornado/rmtree cloudfoundry/tap govmomi/tap heroku/brew homebrew/bundle
brew tap homebrew/cask homebrew/cask-drivers homebrew/cask-eid homebrew/cask-fonts homebrew/cask-versions
brew tap homebrew/core starkandwayne/cf

brew install ansible
brew install asciinema
brew install cloudfoundry/tap/bosh-cli
brew install draft
brew install f3
brew install faas-cli
brew install git
brew install git-flow-avh
brew install go
brew install govmomi/tap/govc
brew install grep
brew install heroku/brew/heroku
brew install hub
brew install jq
brew install kubectx
brew install kubernetes-cli
brew install kubernetes-helm
brew install lolcat
brew install mackup
brew install mas
brew install nmap
brew install node
brew install npm
brew install nvm
brew install openshift-cli
brew install openssh
brew install python
brew install starkandwayne/cf/om
brew install starkandwayne/cf/uaa-cli
brew install tree
brew install wakeonlan
brew install watch
brew install wget

brew link --force git
sudo easy_install pip

###############################################################################
# Run Homebrew cleanup to remove installation/cached files
###############################################################################
echo "Homebrew: cleaning up..."
brew cleanup

###############################################################################
# Install applications with Homebrew Cask
###############################################################################
echo "Homebrew Cask: installing apps..."
brew cask install 1password
brew cask install adobe-creative-cloud
brew cask install alfred
brew cask install audio-hijack
brew cask install backblaze
brew cask install camtasia
brew cask install charles
brew cask install cleanmymac
brew cask install cubicsdr
brew cask install cyberduck
brew cask install dash
brew cask install discord
brew cask install dropbox
brew cask install epic-games
brew cask install evernote
brew cask install google-chrome
brew cask install google-cloud-sdk
brew cask install grammarly
brew cask install homebrew/cask-drivers/razer-synapse
brew cask install homebrew/cask-drivers/synology-cloud-station-backup
brew cask install homebrew/cask-drivers/synology-drive
brew cask install homebrew/cask-versions/docker-edge
brew cask install iterm2
brew cask install joinme
brew cask install kaleidoscope
brew cask install microsoft-teams
brew cask install minecraft
brew cask install minikube
brew cask install minishift
brew cask install mongodb-compass
brew cask install obs
brew cask install onedrive
brew cask install origin
brew cask install parsec
brew cask install plex-media-player
brew cask install postman
brew cask install powershell
brew cask install private-internet-access
brew cask install royal-tsx
brew cask install slack-beta
brew cask install smcfancontrol
brew cask install snagit
brew cask install sourcetree
brew cask install spotify
brew cask install spotify-notifications
brew cask install steam
brew cask install the-unarchiver
brew cask install timing
brew cask install tunnelblick
brew cask install twitch
brew cask install vagrant
brew cask install vagrant-manager
brew cask install virtualbox
brew cask install visual-studio-code
brew cask install vlc
brew cask install vmware-fusion
brew cask install whatsapp
brew cask install wireshark
brew cask install zoomus

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
# Go stuff
###############################################################################
go get -u sigs.k8s.io/kind


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