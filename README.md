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
└── config/               # Actual dotfiles
```

## Rollback

If something breaks:
```bash
home-manager generations
home-manager switch --rollback
```

## Known Issues

### Alacritty
- **Issue**: Alacritty from nixpkgs (v0.16.1) has Wayland display handle compatibility issues
- **Workaround**: Currently disabled in home-manager. Use system package manager (pacman) instead
- **Status**: Configuration file (`~/.config/alacritty/alacritty.toml`) is still managed by home-manager
- **Future**: Will re-enable when a fixed version is available in nixpkgs

## Notes

- `private.nix` contains sensitive info (not tracked)
- Use `private.nix.example` as template
- Never commit SSH keys or tokens
