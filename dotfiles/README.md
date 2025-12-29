# Dotfiles

This directory contains configuration files (dotfiles) for various tools that will be installed using GNU stow.

## Structure

Each subdirectory represents a "package" that can be installed with stow. The structure mirrors your home directory:

```
dotfiles/
├── spectrwm/           # spectrwm window manager configuration
│   └── .config/
│       └── spectrwm/
│           ├── spectrwm.conf
│           └── baraction.sh
├── polybar/            # polybar status bar configuration
│   └── .config/
│       └── polybar/
│           ├── config.ini
│           └── launch.sh
└── X11/                # X.org initialization
    └── .xinitrc
```

## How to Use

The setup script (`setup.sh`) will automatically stow all packages from this directory. Alternatively, you can manually stow individual packages:

```bash
cd dotfiles
stow -t ~ spectrwm    # Install spectrwm config
stow -t ~ polybar     # Install polybar config
stow -t ~ X11         # Install .xinitrc
```

## Adding Your Own Dotfiles

To add your own configurations:

1. Create a new directory for your tool (e.g., `alacritty`)
2. Inside it, create the directory structure as it would appear in your home directory
3. Place your config files in the appropriate location
4. Run stow to symlink them: `stow -t ~ alacritty`

### Example: Adding Alacritty Configuration

```bash
mkdir -p dotfiles/alacritty/.config/alacritty
cp ~/.config/alacritty/alacritty.yml dotfiles/alacritty/.config/alacritty/
cd dotfiles
stow -t ~ alacritty
```

## Unstowing (Removing Symlinks)

To remove symlinks created by stow:

```bash
cd dotfiles
stow -D -t ~ spectrwm  # Remove spectrwm symlinks
```

## Customization

Feel free to customize the provided configurations:

- **spectrwm.conf**: Keybindings, colors, workspace settings
- **polybar/config.ini**: Bar appearance, modules, colors
- **.xinitrc**: Startup programs, environment variables

After making changes, the configurations will be automatically picked up due to the symlinks created by stow.
