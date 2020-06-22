# setup

[![test](https://github.com/sasaplus1/setup/workflows/test/badge.svg)](https://github.com/sasaplus1/setup/actions?query=workflow%3Atest)
[![Build Status](https://travis-ci.com/sasaplus1/setup.svg?branch=master)](https://travis-ci.com/sasaplus1/setup)

setup scripts for my environment

## How to setup

execute command the below if Ubuntu:

```console
$ sudo apt update --yes
$ sudo apt install --yes build-essential curl file git
```

execute command the below if macOS:

```console
$ xcode-select --install
```

setup my environment:

```console
$ make setup
```

## Setup without repository

```console
$ curl -L https://git.io/sasaplus1-setup -o Makefile
$ make setup
```

## Related

- [dotfiles](https://github.com/sasaplus1/dotfiles)

## License

The MIT license.
