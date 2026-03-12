# osx-setup
A tool for provisioning a box-fresh MacOSX machine.

## Prerequisites: Getting Git on a fresh Mac

Before you can clone this repo, you need Git. On a fresh Mac, the quickest way is to install the Xcode Command Line Tools:

```sh
xcode-select --install
```

A dialog will appear asking you to install the tools — follow the prompts. Once complete, Git will be available and you can clone this repo:

```sh
git clone git@github.com:JoeWroe/osx-setup.git
cd osx-setup
./osx-setup.sh your@email.com
```

## Usage

Run the script with your email address as the only argument:

```sh
./osx-setup.sh your@email.com
```

You'll be presented with a numbered menu. Enter the number of the tool you want to install:

```
1) Key pair          11) Dotnet           21) Zoom
2) ZSH               12) Heroku toolbelt  22) Postman
3) Git               13) Ghostty          23) Insomnia
4) Homebrew          14) iTerm2           24) Clocker
5) Update Homebrew   15) Atom             25) Claude Code
6) Ruby related      16) IntelliJ         26) jq
7) Python related    17) Webstorm         27) Bash profile
8) NVM               18) Docker           28) Git aliases
9) Node              19) Docker Compose   29) Neovim
10) Yarn             20) Colima           30) Neovim config
                                          31) Google Chrome
                                          32) Spectacle
                                          33) Exit
```

Some options (Ruby, Python, Bash profile) open a sub-menu with further choices. Select **Exit** from any menu to return to the parent menu, or exit the script.
