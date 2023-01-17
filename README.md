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

- [ ] [Bitwarden](https://bitwarden.com/)
- [ ] [Docker Desktop](https://www.docker.com/products/docker-desktop)
- [ ] [Google Chrome Canary](https://www.google.com/chrome/canary/)
- [ ] [Google Chrome](https://www.google.com/chrome/)
- [ ] [Kap](https://getkap.co/)
- [ ] [MeetingBar](https://meetingbar.onrender.com/)
- [ ] [Rectangle](https://rectangleapp.com/)
- [ ] [Safari Technology Preview](https://developer.apple.com/safari/technology-preview/)
- [ ] [Simplenote](https://simplenote.com/)
- [ ] [Skitch](https://evernote.com/products/skitch)
- [ ] [Vagrant](https://www.vagrantup.com/)
- [ ] [VirtualBox](https://www.virtualbox.org/)
- [ ] [Visual Studio Code](https://code.visualstudio.com/)
- [ ] [WezTerm](https://wezfurlong.org/wezterm/)

Download Google Chrome with curl:

```console
$ curl -fsSL 'https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg' -o googlechrome.dmg
```

</details>

<details>

<summary>Configure browser, import browser bookmarks and install browser extensions</summary>

- [ ] Firefox configurations
- [ ] Firefox bookmarks
- Firefox extensions
    - [ ] [CopyTabTitleUrl](https://addons.mozilla.org/ja/firefox/addon/copytabtitleurl/)
    - [ ] [Firefox Multi-Account Containers](https://addons.mozilla.org/ja/firefox/addon/multi-account-containers/)
    - [ ] [Mouse Dictionry](https://addons.mozilla.org/ja/firefox/addon/mousedictionary/)
    - [ ] [OctoLinker](https://addons.mozilla.org/ja/firefox/addon/octolinker/)
    - [ ] [Simple Translate](https://addons.mozilla.org/ja/firefox/addon/simple-translate/)
    - [ ] [Switch Container](https://addons.mozilla.org/ja/firefox/addon/switch-container/)
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
    - [ ] [uBlacklist](https://chrome.google.com/webstore/detail/ublacklist/pncfbmialoiaghdehhbnbhkkgmjanfhe)
        - [ ] [ublacklist-github-translation](https://github.com/arosh/ublacklist-github-translation)
        - [ ] [ublacklist-stackoverflow-translation](https://github.com/arosh/ublacklist-stackoverflow-translation)
        - [ ] [uBlacklist-wiki-copy-sites](https://github.com/HO-0520-IT/uBlacklist-wiki-copy-sites/)
        - [ ] [ublacklist-programming-school](https://github.com/108EAA0A/ublacklist-programming-school)
        - [ ] [ublacklist-company-game-wiki](https://github.com/108EAA0A/ublacklist-company-game-wiki)
    - [ ] [Web Vitals](https://chrome.google.com/webstore/detail/web-vitals/ahfhijdlegdabablpippeagghigmibma)

</details>

<details>

<summary>Install Visual Studio Code extensions</summary>

- [ ] [Quit Control for VSCode](https://marketplace.visualstudio.com/items?itemName=artdiniz.quitcontrol-vscode)

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
- [Slack](https://slack.com)
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
- [download-gh.sh](https://github.com/sasaplus1/download-gh.sh)
- [macos-bash](https://github.com/sasaplus1/macos-bash)
- [macos-tmux](https://github.com/sasaplus1/macos-tmux)
- [macos-vim](https://github.com/sasaplus1/macos-vim)

## License

The MIT license.
