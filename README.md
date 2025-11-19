# Other configuration

Except for the configure files listed in the repository, there are some other tools worth being marked down.

## `zsh` + `oh-my-zsh`

1. Install `zsh` and make it the default shell:

```shell
sudo apt install zsh
chsh -s $(which zsh)
```

2. Install `oh-my-zsh`:

```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

3. Configure `zsh`:

- Change the theme to `agnoster` by modifying `ZSH_THEME="agnoster"`.

- Add `autosuggestions`:

```shell
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Add the plugin to the list of plugins for Oh My Zsh to load (inside ~/.zshrc)
plugins=(
    # other plugins...
    zsh-autosuggestions
)
```

- Remove `hostname` by setting `prompt_context() {}`.

- Install and add `zsh-syntax-highlighting` to your `zsh` file like the following:

```shell
echo "source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
```

4. Others:

   Better to `touch` a new `zsh` configure file named `.zshenv` to store other plugins' configuration, such as
   `export=..`, etc. Leave the `.zshrc` alone with configuration not referring to any other tools other than
   `zsh` itself and some OS options, such as making a proxy setting.
