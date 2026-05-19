# my configuration dotfiles

#### **usage:**

- clone this repository
```shell
cd ~/dotfiles
stow <package name>
```
<br>

## neovim configuration manual

**my personal neovim ide configuration**

> built on kickstart.nvim project with structured setup for plugins.

> [!note]  
> the following installation method is adapted from kickstart.nvim:

### external requirements

- core tools: `git`, `make`, `unzip`, c compiler (`gcc`)
- search utilities:
  - [ripgrep](https://github.com/burntsushi/ripgrep#installation),
  - [fd-find](https://github.com/sharkdp/fd#installation)
- clipboard support:
  - linux: xclip or xsel
  - windows: win32yank
- font: [nerd font](https://www.nerdfonts.com/) (recommended)
- language support:
  - javascript/typescript: 'npm'
  - python: 'pip'
  - any other language you may use...
- linting to prose:
  - [vale](https://docs.vale.sh/)
  - config file:$home/.config/vale
  - to install package, run:

    ```sh
    vale sync
    ```
