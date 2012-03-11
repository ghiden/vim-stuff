My Vim related files
====================

Setup
-----
I placed my directory under src, but you can place it anywhere you want, such as ~/config, ~/src/config, etc
Create a symlink to my .vimrc which is quite messy though:
    ln -s ~/src/vim/.vimrc ~/.vimrc
You can add pathogen by yourself or link it to here
    ln -s ~/src/vim/pathogen-vim/autoload ~/.vimrc/autoload
Change this part to where you cloned this repo
    call pathogen#infect("~/src/vim/bundle")

Plugins
-------
* vim-coffee-script
* vim-haml
* vim-rails
* vim-rspec

