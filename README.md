# ⚙️ Arch Linux Dotfiles

<p center>
  <img src="https://img.shields.io/badge/OS-Arch%20Linux-blue?logo=arch-linux&logoColor=white" alt="OS">
  <img src="https://img.shields.io/badge/WM-Hyprland-005F87?logo=hyprland&logoColor=white" alt="WM">
  <img src="https://img.shields.io/badge/Editor-Neovim-57A143?logo=neovim&logoColor=white" alt="Editor">
  <img src="https://img.shields.io/badge/Shell-Zsh-4EAA25?logo=zsh&logoColor=white" alt="Shell">
  <img src="https://img.shields.io/badge/Manager-GNU%20Stow-000000?logo=gnu&logoColor=white" alt="Stow">
</p>

> A minimal, keyboard-driven development environment running on **Arch Linux** with support for the **Asus Zenbook Duo(UX8406CA)**.

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
.dotfiles/
├── hypr/          # Hyprland window manager rules & keybindings
├── nvim/          # Neovim Lua configurations & LSP settings
├── waybar/        # Waybar CSS themes and module layouts
├── zsh/           # Zsh profiles, exports, and aliases
├── alacritty/     # Terminal color schemes and font configurations
└── scripts/       # Custom utility scripts
