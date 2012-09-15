My Vim related files
====================

Setup
-----
I placed my directory under src, but you can place it anywhere you want, such as ~/config, ~/src/config, etc
Create a symlink to my .vimrc which is quite messy though:

    ln -s ~/src/vim-stuff/.vimrc ~/.vimrc

You can add pathogen by yourself or link it to here. I'm assuming .vim exists already and autoload directory does not exist.

    ln -s ~/src/vim-stuff/vim-pathogen/autoload ~/.vim/autoload

Change this part of .vimrc to where you placed this repo's bundle

    call pathogen#infect("~/src/vim-stuff/bundle")

Plugins (git submodules)
-------

git submodule init
git submodule update

* pathogen
* vim-coffee-script
* vim-haml
* vim-rails
* vim-rspec
* nginx.vim: For this, I don't edit nginx.conf all the time, so I change syntax to nginx when I need to. :set syntax=nginx
* vim-markdown
* zencoding-vim
* vim-puppet

