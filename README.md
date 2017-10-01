![](./pic/git-logo-dotfiles.jpg)

# Dotfiles
My [dotfiles](https://github.com/qaraluch/dotfiles) setup.

## Installation
Before running main install script you need to review configuration repo and install it. See your target dotfiles-cfg-(...) repo for further instructions. 

After sourcing dotfile's config launch installation process by:
 
### Using symlink
```sh
rm -rf $HOME/.dotfiles-source && ln -sf $_DOTFILES_SOURCE $HOME/.dotfiles-source # see dotfiles-cfg/.dotfiles-config
```

### Using git
2. Clone repo:
```sh
git clone --depth 1 <dotfiles-repo> .dotfiles-source
cd !!:$
bash install.sh
```

## Credits
*    wslpath - [djcj](djcj@gmx.de)

## License
MIT © [qaraluch](https://github.com/qaraluch)

