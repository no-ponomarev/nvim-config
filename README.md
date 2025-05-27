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
wget https://github.com/BurntSushi/ripgrep/releases/download/14.1.1/ripgrep-14.1.1-x86_64-unknown-linux-musl.tar.gz

# fd
# musl means statically linked
wget https://github.com/sharkdp/fd/releases/download/v10.2.0/fd-v10.2.0-x86_64-unknown-linux-musl.tar.gz

# bat (optional for fzf)
# https://github.com/sharkdp/bat/releases
wget https://github.com/sharkdp/bat/releases/download/v0.25.0/bat-v0.25.0-x86_64-unknown-linux-musl.tar.gz

```

Add export paths to .bashrc

```bash
export PATH="$PATH:/home/nponomar/env/nvim/"
export PATH="$PATH:/home/nponomar/env/ripgrep/"
export PATH="$PATH:/home/nponomar/env/fd/"
export PATH="$PATH:/home/nponomar/env/bat/"
```


