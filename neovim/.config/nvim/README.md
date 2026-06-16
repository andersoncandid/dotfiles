# Neovim Configuration

**My Personal Neovim IDE Configuration**

> Built on Kickstart.nvim project with Structured Setup for plugins.

> [!NOTE]  
> The following installation method is adapted from kickstart.nvim:

### External Requirements

- Core Tools: `git`, `make`, `unzip`, C Compiler (`gcc`)
- Search Utilities:
  - [ripgrep](https://github.com/BurntSushi/ripgrep#installation),
  - [fd-find](https://github.com/sharkdp/fd#installation)
- Clipboard Support:
  - Linux: xclip or xsel
  - Windows: win32yank
- Font: [Nerd Font](https://www.nerdfonts.com/) (recommended)
- Language Support:
  - Javascript/Typescript: 'npm'
  - Python: 'pip'
  - Any other language you may use...

#### Clone Configuration

<details><summary> Linux </summary>

```sh
git clone https://github.com/andersoncandid/nvim-config.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```

</details>

<details><summary> Windows </summary>

With cmd `cmd.exe`:

```
git clone https://github.com/andersoncandid/nvim-config.git "%localappdata%\nvim"
```

With PowerShell `powershell.exe`

```
git clone https://github.com/andersoncandid/nvim-config.git "${env:LOCALAPPDATA}\nvim"
```

</details>

## Notes

This configuration builds upon [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)
