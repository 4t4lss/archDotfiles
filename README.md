# ⚙️ Arch Linux Dotfiles

<p center>
  <img src="https://img.shields.io/badge/OS-Arch%20Linux-blue?logo=arch-linux&logoColor=white" alt="OS">
  <img src="https://img.shields.io/badge/WM-Hyprland-005F87?logo=hyprland&logoColor=white" alt="WM">
  <img src="https://img.shields.io/badge/Editor-Neovim-57A143?logo=neovim&logoColor=white" alt="Editor">
  <img src="https://img.shields.io/badge/Shell-Zsh-4EAA25?logo=zsh&logoColor=white" alt="Shell">
  <img src="https://img.shields.io/badge/Manager-GNU%20Stow-000000?logo=gnu&logoColor=white" alt="Stow">
</p>

> [!NOTE]
> Minimal keyboard driven development enviornment running on **Arch Linux** utilizing **Hyprland, Zsh, and Neovim** with integrated support for the **Asus Zenbook Duo(UX8406CA**.

---

## 🚀 Quick Start

Quick Deployment using GNU Stow to create symlinks.
⚠️ **Warning:** Do not run the commands blindly on your machine without knowing what's going on.
To set up on a fresh machine:
```zsh
git clone github.com/4T4lss/archDotfiles

cd dotfiles/archDotfiles/config

stow -t ~/.config/ */

cd ..

cd home

stow -t ~ zsh
```



---

## 🎨 Overview

| Component | Choice | Description |
| :-------- | :----- | :---------- |
| **OS** | Arch Linux | Rolling release core |
| **Window Manager** | Hyprland / Wayland | Dynamic tiling compositor |
| **Terminal** | Kitty | Fast, GPU-accelerated terminal emulator |
| **Shell** | Zsh | Interactive shell with custom prompts & aliases |
| **Editor** | Neovim | Custom Lua-based development workspace |
| **Browser** | Firefox | Mnimalistic Browsing |
| **File Manager(GUI)** | Nemo | GUI file manager|
| **File Manager(TUI)** | Yazi | TUI file manager|
| **Bar** | Waybar / Rofi | Custom system panel |
| **Notification Daemon** | Swaync | Minimal notification panel |
| **Launcher** | Rofi | Clipboard and Launch Menu |
| **Dotfile Manager** | GNU Stow | Symlink management |
| **Lockscreen** | Hyprlock | Lock screen with a tty1 aesthetic |
| **Greeter** | Emptty | Minimalistic tty1 terminal as a login Menu |

---

## 📁 Repository Structure
```text
dotfiles/
├── README.md
├── assets/                  # Environment screenshots & showcase media
├── config/                  # Targets ~/.config/
│   ├── hypr/
│   │   └── hypr/            # Hyprland 0.55+ Lua setup
│   │       ├── hyprland.lua
│   │       └── scripts/     # Custom environment utility scripts
│   ├── kitty/
│   │   └── kitty/           # Terminal aesthetics, fonts, & keybindings
│   ├── nvim/
│   │   └── nvim/            # Neovim Lua configuration & LSP setup
│   ├── rofi/
│   │   └── rofi/            # Application launcher themes & Rasi configs
│   ├── swaync/
│   │   └── swaync/          # Notification center layout & CSS styles
│   ├── waybar/
│   │   └── waybar/          # Status bar modules & styling
│   └── yazi/
│       └── yazi/            # TUI file manager configuration & keymaps
└── home/                    # Targets ~/ ($HOME)
    └── zsh/
        └── zsh/             # Zsh profiles, exports, & .zshrc
```

---

## 📸 Gallery / Screenshots

<img width="2880" height="1798" alt="image" src="https://github.com/user-attachments/assets/00c60a6c-e31f-42ec-ada6-85292ac2f1c9" />
<img width="2880" height="1800" alt="image" src="https://github.com/user-attachments/assets/6da07dbd-b123-4800-8a5c-ee824b04aa33" />
<img width="2880" height="1792" alt="image" src="https://github.com/user-attachments/assets/86b28712-446a-4bec-aaa9-74a662eca75c" />




