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
1)  Key pair          12) Ghostty          22) Postman
2)  ZSH               13) iTerm2           23) Insomnia
3)  Git config        14) Atom             24) Clocker
4)  Homebrew          15) IntelliJ         25) Claude Code
5)  Update Homebrew   16) Webstorm         26) jq
6)  Ruby related      17) Docker           27) Bash profile
7)  Python related    18) Docker Compose   28) Git aliases
8)  NVM               19) Colima           29) Neovim
9)  Node              20) Google Chrome    30) Neovim config
10) Yarn              21) Zoom             31) Heroku toolbelt
11) Dotnet                                 32) Exit
```

Some options (Ruby, Python, Bash profile) open a sub-menu with further choices. Select **Exit** from any menu to return to the parent menu, or exit the script.
