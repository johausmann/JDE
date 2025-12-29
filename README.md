# JDE - Jo's Desktop Environment

A minimal Arch Linux desktop environment setup using spectrwm and polybar.

## Features

- **Window Manager**: spectrwm - A minimal tiling window manager
- **Status Bar**: polybar - A customizable status bar
- **Dotfiles Management**: GNU stow for easy configuration management
- **Compositor**: picom for transparency and effects
- **Terminal**: alacritty as the default terminal emulator
- **Application Launcher**: dmenu for quick application launching

## Requirements

- A minimal Arch Linux installation
- Internet connection for package installation
- Basic understanding of terminal commands

## Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/johausmann/JDE.git
   cd JDE
   ```

2. Run the main setup script:
   ```bash
   ./setup.sh
   ```

   This will:
   - Install all required packages (X.org, spectrwm, polybar, etc.)
   - Set up dotfiles using GNU stow

3. Start the desktop environment:
   ```bash
   startx
   ```

## Manual Installation

If you prefer to run the setup scripts individually:

```bash
# Install system packages
./setup/01-install-packages.sh

# Setup dotfiles
./setup/02-setup-dotfiles.sh
```

## Directory Structure

```
JDE/
├── setup.sh                    # Main setup script
├── setup/
│   ├── 01-install-packages.sh  # Package installation script
│   └── 02-setup-dotfiles.sh    # Dotfiles setup script
└── dotfiles/                   # Configuration files
    ├── spectrwm/               # spectrwm configuration
    ├── polybar/                # polybar configuration
    └── X11/                    # X.org initialization
```

## Customization

All configuration files are located in the `dotfiles/` directory and are managed with GNU stow. See `dotfiles/README.md` for more information on managing your dotfiles.

### Key Bindings (Default)

- `Super + Enter`: Open terminal
- `Super + d`: Application launcher (dmenu)
- `Super + Shift + q`: Quit spectrwm
- `Super + Shift + r`: Restart spectrwm
- `Super + Shift + c`: Close window
- `Super + j/k`: Focus next/previous window
- `Super + h/l`: Resize master area
- `Super + 1-9`: Switch to workspace
- `Super + Shift + 1-9`: Move window to workspace

## Adding More Dotfiles

To add your own configuration files, create a new directory in `dotfiles/` with the appropriate structure and run:

```bash
cd dotfiles
stow -t ~ your-package-name
```

See `dotfiles/README.md` for detailed instructions.

## Troubleshooting

### X.org fails to start

- Make sure you have a graphics driver installed
- Check the X.org log: `cat /var/log/Xorg.0.log`

### Missing packages

Re-run the package installation script:
```bash
./setup/01-install-packages.sh
```

### Dotfiles not applied

Re-run the dotfiles setup script:
```bash
./setup/02-setup-dotfiles.sh
```

## License

This project is licensed under the Apache License 2.0 - see the LICENSE file for details. 
