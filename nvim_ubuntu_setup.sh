sudo apt-get install software-properties-common
sudo apt-get install python-software-properties
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim
sudo apt-get install pip
sudo apt-get install python3-pip

mkdir -p ~/.config/nvim/autoload
cd ~/.config/nvim/autoload
wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cd -

cp ./.config/nvim/init.vim ~/.config/nvim/

pip install neovim
pip3 install neovim

# now open nvim and run :UpdateRemotePlugins and then run :PlugInstall
