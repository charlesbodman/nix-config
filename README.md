# nix-config

Declarative macOS system configuration using [nix-darwin](https://github.com/LnL7/nix-darwin) and [Home Manager](https://github.com/nix-community/home-manager), managed as a Nix flake.

## Overview

This repo defines the entire system configuration for `cbodman-macbook` (Apple Silicon) — from system packages and macOS defaults to shell tooling, dotfiles, and Homebrew apps — all in version-controlled Nix expressions.

## Structure

| File | Purpose |
|------|---------|
| [`flake.nix`](./flake.nix) | Flake entrypoint; defines inputs (nixpkgs, nix-darwin, home-manager) and the `darwinConfigurations` output |
| [`configuration.nix`](./configuration.nix) | System-level config: packages, macOS defaults, keyboard remapping, fonts |
| [`brew.nix`](./brew.nix) | Homebrew formulas and casks managed declaratively via nix-darwin |
| [`home.nix`](./home.nix) | User-level config via Home Manager: packages, shell, git, aliases, mise, starship |

## What's Managed

### System (nix-darwin)
- **Packages**: `vim`, `git`
- **macOS defaults**: Dark mode, Dock autohide, Finder shows extensions, fast key repeat
- **Keyboard**: Caps Lock → Control, Control → Caps Lock
- **Fonts**: JetBrains Mono Nerd Font
- **Nix**: Flakes and nix-command experimental features enabled

### Homebrew (brew.nix)
Homebrew is managed declaratively. Activation runs with `cleanup = "zap"` — anything not listed here will be removed.

**Formulas (CLI tools)**
- `helm` — Kubernetes package manager
- `glab` — GitLab CLI
- `mkcert` — Local trusted certificates
- `nss` — Network Security Services (required by mkcert)
- `dtop` — Docker-aware top
- `tokei` — Code statistics
- `git-cliff` — Changelog generator

**Casks (GUI apps)**
- `ghostty` — Terminal emulator
- `google-chrome` — Browser
- `cursor` — AI code editor
- `1password` — Password manager
- `obsidian` — Note-taking
- `tableplus` — Database GUI
- `rancher` — Container management (provides Docker, kubectl, helm via `~/.rd/bin`)

### Home Manager (home.nix)
**Packages**
- `ripgrep`, `fd`, `fzf` — Fast search tools
- `htop` — Process monitor
- `kubectl`, `k3d`, `k9s` — Kubernetes tooling
- `google-cloud-sdk` — GCP CLI
- `azure-cli` — Azure CLI
- `neovim` — Editor (`vim` aliased to `nvim`)
- `gh` — GitHub CLI
- `sops` — Secrets management
- `antigravity-cli` — AI coding assistant
- `1password-cli` — 1Password CLI

**Shell (zsh)**
- Syntax highlighting and autosuggestions enabled
- Homebrew added to `PATH` via `initContent`
- Starship prompt with 1s command timeout
- z-lua for fast directory jumping

**Aliases**
| Alias | Command |
|-------|---------|
| `nixswitch` | Rebuild and switch the system configuration |
| `gs` | `git status` |
| `gcb` | Fuzzy-checkout a local branch |
| `gcrb` | Fuzzy-checkout a remote branch |
| `gwip` | Stage all and commit as WIP |
| `vim` | `nvim` |
| `ll` | `ls -l` |

**Tool versions (mise)**
- Node.js `26.3.0`
- uv `0.11.20`
- `@devcontainers/cli` `0.87.0`

## Applying the Configuration

```bash
nixswitch
# expands to:
sudo darwin-rebuild switch --flake ~/.config/nix-config/.#cbodman-macbook
```

## Prerequisites

1. Install Nix with flakes support
2. Install [nix-darwin](https://github.com/LnL7/nix-darwin#install)
3. Install [Homebrew](https://brew.sh) (required for `brew.nix`)

## Flake Inputs

| Input | Source |
|-------|--------|
| `nixpkgs` | `github:NixOS/nixpkgs/nixpkgs-unstable` |
| `nix-darwin` | `github:LnL7/nix-darwin` |
| `home-manager` | `github:nix-community/home-manager` |
