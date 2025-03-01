# setup

[![test](https://github.com/sasaplus1/setup/workflows/test/badge.svg)](https://github.com/sasaplus1/setup/actions?query=workflow%3Atest)

setup scripts and note for my environment

## How to setup

### Ubuntu

execute command the below if Ubuntu:

```console
$ sudo apt --yes update
$ sudo apt --yes install build-essential curl file git
```

[AppImage needs libfuse2](https://docs.appimage.org/user-guide/troubleshooting/fuse.html):

```console
$ sudo apt --yes install libfuse2
```

### macOS

install [Xcode](https://apps.apple.com/jp/app/xcode/id497799835) and [MacPorts](https://www.macports.org/) if macOS.

If you don't want to install Xcode, install CommandLineTools instead:

```console
$ sudo rm -rf /Library/Developer/CommandLineTools
$ sudo xcode-select --install
$ sudo xcode-select --switch /Library/Developer/CommandLineTools
```

### Setup

setup my environment:

```console
$ make setup
$ make install-ports # or make install-apt-packages
```

## Setup without repository

```console
$ curl -L https://git.io/sasaplus1-setup -o Makefile
$ make setup
$ make install-ports # or make install-apt-packages
```

## Tasks

<details>

<summary>Install browser and password manager extension</summary>

- [ ] [Firefox Developer Edition](https://www.mozilla.org/ja/firefox/developer/)
- Firefox addons
    - [ ] [Bitwarden](https://addons.mozilla.org/ja/firefox/addon/bitwarden-password-manager/)

Download with curl:

```console
$ curl -fsSL 'https://download.mozilla.org/?product=firefox-devedition-latest-ssl&os=osx&lang=ja-JP-mac' -o firefox.dmg
```

</details>

<details>

<summary>Change default shell</summary>

```console
$ chsh -s /bin/bash
```

</details>

<details>

<summary>Change directory names in home directory for Ubuntu</summary>

```console
$ LANG=C xdg-user-dirs-gtk-update --force
```

</details>

<details>

<summary>Change UI keybind to Emacs for GNOME on Ubuntu</summary>

```console
$ gsettings set org.gnome.desktop.interface gtk-key-theme Emacs
```

</details>

<details>

<summary>Create SSH key</summary>

```console
$ mkdir ~/.ssh
$ chmod 0700 ~/.ssh
$ cd ~/.ssh
$ ssh-keygen -t ed25519 -C '[email]' -f [service]_id_ed25519
```

</details>

<details>

<summary>Register public key to GitHub</summary>

```console
$ gh auth login
$ gh auth refresh -h github.com -s admin:public_key
$ gh ssh-key add -t '[email] / [hostname]' key.pub
```

if you can't use `gh` at this time, use [download-gh.sh](https://github.com/sasaplus1/download-gh.sh).

</details>

<details>

<summary>Create .ssh/config</summary>

```sshconfig
Host github.com
    Compression yes
    HostName github.com
    IdentitiesOnly yes
    IdentityFile ~/.ssh/key
    User git
```

</details>

<details>

<summary>Setup dotfiles</summary>

```console
$ mkdir -p ~/.ghq/github.com/sasaplus1
$ cd $_
$ git clone ssh://git@github.com/sasaplus1/dotfiles.git
$ cd dotfiles
$ less README.md
$ # setup dotfiles
```

</details>

<details>

<summary>Install applications for macOS</summary>

- [ ] [Arc](https://arc.net/)
- [ ] [Bitwarden](https://bitwarden.com/)
- [ ] [Docker Desktop](https://www.docker.com/products/docker-desktop)
- [ ] [Google Chrome](https://www.google.com/chrome/)
- [ ] [MeetingBar](https://meetingbar.onrender.com/)
- [ ] [Rectangle](https://rectangleapp.com/)
- [ ] [Simplenote](https://simplenote.com/)
- [ ] [Velja](https://sindresorhus.com/velja)
- [ ] [WezTerm](https://wezfurlong.org/wezterm/)

</details>

<details>

<summary>Configure browser, import browser bookmarks and install browser extensions</summary>

- [ ] Arc configurations
- Arc extensions
    - see Chrome extensions list
- [ ] Firefox configurations
- [ ] Firefox bookmarks
- Firefox extensions
    - [Bitwarden](https://addons.mozilla.org/ja/firefox/addon/bitwarden-password-manager/)
    - [ ] [CopyTabTitleUrl](https://addons.mozilla.org/ja/firefox/addon/copytabtitleurl/)
    - [ ] [Dark Reader](https://addons.mozilla.org/ja/firefox/addon/darkreader/)
    - [ ] [Mouse Dictionry](https://addons.mozilla.org/ja/firefox/addon/mousedictionary/)
    - [ ] [Simple Translate](https://addons.mozilla.org/ja/firefox/addon/simple-translate/)
    - [ ] [uBlacklist](https://addons.mozilla.org/ja/firefox/addon/ublacklist/)
        - [ ] [ublacklist-github-translation](https://github.com/arosh/ublacklist-github-translation)
        - [ ] [ublacklist-stackoverflow-translation](https://github.com/arosh/ublacklist-stackoverflow-translation)
        - [ ] [uBlacklist-wiki-copy-sites](https://github.com/HO-0520-IT/uBlacklist-wiki-copy-sites/)
        - [ ] [ublacklist-programming-school](https://github.com/108EAA0A/ublacklist-programming-school)
        - [ ] [ublacklist-company-game-wiki](https://github.com/108EAA0A/ublacklist-company-game-wiki)
- [ ] Chrome configurations
- [ ] Chrome bookmarks
- Chrome extensions
    - [ ] [Bitwarden](https://chrome.google.com/webstore/detail/bitwarden-free-password-m/nngceckbapebfimnlniiiahkandclblb)
    - [ ] [CopyTabTitleUrl](https://chrome.google.com/webstore/detail/copytabtitleurl/lmgbdjfoaihhgdphombpgjpaohjfeapp)
    - [ ] [Dark Reader](https://chrome.google.com/webstore/detail/dark-reader/eimadpbcbfnmbkopoojfekhnkhdbieeh)
    - [ ] [Mouse Dictionry](https://chromewebstore.google.com/detail/mouse-dictionary/dnclbikcihnpjohihfcmmldgkjnebgnj)
    - [ ] [Simple Translate](https://chromewebstore.google.com/detail/simple-translate/ibplnjkanclpjokhdolnendpplpjiace)
    - [ ] [uBlacklist](https://chrome.google.com/webstore/detail/ublacklist/pncfbmialoiaghdehhbnbhkkgmjanfhe)
        - [ ] [ublacklist-github-translation](https://github.com/arosh/ublacklist-github-translation)
        - [ ] [ublacklist-stackoverflow-translation](https://github.com/arosh/ublacklist-stackoverflow-translation)
        - [ ] [uBlacklist-wiki-copy-sites](https://github.com/HO-0520-IT/uBlacklist-wiki-copy-sites/)
        - [ ] [ublacklist-programming-school](https://github.com/108EAA0A/ublacklist-programming-school)
        - [ ] [ublacklist-company-game-wiki](https://github.com/108EAA0A/ublacklist-company-game-wiki)

</details>

<details>

<summary>Install gh extensions</summary>

- [ ] [gh-copilot](https://github.com/github/gh-copilot)
- [ ] [gh-dash](https://github.com/dlvhdr/gh-dash)
- [ ] [gh-poi](https://github.com/seachicken/gh-poi)

</details>

<details>

<summary>Change configurations and copy files</summary>

- [ ] System Preferences
- [ ] Set `キーボード => ユーザ辞書`
- [ ] Copy `~/.ssh/config`
- [ ] Copy `$HOME` files

</details>

## Related

- [dotfiles](https://github.com/sasaplus1/dotfiles)
- [download-gh.sh](https://github.com/sasaplus1/download-gh.sh)
- [macos-bash](https://github.com/sasaplus1/macos-bash)
- [macos-tmux](https://github.com/sasaplus1/macos-tmux)
- [macos-vim](https://github.com/sasaplus1/macos-vim)

## License

The MIT license.
