# Search Mullvad Leta from the CLI

`leta-searcher` is an unofficial simple python script that allows you to search the web using the [Mullvad Leta](https://leta.mullvad.net/) from the CLI.

There are many search engines out there, and so there are other similar tools for those engines like [googler](https://github.com/jarun/googler) and [ddgr](https://github.com/jarun/ddgr). This tool aims to be something similar, but for Leta.

Currently, `leta-searcher` is just a tool to dump urls from the query results, and is expanded by `search` a shell script to allow interactions with [rofi](https://github.com/davatorium/rofi) or [fzf](https://github.com/junegunn/fzf).

## Features

- Search the web using Leta's available engines (Brave or Google)
- Search using page numbers

## Requirements

```
python3
python-beautifulsoup4
python-requests
```

### Optional Requirements

```
rofi
fzf
lynx
```

## Installation

```bash
git clone https://github.com/aocoronel/search-sh
chmod +x search-sh/src/leta-searcher.py
chmod +x search-sh/src/search
sudo cp search-sh/src/leta-searcher.py /usr/local/bin/
sudo cp search-sh/src/search /usr/local/bin/
```

Or, you can try it using the `nix` package manager.

```bash
nix run https://github.com/aocoronel/search-sh
```

## Usage

```
Leta Searcher

Usage:
  leta-searcher.py [-h] [-p PAGE] [-e {brave,google}] [-v] query

Positional arguments:
  query                 The search query. Example: python search.py 'my search terms'

Options:
  -h, --help            Display this message and exit
  -p, --page PAGE       Page number for the search results (default: 1)
  -e, --engine {brave,google}
                        Search engine to use (choices: brave, google; default: brave)
  -v, --version         Show version number and exit
```

### Examples

#### Leta Searcher

To query `mullvad leta`.

```bash
python leta-searcher.py mullvad leta
```

To query `mullvad leta` page 2.

```bash
python leta-searcher.py -p 2 mullvad leta
```

#### Searcher

To interactively search using `rofi`. Query is not required.

```bash
search
```

To interactively search using `fzf`. Requires a query.

```bash
search -s mullvad leta
```

## Notes

This script has been tested exclusively on a Linux machine.

## License

This repository is licensed under the MIT License, allowing for extensive use, modification, copying, and distribution.
