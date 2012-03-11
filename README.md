My Vim related files
====================

Setup
-----

If you want to use my .vimrc which is quite messy though:
    ln -s .vimrc ~/.vimrc
Add pathogen
    ln -s pathogen-vim/autoload ~/.vimrc/autoload
Change this part to where you cloned this repo
    call pathogen#infect("~/src/vim/bundle")

Plugins
-------
* vim-coffee-script
* vim-haml
* vim-rails
* vim-rspec

