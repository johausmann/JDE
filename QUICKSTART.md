# Quick Start Guide

This is a quick reference guide to get you started with JDE (Jo's Desktop Environment).

## Installation Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/johausmann/JDE.git
   cd JDE
   ```

2. **Run the setup script**
   ```bash
   ./setup.sh
   ```
   This will install all necessary packages and set up your dotfiles.

3. **Start X.org**
   ```bash
   startx
   ```

## Default Keybindings

| Keybinding | Action |
|------------|--------|
| `Super + Enter` | Open terminal (alacritty) |
| `Super + d` | Application launcher (dmenu) |
| `Super + Shift + q` | Quit spectrwm |
| `Super + Shift + r` | Restart spectrwm |
| `Super + Shift + c` | Close focused window |
| `Super + j` | Focus next window |
| `Super + k` | Focus previous window |
| `Super + h` | Shrink master area |
| `Super + l` | Grow master area |
| `Super + Space` | Cycle through layouts |
| `Super + 1-9` | Switch to workspace 1-9 |
| `Super + Shift + 1-9` | Move window to workspace 1-9 |

## Customization

### Change Window Manager Keybindings

Edit `dotfiles/spectrwm/.config/spectrwm/spectrwm.conf`:
```bash
vim dotfiles/spectrwm/.config/spectrwm/spectrwm.conf
```

After making changes:
```bash
Super + Shift + r  # Restart spectrwm to apply changes
```

### Customize Status Bar

Edit `dotfiles/polybar/.config/polybar/config.ini`:
```bash
vim dotfiles/polybar/.config/polybar/config.ini
```

Restart polybar:
```bash
~/.config/polybar/launch.sh
```

### Add Startup Applications

Edit `dotfiles/X11/.xinitrc`:
```bash
vim dotfiles/X11/.xinitrc
```

Add applications before the `exec spectrwm` line:
```bash
firefox &
discord &
exec spectrwm
```

## Common Tasks

### Set a Wallpaper

Uncomment and edit this line in `.xinitrc`:
```bash
feh --bg-scale /path/to/your/wallpaper.jpg &
```

### Change Keyboard Layout

Uncomment and edit this line in `.xinitrc`:
```bash
setxkbmap us  # Change 'us' to your layout
```

### Add New Dotfiles

```bash
cd dotfiles
mkdir -p myapp/.config/myapp
cp ~/.config/myapp/config myapp/.config/myapp/
stow -t ~ myapp
```

## Troubleshooting

### polybar not showing
```bash
~/.config/polybar/launch.sh
```

### spectrwm configuration not loading
Make sure the config file is at:
```bash
~/.config/spectrwm/spectrwm.conf
```

### X.org won't start
Check your graphics drivers are installed:
```bash
lspci | grep VGA  # Check your GPU
```

Install appropriate driver:
```bash
# For Intel
sudo pacman -S xf86-video-intel

# For AMD
sudo pacman -S xf86-video-amdgpu

# For NVIDIA
sudo pacman -S nvidia
```

## Getting Help

- spectrwm manual: `man spectrwm`
- spectrwm.conf manual: `man spectrwm.conf`
- Arch Wiki: https://wiki.archlinux.org/

## Resources

- [spectrwm Homepage](https://github.com/conformal/spectrwm)
- [polybar Wiki](https://github.com/polybar/polybar/wiki)
- [Arch Linux Wiki - X.org](https://wiki.archlinux.org/title/Xorg)
- [GNU Stow Manual](https://www.gnu.org/software/stow/manual/stow.html)
