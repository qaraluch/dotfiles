![](./pic/git-logo-dotfiles.jpg)

# Dotfiles (DEPRECATED)

My [dotfiles](https://github.com/qaraluch/dotfiles) setup.

## Installation

Before running main install script you need to review configuration repo and install it. See your target dotfiles-cfg-(...) repo for further instructions.

After sourcing dotfile's config launch installation process by:

### Using symlink

See dotfiles-cfg/.dotfiles-config for variable reference.

```sh
rm -rf $HOME/.dotfiles-source && ln -sf $_DOTFILES_SOURCE $HOME/.dotfiles-source
cd !!:$
./install.sh
```

### Using git

Clone repo:

```sh
git clone --depth 1 https://github.com/qaraluch/dotfiles.git .dotfiles-source
cd !!:$
./install.sh
```

## Separate installations

For installing vscode there is separate installation script:

```sh
cd vscode/ && ./install.sh
```

## Credits

- wslpath - [djcj](djcj@gmx.de)

## License

MIT © [qaraluch](https://github.com/qaraluch)
