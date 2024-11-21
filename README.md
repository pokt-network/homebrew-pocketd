# homebrew-poktroll <!-- omit in toc -->

A homebrew tap formula for the poktroll binary

- [Getting Started](#getting-started)
- [Installation](#installation)
  - [Install Homebrew](#install-homebrew)
    - [MacOS](#macos)
    - [Linux](#linux)
  - [Install Poktrolld](#install-poktrolld)
- [Check Poktrolld](#check-poktrolld)
- [Homebrew Formula Development](#homebrew-formula-development)
  - [Update Formula](#update-formula)
  - [Testing the Formula locally](#testing-the-formula-locally)

## Getting Started

These instructions will get you a copy of `poktrolld` on your local machine.

## Installation

### Install Homebrew

Follow the official instructions [here](https://brew.sh/).

#### MacOS

To install Homebrew on Mac:

```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

#### Linux

To install Homebrew on Linux:

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
```

You might need to run the following commands afterwards:

```bash
echo >> /home/${USER}/.bashrc
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/${USER}/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
sudo apt-get install build-essential
```

### Install Poktrolld

To install `poktrolld` using brew, run the following commands:

```bash
brew tap pokt-network/poktroll
brew install poktrolld
```

## Check Poktrolld

Make sure that the installation was successful by running the following command:

```bash
poktrolld --help
```

You can check the latest version by running:

```bash
poktrolld version
```

## Homebrew Formula Development

### Update Formula

To update the formula, simply run the following command with the new version of the binary:

For example, to update to version RC-0.12.0:

```bash
make tap_update_version
```

### Testing the Formula locally

Installing poktrolld:

```bash
make tap_test_install
```

Reinstalling poktrolld:

```bash
make tap_test_reinstall
```
