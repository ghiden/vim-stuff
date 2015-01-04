My Vim related files
====================

Setup
-----
I placed my directory under vim-stuff folder, but you can place it anywhere you want, such as ~/config, ~/src/config, etc
Create a symlink to my .vimrc:

```sh
    ln -s ~/vim-stuff/.vimrc ~/.vimrc
```

To manage plugins, I use [VIM-PLUG](https://github.com/junegunn/vim-plug).

```sh
mkdir -p ~/.vim/autoload
curl -fLo ~/.vim/autoload/plug.vim \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Reload .vimrc and `:PlugInstall` to install plugins.
