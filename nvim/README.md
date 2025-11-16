# Neovim configuration

## Before configuration

1. Install Neovim from source:
    ```shell
    sudo apt-get install ninja-build gettext cmake curl build-essential git
    git clone https://github.com/neovim/neovim
    cd neovim
    make CMAKE_BUILD_TYPE=RelWithDebInfo
    cd build && cpack -G DEB && sudo dpkg -i nvim-linux-<arch>.deb # with <arch> either x86_64 or arm64
    sudo apt install ./nvim-linux-<arch>.deb
    # rm -rf ../neovim
    ```

2. Install Lua and LuaRocks:
    Lua and LuaRocks are needed for Lazy.
    ```shell
    sudo apt install lua5.4 liblua5.4-dev
    sudo apt install luarocks
    ```

3. Install Python virtual environment:
    Mason needs the tool to install formatters.
    ```shell
    sudo apt install python3.12-venv
    ```

4.

