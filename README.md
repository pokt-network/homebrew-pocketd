# homebrew-poktroll <!-- omit in toc -->

A homebrew tap formula for the poktroll binary

- [Getting Started](#getting-started)
- [Installation](#installation)
  - [Homebrew](#homebrew)
  - [Poktrolld](#poktrolld)
- [Development](#development)
  - [Update Formula](#update-formula)

## Getting Started

These instructions will get you a copy of `poktroll` on your local machine.

## Installation

### Homebrew

To install Homebrew on Mac:

```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

To install Homebrew on Linux:

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
```

### Poktrolld

To install `poktrolld` using brew, run the following commands:

```bash
brew tap pokt-network/poktrolld
brew install poktroll
```

And to start pocket core you can simply run:

```bash
poktrolld start
```

If everything works, a terminal prompt asking for a coinbase passphrase should appear.

## Development

### Update Formula

To update the formula, simply run the following command with the new version of the binary:

For example, to update to version RC-0.12.0:

```bash
./update_brew.sh RC-0.12.0
```
