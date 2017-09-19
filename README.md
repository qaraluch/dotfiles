
# Dotfiles
by qaraluch

## Installation
Before runing main install script you need to review configuration repo and install it. 
See your target dotfiles-cfg-(...) regpo for further instructions. 

### Using symlink
`rm -rf $HOME/.dotfiles-source && ln -sf $_DOTFILES_SOURCE $HOME/.dotfiles-source` # see dotfiles-cfg/.dotfiles-config

### Using git
2. Clone repo:
```sh
git clone --depth 1 <dotfiles-repo> .dotfiles-source
cd !!:$
bash install.sh
```
