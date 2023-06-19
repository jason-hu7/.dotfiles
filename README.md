# .dotfiles
dot files for my machine

To set up a new machine, clone the repository on your new machine as a bare repository:

```
git clone --separate-git-dir=$HOME/.dotfiles https://github.com/jason=hu7/.dotfiles.git ~
```

This might fail if git finds an existing config file in your $HOME. In that case, a simple solution is to clone to a temporary directory, and then delete it once you are done:

```
git clone --separate-git-dir=$HOME/.dotfiles https://github.com/jason-hu7/.dotfiles.git tmpdotfiles
rsync --recursive --verbose --exclude '.git' tmpdotfiles/ $HOME/
rm -r tmpdotfiles
```

