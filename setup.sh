#!/bin/bash

# Update and upgrade your system
sudo apt update
sudo apt install vim tmux wget xclip curl git -y 

## DeCreate  filz
sudo rm -r ~/.vim && sudo rm -r ~/.bashrc  && sudo rm -r ~/.vimrc && sudo rm -r ~/.fzf

# Create directories for Vim configuration and plugins
mkdir -p ~/.vim/autoload ~/.vim/bundle ~/.vim/colors

mkdir ~/.0x0tmux/2023


###################################################################################################
# Create a .vimrc file
cat > ~/.vimrc << EOL



" General settings
"
set number                 " Sets line numbers
set autoindent             " Sets auto indentation
set tabstop=2              " Sets tabstop
set shiftwidth=2           " For proper indentation
set smarttab               " Affects how tab key presses are interpreted
set softtabstop=2          " Control how many columns Vim uses when you hit tab key
set mouse=a                " This lets you use your mouse
set wrap                   " Sets up line wrapping
set fileformat=unix
"
"
"Keybindings for Copying to System Clipboard:
"
" Copy yanked lines to the system clipboard 
" Keybinding to copy selected text to system clipboard using xclip with Y
vnoremap YY :w !xclip -i -selection clipboard<CR><CR>
"
" Keybinding to copy the entire document to the system clipboard using xclip with YY
nnoremap YYY :%!xclip -i -selection clipboard<CR>
"
"
" Enable Pathogen
" Load pathogen and infect the runtime path
call pathogen#infect()
call pathogen#helptags()"

" List of plugins
"
"
" Define key mappings
"
let mapleader = "-"
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
"Vim-gitgutter
" Git Gutter keybindings
nnoremap <silent> <leader>n :GitGutterNextHunk<CR>
nnoremap <silent> <leader>p :GitGutterPrevHunk<CR>
nnoremap <silent> <leader>h :GitGutterFirstHunk<CR>
nnoremap <silent> <leader>l :GitGutterLastHunk<CR>
nnoremap <silent> <leader><Space> :GitGutterSignsToggle<CR>
nnoremap <silent> <leader>s :GitGutterStageHunk<CR>
nnoremap <silent> <leader>r :GitGutterRevertHunk<CR>

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
"Vim-Theme
colorscheme atom-dark-256

EOL

echo "Vim setup completed. You can now start Vim and use the installed plugins."








# Create a .bashrc file

cat > ~/.bashrc << EOL

PS1='\u\$ '


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
#Custom bashf's
#
export PATH=$PATH:~/.fzf/bin
#
fsl() {
    local selected_file
    selected_file=$(find ~/. -type f -name '*.txt' -exec cat {} \; | fzf --preview 'echo {}' --preview-window=up:3:wrap --prompt 'Select file to edit: ')
    if [[ -n "$selected_file" ]]; then
        echo -n "$selected_file" | xclip -selection clipboard
    fi
}
#

EOL

echo "bash setup completed. You can now start ."

# echo "HISTFILE="$HOME/.bash_history"" >> ~/.fzf/fzf.bash

echo "HISTFILE=\$HOME/.bash_history" >> ~/.fzf.bash




# Create a .tmux.conf file
cat > ~/.tmux.conf << EOL

#################https://www.hostinger.in/tutorials/tmux-config#################

# Enable two prefixes
set-option -g prefix C-a
set-option -g prefix2 C-b


# Enable mouse mode
set -g mouse on


# Start counting pane and window number at 1
set -g base-index 1
setw -g pane-base-index 1



# Change the background color to white
set -g window-active-style bg=black


#https://dev.to/serhatteker/tmux-active-pane-focus-3h41
# Change pane colors
#set -g pane-active-border fg=red 
#set -ag pane-active-border bg=magenta







#sudo apt-get install xclip
# Use xclip to copy and paste with the system clipboard
bind C-c run "tmux save-buffer - | xclip -i -sel clip"
bind C-v run "tmux set-buffer $(xclip -o -sel clip); tmux paste-buffer"

#tmux source-file ~/.tmux.conf

#################https://www.redhat.com/sysadmin/introduction-tmux-linux#################


#Change the status bar background color: 
set -g status-bg cyan
#Change inactive window color: 
#set -g window-status-style bg=yellow
#Change active window color: 
#set -g window-status-current-style bg=red,fg=white


# set active-inactive window styles
set -g window-style 'fg=colour247,bg=colour236'
set -g window-active-style 'fg=default,bg=colour234'

# Pane border
#set -g pane-border-bg default
#set -g pane-border-fg colour238


# Active pane border
#set -g pane-active-border-bg default
#set -g pane-active-border-fg blue

# Change pane colors
set -g pane-active-border  bg=default
set -ag pane-active-border fg=blue

EOL

echo "Tmux  setup completed"




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



echo "XXXXXXXXXXXXXXDONEXXXXXXXXXXXX"
