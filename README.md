## Installation

```sh
cd ~/
git clone --recursive https.../.vim.git .vim
ln -sf $HOME/.vim/vimrc $HOME/.vimrc
cd $HOME/.vim
git submodule update --init
git remote set-url origin git@github.com:gus0k/.vim.git
```


### Adding a package

```sh
submodule init
git submodule add https://github.com/vim-airline/vim-airline.git pack/guso/start/vim-airline
git add .gitmodules pack/guso/start/vim-airline
git commit
```

### Updating a package

```sh
git submodule update --remote --merge
git commit
```

### Remove a package

```sh
git submodule deinit pack/guso/start/vim-airline
git rm pack/guso/start/vim-airline
rm -Rf .git/modules/pack/guso/start/vim-airline
git commit
```


