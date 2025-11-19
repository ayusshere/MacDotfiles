### ───────────────────────────────────────────
###   🌌 TIDE PROMPT — Catppuccin Mocha Glow
###      (Starship Layout & Icons)
### ───────────────────────────────────────────

# enable transient prompt
set -g fish_transient_prompt 1

# ensure tide is active
tide configure --auto --apply

### ───────────────────────────────────────────
### 🎨 Catppuccin Mocha Palette
### ───────────────────────────────────────────

set -g tide_color_fg "#c2daf6"
set -g tide_color_blue "#61c5fa"
set -g tide_color_lavender "#b4befe"
set -g tide_color_green "#aae484"
set -g tide_color_yellow "#f0e893"
set -g tide_color_orange "#fbb470"
set -g tide_color_red "#f88a96"
set -g tide_color_cyan "#94e2d5"
set -g tide_color_rosewater "#f5e0dc"
set -g tide_color_purple "#dd99f4"

### ───────────────────────────────────────────
### 🧩 Prompt Layout (Same as your Starship)
### ───────────────────────────────────────────

# left side: os → directory → git → langs → docker → duration
set -g tide_left_prompt_items os directory git node python java c rust docker cmd_duration

# right side: username → time → shell
set -g tide_right_prompt_items username time shell

# disable powerline
set -g tide_prompt_style plain
set -g tide_prompt_add_newline true

### ───────────────────────────────────────────
### 🖥 OS MODULE
### ───────────────────────────────────────────

set -g tide_os_show true
set -g tide_os_icon_mac ""
set -g tide_os_color $tide_color_red

### ───────────────────────────────────────────
### 📁 DIRECTORY
### ───────────────────────────────────────────

set -g tide_pwd_color $tide_color_purple
set -g tide_pwd_truncation_length 2
set -g tide_pwd_truncation_marker " "
set -g tide_pwd_readonly_icon ""
set -g tide_pwd_readonly_color $tide_color_red

### ───────────────────────────────────────────
### 🌿 GIT BRANCH + STATUS
### ───────────────────────────────────────────

# branch
set -g tide_git_branch_icon " "
set -g tide_git_branch_color $tide_color_green

# status colors
set -g tide_git_staged_color $tide_color_green
set -g tide_git_modified_color $tide_color_yellow
set -g tide_git_deleted_color $tide_color_red
set -g tide_git_untracked_color $tide_color_blue
set -g tide_git_stash_color $tide_color_purple

# main git icon
set -g tide_git_icon ""

### ───────────────────────────────────────────
### 💚 NODEJS
### ───────────────────────────────────────────

set -g tide_node_icon " "
set -g tide_node_color $tide_color_green

### ───────────────────────────────────────────
### 🐍 PYTHON
### ───────────────────────────────────────────

set -g tide_python_icon " "
set -g tide_python_color $tide_color_yellow

### ───────────────────────────────────────────
### ☕ JAVA
### ───────────────────────────────────────────

set -g tide_java_icon " "
set -g tide_java_color $tide_color_red

### ───────────────────────────────────────────
### 🛠 C
### ───────────────────────────────────────────

set -g tide_c_icon " "
set -g tide_c_color $tide_color_cyan

### ───────────────────────────────────────────
### 🦀 RUST
### ───────────────────────────────────────────

set -g tide_rust_icon " "
set -g tide_rust_color $tide_color_orange

### ───────────────────────────────────────────
### 🐳 DOCKER
### ───────────────────────────────────────────

set -g tide_docker_icon " "
set -g tide_docker_color $tide_color_blue

### ───────────────────────────────────────────
### ⚡ CMD DURATION
### ───────────────────────────────────────────

set -g tide_cmd_duration_icon " "
set -g tide_cmd_duration_color $tide_color_orange
set -g tide_cmd_duration_threshold 500

### ───────────────────────────────────────────
### 👤 USERNAME
### ───────────────────────────────────────────

set -g tide_username_icon " "
set -g tide_username_color $tide_color_yellow
set -g tide_username_show false

### ───────────────────────────────────────────
### 🕒 TIME
### ───────────────────────────────────────────

set -g tide_time_color $tide_color_lavender
set -g tide_time_format "%H:%M"
set -g tide_time_icon "󱑀 "
set -g tide_time_show false

### ───────────────────────────────────────────
### 🐚 SHELL INDICATOR
### ───────────────────────────────────────────

set -g tide_shell_icons fish=" FISH" bash=" BASH" zsh=" ZSH"
set -g tide_shell_color $tide_color_cyan
set -g tide_shell_show false

### ───────────────────────────────────────────
### ➤ PROMPT CHARACTER
### ───────────────────────────────────────────

set -g tide_character_icon_prompt "❯"
set -g tide_character_icon_vi_insert "❯"
set -g tide_character_icon_vi_normal "❮"
set -g tide_character_icon_vi_visual "󰴲"
set -g tide_character_icon_vi_replace "❮"

set -g tide_character_success_color $tide_color_green
set -g tide_character_error_color $tide_color_red
