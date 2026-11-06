# Install and dependencies

```bash
# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# neovim
# For systems with old glibc
# https://github.com/neovim/neovim-releases/releases
# For new systems
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
chmod u+x nvim-linux-x86_64.appimage
mv nvim-linux-x86_64.appimage nvim

# ripgrep
# musl means statically linked
wget https://github.com/BurntSushi/ripgrep/releases/download/15.2.0/ripgrep-15.2.0-x86_64-unknown-linux-musl.tar.gz

# fd
# musl means statically linked
wget https://github.com/sharkdp/fd/releases/download/v10.5.1/fd-v10.5.1-x86_64-unknown-linux-musl.tar.gz

# bat (optional for fzf)
# https://github.com/sharkdp/bat/releases
wget https://github.com/sharkdp/bat/releases/download/v0.26.1/bat-v0.26.1-x86_64-unknown-linux-musl.tar.gz

# tree-sitter CLI (required by nvim-treesitter `main` to build parsers; also needs gcc)
wget https://github.com/tree-sitter/tree-sitter/releases/download/v0.27.1/tree-sitter-linux-x64.gz
gunzip tree-sitter-linux-x64.gz && mv tree-sitter-linux-x64 tree-sitter && chmod +x tree-sitter

```

Add export paths to .bashrc

```bash
export PATH="$PATH:/home/nponomar/bin/nvim/"
export PATH="$PATH:/home/nponomar/bin/ripgrep/"
export PATH="$PATH:/home/nponomar/bin/fd/"
export PATH="$PATH:/home/nponomar/bin/bat/"
export PATH="$PATH:/home/nponomar/bin/tree-sitter/"
```



# Layout

```
init.lua                 -- loads the modules below in order
lua/config/options.lua   -- leader, editor options
lua/config/keymaps.lua   -- general keymaps (plugin keymaps live in their specs)
lua/config/autocmds.lua  -- autocommands
lua/config/lazy.lua      -- lazy.nvim bootstrap + setup
lua/plugins/core.lua     -- neo-tree, fzf-lua, treesitter, mini.bufremove, which-key
lua/plugins/ui.lua       -- catppuccin, lualine (statusline + buffer tabline)
```

Undo history lives in `~/.local/state/nvim/undo`.

# Clipboard

- Over SSH: `"+y` copies to the local clipboard via OSC 52. Local tmux needs
  `set -g set-clipboard on`. Paste from the local clipboard with Ctrl+Shift+V.
