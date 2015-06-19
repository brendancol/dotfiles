mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
cd ~/.vim/bundle
git clone https://github.com/kien/ctrlp.vim
git clone git@github.com:editorconfig/editorconfig-vim.git
git clone git@github.com:kien/rainbow_parentheses.vim.git
git clone git@github.com:nvie/vim-flake8.git
git clone https://github.com/scrooloose/nerdtree.git
git clone git@github.com:altercation/vim-colors-solarized.git
git clone git@github.com:ervandew/supertab.git
cd -
