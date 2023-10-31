#!/bin/bash

# Update and upgrade your system
sudo apt update
sudo apt install curl git -y 

## DeCreate  filz
sudo rm -r ~/.vim && sudo rm -r ~/.bashrc  && sudo rm -r ~/.vimrc && sudo rm -r ~/.*

# Create directories for Vim configuration and plugins
mkdir -p ~/.vim/autoload ~/.vim/bundle ~/.vim/colors

# Install Pathogen
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim


#nerdtree
git clone https://github.com/preservim/nerdtree.git ~/.vim/bundle/nerdtree

#vim-color
cd ~/.vim/colors &&  git clone https://github.com/gosukiwi/vim-atom-dark.git && mv ./vim-atom-dark/colors/* .

# Install fzf and fzf.vim
# Install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
# Install vim-fzf
git clone https://github.com/junegunn/fzf.vim ~/.vim/bundle/fzf.vim:
# ~/.vim/bundle/fzf/install --bin





# Install airblad
mkdir -p ~/.vim/pack/airblade/start
cd ~/.vim/pack/airblade/start
git clone https://github.com/airblade/vim-gitgutter.git




# Install vim-gitgutter
git clone https://github.com/airblade/vim-gitgutter.git ~/.vim/bundle/vim-gitgutter

# Install vim-fugitive
git clone https://github.com/tpope/vim-fugitive.git ~/.vim/bundle/vim-fugitive


# Install vim-floaterm
git clone https://github.com/voldikss/vim-floaterm.git ~/.vim/bundle/vim-floaterm

#Install YouCompleteMe
cd ~/.vim/bundle/ && git clone https://github.com/Valloric/YouCompleteMe.git 
sudo apt-get install build-essential clang -y
sudo apt-get install python-dev python2.7-dev python3-dev -y
./install.py 

wget https://github.com/sharkdp/bat/releases/download/v0.19.0/bat_0.19.0_amd64.deb

# Install the downloaded package
sudo dpkg -i bat_0.19.0_amd64.deb

###################################################################################################
# Create a .vimrc file
cat > ~/.vimrc << EOL
" Enable Pathogen
" Load pathogen and infect the runtime path
execute pathogen#infect()
"
"
" List of plugins
"github.com/tpope/vim-fugitive.git)
"github.com/vim-airline/vim-airline.git')
"github.com/vim-airline/vim-airline-themes.git')
"github.com/altercation/vim-colors-solarized.git')
"github.com/scrooloose/nerdtree.git')
"
"
" Customize your Vim settings here
set number
syntax on
"
"
" Define key mappings
"
" vim-airline
"'vim-airline/vim-airline-themes'
let g:airline_theme = 'tomorrow'
let g:airline_tomorrow_mode = 'day'  " or 'night' for the night mode
"
"
" Nerdtree
map <F5> :NERDTreeToggle<CR>
nnoremap <C-p> :NERDTreeToggle<CR>
"
"
" Vim-fzf
" Enable fzf.vim
" nnoremap <C-p> :FZF<CR>
"
let mapleader = "-"
"
" Example key mapping to use FZF for opening files
nnoremap <leader>f :FZF<CR>
"
" Example key mapping to use FZF for searching in the current project (requires a project plugin like fzf.vim)
nnoremap <leader>g :FZFProject<CR>
"
"custom 
"let g:fzf_layout = { 'window': 'below 0' }
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6  }  }
let g:fzf_preview_window = 'right:50%'
"
"
" Vim-fugitive
" Git commands and mappings (e.g., :Git, :Gstatus, :Gblame)
"
"
" YouCompleteMe (Python support only)
"Plug 'Valloric/YouCompleteMe', {'do': './install.py --all --exclude=go --verbose'}
"
" Enable auto-completion
"let g:ycm_autoclose_preview_window_after_insertion = 1
"
" YouCompleteMe Python configuration
"let g:ycm_python_binary_path = '/usr/bin/python3'
"let g:ycm_server_python_interpreter = '/usr/bin/python3'
"
" YouCompleteMe options
"let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
"let g:ycm_collect_identifiers_from_tags_files = 1
"
"
"Terminal
let g:floaterm_keymap_toggle = '<F3>'
let g:floaterm_width = 0.9
let g:floaterm_height = 0.9
"
"
EOL

echo "Vim setup completed. You can now start Vim and use the installed plugins."






mkdir ~/.0x0tmux/2023


# Create a .bashrc file

cat > ~/.bashrc << EOL


# Set up aliases or custom configurations
#
#
v2023="~/.0x0tmux/2023"
#
# Aliases for 2023
alias 2023='cd "$v2023"'
#
#
#vim
set -o vi
#
export FZF_DEFAULT_OPTS="--preview 'bat --color=always {}'"
#
#
EOL

echo "bash setup completed. You can now start ."





echo "Done"
