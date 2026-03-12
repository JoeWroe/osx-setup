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
1)  Key pair          12) Heroku toolbelt  23) Zoom
2)  ZSH               13) Ghostty          24) Postman
3)  Git               14) iTerm2           25) Insomnia
4)  Homebrew          15) Atom             26) Clocker
5)  Update Homebrew   16) IntelliJ         27) Claude Code
6)  Ruby related      17) Webstorm         28) jq
7)  Python related    18) Docker           29) Bash profile
8)  NVM               19) Docker Compose   30) Git aliases
9)  Node              20) Colima           31) Neovim
10) Yarn              21) Google Chrome    32) Neovim config
11) Dotnet            22) Spectacle        33) Exit
```

Some options (Ruby, Python, Bash profile) open a sub-menu with further choices. Select **Exit** from any menu to return to the parent menu, or exit the script.
