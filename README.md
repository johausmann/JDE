# 🖥️ 🐧 JDE – Jo's Desktop Environment

JDE is a minimalist desktop environment setup for **Arch Linux**, built around **spectrwm** and **polybar**.  
The goal is a reproducible, lightweight, and maintainable system using modular shell  scripts and clean dotfile management via **GNU stow**. This collection of scripts is intended to recreate my personal desktop setup on new machines.

---

## ✨ Features

- **Window Manager**: spectrwm – A minimal and efficient tiling window manager
- **Status Bar**: polybar – A highly customizable status bar
- **Dotfiles Management**: GNU stow for easy and transparent configuration management
- **Compositor**: picom for transparency and visual effects
- **Terminal**: alacritty as the default terminal emulator
- **Application Launcher**: rofi for fast application launching

---

## 📋 Requirements

- A minimal Arch Linux installation
- Internet connection for package installation
- Basic familiarity with terminal usage

---

## ⚙️ Installation

### 1️⃣ Clone the repository

```bash
git clone https://github.com/johausmann/JDE.git
cd JDE
```

### 2️⃣ Run the main setup script

```bash
/setup.sh
```
This script will:

📦 Install all required packages (X-org, spectrwm, polybar, etc.)

🔗 Set up dotfiles using GNU stow

### 3️⃣ Start the desktop environment

```bash
startx
```
Or you can start the session wit a login manager such as **lemurs**

## 🛠️ Manual Installation

If you prefer to run the setup scripts individually:

```bash
# Install system packages
./setup/01-install-packages.sh

# Set up dotfiles
./setup/02-setup-dotfiles.sh

```

## 🗂️ Directory Structure

```
JDE/
├── setup.sh                     # Main setup script
├── setup/
│   ├── 01-install-packages.sh   # Package installation
│   └── 02-setup-dotfiles.sh     # Dotfiles setup using GNU stow
└── dotfiles/                    # Managed configuration files
    ├── spectrwm/                # spectrwm configuration
    ├── polybar/                 # polybar configuration
    └── X11/                     # Xorg / Xinit configuration
```

## 🎨 Customization

All configuration files live in the dotfiles/ directory and are managed using GNU stow.

To apply or update configurations manually:

```bash
cd dotfiles
stow -t ~ spectrwm
```

See dotfiles/README.md for details on managing and extending dotfiles.

## 📄 License

This project is licensed under the Apache License 2.0.
See the LICENSE file for more information.