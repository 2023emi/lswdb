#!/bin/bash

# Update and upgrade your system
sudo apt update
sudo apt upgrade -y

# Install LXDE Desktop Environment
sudo apt install lxde-core -y

# Installing XFCE Desktop Environment
#export DEBIAN_FRONTEND=noninteractive
#sudo apt install --assume-yes xfce4 desktop-base xfce4-terminal
#bash -c 'echo "exec /etc/X11/Xsession /usr/bin/xfce4-session" > /etc/chrome-remote-desktop-session'
#sudo apt remove --assume-yes gnome-terminal
#sudo apt install --assume-yes xscreensaver
#sudo systemctl disable lightdm.service

## Install miniconda
#mkdir -p ~/miniconda3
#wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
#bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
#rm -rf ~/miniconda3/miniconda.sh
#~/miniconda3/bin/conda init bash
#exec bash
#
## Create a Conda environment
#conda create --name py3_10 python=3.10
#conda activate py3_10
#
## Install Jupyter
#conda install jupyter
#jupyter-notebook

# Install fzf and fzf.vim
git clone https://github.com/junegunn/fzf ~/.vim/bundle/fzf
~/.vim/bundle/fzf/install --bin


#!/bin/bash

# Create directories for Vim configuration and plugins
mkdir -p ~/.vim/autoload ~/.vim/bundle

# Install Pathogen
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Create a .vimrc file
cat > ~/.vimrc << EOL
" Enable Pathogen
execute pathogen#infect()
execute pathogen#helptags()

" List of plugins
call pathogen#infect('~/.vim/bundle/{}', 'git://github.com/tpope/vim-fugitive.git')
call pathogen#infect('~/.vim/bundle/{}', 'git://github.com/vim-airline/vim-airline.git')
call pathogen#infect('~/.vim/bundle/{}', 'git://github.com/vim-airline/vim-airline-themes.git')
call pathogen#infect('~/.vim/bundle/{}', 'git://github.com/altercation/vim-colors-solarized.git')
call pathogen#infect('~/.vim/bundle/{}', 'git://github.com/scrooloose/nerdtree.git')

" Customize your Vim settings here
set number
syntax on

" Define key mappings
nnoremap <C-p> :NERDTreeToggle<CR>

EOL

echo "Vim setup completed. You can now start Vim and use the installed plugins."



git clone https://github.com/junegunn/fzf.vim ~/.vim/bundle/fzf.vim
echo "let g:fzf_layout = { 'window': 'below 0' }" >> ~/.vimrc

# Install vim-gitgutter
git clone https://github.com/airblade/vim-gitgutter.git ~/.vim/bundle/vim-gitgutter

# Install vim-floaterm
git clone https://github.com/voldikss/vim-floaterm.git ~/.vim/bundle/vim-floaterm
echo "let g:floaterm_keymap_toggle = '<F3>'" >> ~/.vimrc
echo "let g:floaterm_width = 0.9" >> ~/.vimrc
echo "let g:floaterm_height = 0.9" >> ~/.vimrc

# Install rust.vim with vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "call plug#begin()" >> ~/.vimrc
echo "Plug 'rust-lang/rust.vim'" >> ~/.vimrc
echo "call plug#end()" >> ~/.vimrc

# Source NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Add NVM initialization to .bashrc
echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.bashrc
echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> ~/.bashrc

# Add NVM bash completion to .bashrc
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Set up aliases or custom configurations

# Example: Alias for 2023
echo 'alias 2023="cd "$v2023"'

# Example: Setting PS1
echo 'PS1="\$ "'

# Initialize Conda
__conda_setup="$('/home/caspi/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/caspi/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/caspi/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/caspi/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup

# Custom configurations can be added here

# Example: Export environment variable
# export MY_ENV_VAR="some_value"

# Source the .bashrc
source ~/.bashrc


chmod +x setup.sh

