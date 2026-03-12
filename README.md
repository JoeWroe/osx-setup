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

You'll be presented with a top-level menu of categories. Select a category to enter its sub-menu:

```
1) System        3) Terminal       5) Infrastructure  7) CLI Tools
2) Languages     4) Editors & IDEs 6) Apps            8) Exit
```

Each category opens a sub-menu:

**System** — Key pair, ZSH, Git config, Homebrew, Update Homebrew, Bash profile

**Languages** — Ruby related tools, Javascript related tools, Python related tools, C# related tools
- Each language opens its own sub-menu of packages and version managers

**Terminal** — Ghostty, iTerm2, Neovim, Neovim config, Claude Code

**Editors & IDEs** — Atom, IntelliJ, Webstorm

**Infrastructure** — Containerisation tools, Heroku toolbelt
- Containerisation tools: Docker, Docker Compose, Colima

**Apps** — Google Chrome, Zoom, Clocker, Postman, Insomnia

**CLI Tools** — jq, Git aliases

Select **Exit** from any sub-menu to return to the parent menu.
