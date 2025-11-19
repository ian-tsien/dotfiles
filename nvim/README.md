## prerequisites

1. Install `Neovim` from source:

   ```shell
   sudo apt-get install ninja-build gettext cmake curl build-essential git
   git clone https://github.com/neovim/neovim
   cd neovim
   make CMAKE_BUILD_TYPE=RelWithDebInfo
   cd build && cpack -G DEB && sudo dpkg -i nvim-linux-<arch>.deb # with <arch> either x86_64 or arm64
   sudo apt install ./nvim-linux-<arch>.deb
   # rm -rf ../neovim
   ```

2. Install `git`, `curl`, `fzf`, `ripgrep`, `fd`, `py-venv`:

   ```shell
   sudo apt install git curl fzf ripgrep fd-find python3.12-venv
   ```

3. Install `lazygit` and add an alias for it:

   ```shell
   LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
   curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
   tar xf lazygit.tar.gz lazygit
   sudo install lazygit -D -t /usr/local/bin/
   echo "alias lg='lazygit'" >> ~/.zshrc
   rm lazygit lazygit.tar.gz
   ```

4. Install `nvm`, install the latest LTS version of node, and install `tree-sitter-cli`:

   ```shell
   curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
   nvm install --lts
   npm install -g tree-sitter-cli
   ```

## Confirm the configuration

Clone the repository, and make a symbol link from this directory to `~/.config/nvim`.
Open `nvim`, then run `LazyHealth` to make sure everything goes right.
