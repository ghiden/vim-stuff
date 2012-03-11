My Vim related files
====================

Setup
-----
I placed my directory under src, but you can place it anywhere you want, such as ~/config, ~/src/config, etc
Create a symlink to my .vimrc which is quite messy though:

    ln -s ~/src/vim/.vimrc ~/.vimrc

You can add pathogen by yourself or link it to here. I'm assuming .vim exists already and autoload directory does not exist.

    ln -s ~/src/vim/pathogen-vim/autoload ~/.vim/autoload

Change this part of .vimrc to where you placed this repo's bundle

    call pathogen#infect("~/src/vim/bundle")

Plugins
-------
* vim-coffee-script
* vim-haml
* vim-rails
* vim-rspec

