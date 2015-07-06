ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
brew update -y
brew install vim
brew install tmux
brew install zsh
brew install wget
brew install macvim

# fullscreen fix for yosemite
defaults write org.vim.MacVim MMNativeFullScreen 0 

brew install ssh-copy-id
