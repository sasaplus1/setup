# setup

setup scripts and notes for my environment

## How to setup

### macOS

#### Setup system preferences

Setting system preferences manually :(

#### Change default shell

```sh
$ chsh -s /bin/bash
```

#### Setup Xcode

install [Xcode](https://apps.apple.com/jp/app/xcode/id497799835) via AppStore.

if you don't want to install Xcode, install CommandLineTools instead:

```sh
$ sudo rm -rf /Library/Developer/CommandLineTools
$ sudo xcode-select --install
$ sudo xcode-select --switch /Library/Developer/CommandLineTools
```

accept license via CLI:

```sh
$ sudo xcodebuild -license accept
```

```sh
$ gh auth login --skip-ssh-key
```

```sh
$ export GH_ROOT="$HOME/.ghq"
$ ghq get -p sasaplus1/{dotfiles,setup}
```

<!--

### Ubuntu

execute command the below if Ubuntu:

```sh
$ sudo apt --yes update
$ sudo apt --yes install build-essential curl file git
```

[AppImage needs libfuse2](https://docs.appimage.org/user-guide/troubleshooting/fuse.html):

```console
$ sudo apt --yes install libfuse2
```

-->

### Bootstrap

### Setup

setup my environment:

```console
$ make setup
```

## Tasks

<details><summary>Install browser and password manager extension</summary>

- [ ] [Firefox Developer Edition](https://www.mozilla.org/ja/firefox/developer/)
- Firefox addons
    - [ ] [Bitwarden](https://addons.mozilla.org/ja/firefox/addon/bitwarden-password-manager/)

Download with curl:

```console
$ curl -fsSL 'https://download.mozilla.org/?product=firefox-devedition-latest-ssl&os=osx&lang=ja-JP-mac' -o firefox.dmg
```

https://download.mozilla.org/?product=firefox-latest-ssl&os=osx&lang=ja-JP-mac

</details>

<details><summary>Configure browser, import browser bookmarks and install browser extensions</summary>

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

## Related

- [dotfiles](https://github.com/sasaplus1/dotfiles)
- [download-gh.sh](https://github.com/sasaplus1/download-gh.sh)
- [macos-bash](https://github.com/sasaplus1/macos-bash)
- [macos-tmux](https://github.com/sasaplus1/macos-tmux)
- [macos-vim](https://github.com/sasaplus1/macos-vim)

## License

The MIT license.
