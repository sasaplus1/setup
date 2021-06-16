# setup

[![test](https://github.com/sasaplus1/setup/workflows/test/badge.svg)](https://github.com/sasaplus1/setup/actions?query=workflow%3Atest)
[![Build Status](https://travis-ci.com/sasaplus1/setup.svg?branch=master)](https://travis-ci.com/sasaplus1/setup)

setup scripts and note for my environment

## How to setup

execute command the below if Ubuntu:

```console
$ sudo apt --yes update
$ sudo apt --yes install build-essential curl file git
```

install [Xcode](https://apps.apple.com/jp/app/xcode/id497799835) if macOS.

setup my environment:

```console
$ make setup
```

## Setup without repository

```console
$ curl -L https://git.io/sasaplus1-setup -o Makefile
$ make setup
```

## Tasks

<details>

<summary>Install GUI applications for macOS</summary>

- [ ] [Alfred](https://www.alfredapp.com/)
- [ ] [Android SDK Platform-Tools](https://developer.android.com/studio/releases/platform-tools)
- [ ] [Bitwarden](https://bitwarden.com/)
- [ ] [Docker Desktop](https://www.docker.com/products/docker-desktop)
- [ ] [Firefox](https://www.mozilla.org/firefox/new/)
- [ ] [Firefox Developer Edition](https://www.mozilla.org/firefox/developer/)
- [ ] [Google Chrome](https://www.google.com/chrome/)
- [ ] [Google Chrome Canary](https://www.google.com/chrome/canary/)
- [ ] [Kap](https://getkap.co/)
- [ ] [Safari Technology Preview](https://developer.apple.com/safari/technology-preview/)
- [ ] [Sketch](https://www.sketch.com/)
- [ ] [Skitch](https://evernote.com/products/skitch)
- [ ] [Slate](https://github.com/jigish/slate)
- [ ] [VirtualBox](https://www.virtualbox.org/)
- [ ] [Visual Studio Code](https://code.visualstudio.com/)

</details>

<details>

<summary>Import browser bookmarks and install browser extensions</summary>

- [ ] Firefox Bookmarks
- [ ] Chrome Bookmarks
- Firefox Addons
    - [ ] [Bitwarden](https://addons.mozilla.org/ja/firefox/addon/bitwarden-password-manager/)
    - [ ] [Firefox Multi-Account Containers](https://addons.mozilla.org/ja/firefox/addon/multi-account-containers/)
    - [ ] [Mouse Dictionry](https://addons.mozilla.org/ja/firefox/addon/mousedictionary/)
    - [ ] [OctoLinker](https://addons.mozilla.org/ja/firefox/addon/octolinker/)
    - [ ] [Simple Translate](https://addons.mozilla.org/ja/firefox/addon/simple-translate/)
    - [ ] [Switch Container](https://addons.mozilla.org/ja/firefox/addon/switch-container/)
- Chrome Extensions
    - [ ] [Google Analytics Debugger](https://chrome.google.com/webstore/detail/google-analytics-debugger/jnkmfdileelhofjcijamephohjechhna)
    - [ ] [ChromeLens](https://chrome.google.com/webstore/detail/chromelens/idikgljglpfilbhaboonnpnnincjhjkd)
    - [ ] [Google 翻訳](https://chrome.google.com/webstore/detail/google-translate/aapbdbdomjkkjkaonfhkkikfgjllcleb)
    - [ ] [LTTM](https://chrome.google.com/webstore/detail/lttm/jdidcgkdggndpodjbipodfefnpgjooeh)
    - [ ] [ModHeader](https://chrome.google.com/webstore/detail/modheader/idgpnmonknjnojddfkpgkljpfnnfcklj)
    - [ ] [OctoLinker](https://chrome.google.com/webstore/detail/octolinker/jlmafbaeoofdegohdhinkhilhclaklkp)
    - [ ] [Proxy Helper](https://chrome.google.com/webstore/detail/proxy-helper/mnloefcpaepkpmhaoipjkpikbnkmbnic)
    - [ ] [Proxy SwitchyOmega](https://chrome.google.com/webstore/detail/proxy-switchyomega/padekgcemlokbadohgkifijomclgjgif)
    - [ ] [React Developer Tools](https://chrome.google.com/webstore/detail/react-developer-tools/fmkadmapgofadopljbjfkapdkoienihi)
    - [ ] [Redux DevTools](https://chrome.google.com/webstore/detail/redux-devtools/lmhkpmbekcpmknklioeibfkpmmfibljd)
    - [ ] [Web Vitals](https://chrome.google.com/webstore/detail/web-vitals/ahfhijdlegdabablpippeagghigmibma)

</details>

<details>

<summary>Change configurations and copy files</summary>

- [ ] System Preferences
- [ ] Set `キーボード => ユーザ辞書`
- [ ] Copy `~/.ssh/config`
- [ ] Copy `$HOME` files

</details>

<details>

<summary>Install PWA with Google Chrome</summary>

- [Amazon Music](https://music.amazon.co.jp/)
- [SoundCloud](https://soundcloud.com/)
- [YouTube Music](https://music.youtube.com/)

</details>

<details>

<summary>Download virtual machines if needed</summary>

- [Virtual Machines](https://developer.microsoft.com/en-us/microsoft-edge/tools/vms/)
    - [(ja)](https://developer.microsoft.com/ja-jp/microsoft-edge/tools/vms/)

</details>

## Related

- [dotfiles](https://github.com/sasaplus1/dotfiles)
- [macos-bash](https://github.com/sasaplus1/macos-bash)
- [macos-tmux](https://github.com/sasaplus1/macos-tmux)
- [macos-vim](https://github.com/sasaplus1/macos-vim)

## License

The MIT license.
