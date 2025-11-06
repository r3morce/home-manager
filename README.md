# Home Manager Configuration

My declarative dotfiles and system configuration using Nix Home Manager.

## Prerequisites

- **Nix package manager** with flakes enabled
  ```bash
  sh <(curl -L https://nixos.org/nix/install) --daemon
  ```

- **Home Manager** installed
  ```bash
  nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
  nix-channel --update
  nix-shell '<home-manager>' -A install
  ```

## Setup

1. **Clone this repository**
   ```bash
   git clone https://github.com/r3morce/home-manager ~/.config/home-manager
   cd ~/.config/home-manager
   ```

2. **Create your private configuration**
   ```bash
   cp private.nix.example private.nix
   # Edit private.nix with your git name/email
   ```

3. **Apply configuration**
   ```bash
   home-manager switch
   ```

## Making Changes

### Add a new package
Edit `home.nix`:
```nix
home.packages = with pkgs; [
  # Add your package here
  neofetch
];
```

### Configure a program
Add to `home.nix`:
```nix
programs.git = {
  enable = true;
  userName = "Your Name";
};
```

### Add a dotfile
```nix
home.file = {
  ".config/myapp".source = ./myapp;
};
```

### Apply changes
```bash
home-manager switch
```

## Structure

```
.
├── home.nix              # Main entry point
├── private.nix           # Private config (git-ignored)
├── private.nix.example   # Template for private config
├── modules/              # Modular configuration
├── config/               # Actual dotfiles
│   ├── nvim/             # Neovim/LazyVim config
│   └── wezterm/          # Wezterm config
├── zshrc                 # Zsh configuration file
└── p10k.zsh              # Powerlevel10k theme
```

## What's Included

- **Editor**: Neovim with LazyVim
- **Terminal**: Wezterm
- **Shell**: Zsh with Powerlevel10k
- **CLI Tools**: bat, eza, fzf, ripgrep, fd, zoxide
- **Dev Tools**: git, gh, lazygit, docker-compose

## Rollback

If something breaks:
```bash
home-manager generations
home-manager switch --rollback
```

## Notes

- `private.nix` contains sensitive info (not tracked)
- Use `private.nix.example` as template
- Never commit SSH keys or tokens
