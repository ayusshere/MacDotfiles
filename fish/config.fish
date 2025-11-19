# ---------------------------------- #
# [info] STARSHIP + TRANSIENT PROMPT #
# ---------------------------------- #

starship init fish | source

function starship_transient_prompt_func
    echo " "
    starship module character
end
enable_transience

# Keep insert mode after transient prompt
if status is-interactive
    function keep_insert_mode --on-event fish_prompt
        if set -q fish_bind_mode
            set fish_bind_mode insert
        end
    end
end

# -------------------------------- #
# [info] INTERACTIVE SESSION SETUP #
# -------------------------------- #
if status is-interactive

    # --------------------- #
    # [INFO] BASIC ALIASES  #
    # --------------------- #
    alias j='java'
    alias n='node'
    alias p='python3'
    alias ls='eza --icons=always --color=always --ignore-glob="Icon?"'
    alias cat='bat --theme=base16'
    alias lsa='ls -a'
    alias ll='ls -la'
    alias install='brew install -v'
    alias reinstall='brew reinstall -v'
    alias uninstall='brew uninstall -v'
    alias search='brew search'
    alias df='df -h'
    alias ff='fastfetch'
    alias vsc='code .'
    alias lst='eza -T --git-ignore'
    alias hist='history | cat'
    alias fishconfig='nvim ~/.config/fish/config.fish'
    alias ghosttyconfig='nvim ~/.config/ghostty/config'
    alias yaziconfig='nvim ~/.config/yazi/yazi.toml'
    alias aerospaceconfig='nvim ~/.aerospace.toml'
    alias starshipconfig='nvim ~/.config/starship.toml'
    alias chart1='bat ~/Library/Java\ Big\ O\ Complexity\ Cheatsheet.md'

    # ---------------------------- #
    # [INFO] GIT ALIASES FOR FISH  #
    # ---------------------------- #
    alias g='git'

    # Status
    alias gs='git status'
    alias gss='git status -s'
    alias gd='git diff'
    alias gds='git diff --staged'
    alias gl='git log --oneline --graph --decorate'
    alias glg='git log --stat'
    alias gbl='git blame'

    # Clone
    alias gcln='git clone'
    alias gcld='git clone --depth 1'
    alias gcls='git clone --recurse-submodules'

    # Add
    alias ga='git add'
    alias gaa='git add --all'

    # Commit
    alias gc='git commit'
    alias gcm='git commit -m'
    alias gca='git commit --amend'
    alias gcam='git commit -am'

    # Branch
    alias gb='git branch'
    alias gnb='git checkout -b'
    alias gbd='git branch -d'
    alias gbD='git branch -D'

    # Checkout
    alias gco='git checkout'

    # Push & Pull
    alias gp='git push'
    alias gpf='git push --force'
    alias gpa='git push --all'
    alias gpl='git pull'
    alias gplr='git pull --rebase'
    alias gsync='git pull --rebase && git push'

    # Merge & Rebase
    alias gm='git merge'
    alias gma='git merge --abort'
    alias gr='git rebase'
    alias gri='git rebase -i'
    alias gra='git rebase --abort'
    alias grc='git rebase --continue'

    # Stash
    alias gst='git stash'
    alias gsta='git stash apply'
    alias gstp='git stash pop'
    alias gstl='git stash list'
    alias gsts='git stash show --patch'

    # Reset & Clean
    alias grh='git reset --hard'
    alias grs='git reset --soft'
    alias gcl='git clean -fd'
    alias grpc='git remote prune origin'

    # Remote
    alias grv='git remote -v'
    alias grao='git remote add origin'
    alias grrm='git remote remove'

    # -------------------------------- #
    # [info] COMMAND NOT FOUND HANDLER #
    # -------------------------------- #
    function fish_command_not_found
        set cmd $argv[1]

        set messages \
            "🤠 '$cmd'? Not in this rodeo." \
            "💀 '$cmd'? Dead on arrival." \
            "🤖 '$cmd'? AI says nope." \
            "⚡ '$cmd'? Too powerful to exist." \
            "👻 '$cmd'? Ghost command detected." \
            "🚀 '$cmd'? Took off without you." \
            "🧠 '$cmd'? Brain.exe not found." \
            "🔮 '$cmd'? Crystal ball says 404." \
            "💻 '$cmd'? Not in the matrix." \
            "😈 '$cmd'? Even hell denied it." \
            "💀 '$cmd'? That command died before it was born." \
            "🧙‍♂️ '$cmd'? Only ancient wizards know that spell." \
            "🔥 '$cmd'? Too hot to exist!" \
            "🤖 '$cmd'? Even AI doesn’t know that one." \
            "🌀 '$cmd'? Lost in the terminal multiverse." \
            "⚡ '$cmd'? Shockingly, it’s not real." \
            "🎮 '$cmd'? Not a cheat code, buddy." \
            "🥴 '$cmd'? You sure that’s even a command?" \
            "🧊 '$cmd'? Frozen… can’t execute that one." \
            "💣 '$cmd'? Boom! Not recognized." \
            "📡 '$cmd'? Signal lost. Try again later." \
            "🐉 '$cmd'? Only dragons can run that." \
            "💫 '$cmd'? Lost in space." \
            "🧠 '$cmd'? Not in my memory." \
            "🔮 '$cmd'? The future says no." \
            "😵 '$cmd'? That broke my brain." \
            "🎩 '$cmd'? Vanished like magic." \
            "💻 '$cmd'? Not in the system." \
            "😈 '$cmd'? Even the devil said no."

        set colors red yellow magenta cyan green blue

        set message (random choice $messages)
        set color (random choice $colors)

        set_color $color
        echo $message
        set_color normal
    end

    # --------------------------------- #
    # [info] YAZI FILE MANAGER SHORTCUT #
    # --------------------------------- #
    function y
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        yazi $argv --cwd-file="$tmp"

        if read -z cwd <"$tmp"; and test -n "$cwd"; and test "$cwd" != "$PWD"
            cd "$cwd"
        end
        rm -f "$tmp"
    end
end

# --------------------- #
# [info] VI KEYBINDINGS #
# --------------------- #

bind -M insert \ef forward-word
bind -M insert \eb backward-word
bind -M insert \e\x7f backward-kill-word
bind -M default \e\x7f backward-kill-word

function fish_user_key_bindings
    fish_vi_key_bindings

    #
    # ----- VISUAL MODE -----
    #
    # y → copy selected text only
    bind -M visual y 'set sel (commandline -b); fish_clipboard_copy $sel; commandline -f end-selection'

    #
    # ----- NORMAL MODE -----
    #
    # yy → copy whole line
    bind -M default yy 'set line (commandline -b); fish_clipboard_copy $line; commandline -f repaint'

    # Y → copy from cursor to end of line
    bind -M default Y 'set seg (commandline -b | string sub -s (commandline --cursor)); fish_clipboard_copy $seg; commandline -f repaint'

    # yw → copy word under cursor
    bind -M default yw 'set -l line (commandline -b); set -l cur (commandline --cursor); set -l rest (string sub -s $cur $line); set -l word (string match -r "^\w+" $rest); fish_clipboard_copy $word; commandline -f repaint'

    #
    # ----- PASTE -----
    #
    # p → paste system clipboard (like vim)
    bind -M default p fish_clipboard_paste

    # In insert mode: Ctrl+V also paste clipboard
    bind -M insert \cv fish_clipboard_paste
end

# ---------------------------- #
# [info] ENVIRONMENT VARIABLES #
# ---------------------------- #
set -gx PATH /opt/homebrew/bin /opt/homebrew/sbin $PATH
set -gx HOMEBREW_PREFIX /opt/homebrew
set -gx HOMEBREW_CELLAR /opt/homebrew/Cellar
set -gx HOMEBREW_REPOSITORY /opt/homebrew

zoxide init fish | source

# -------------------- #
# [info] CONFIGURATION #
# -------------------- #
if type -q fzf
    source (fzf --fish | psub)
end

set -Ux FZF_DEFAULT_OPTS "\
--color=bg+:#181825,bg:#181825,spinner:#F5E0DC,hl:#F38BA8 \
--color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
--color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
--color=selected-bg:#45475A \
--color=border:#6C7086,label:#CDD6F4"

set -x FZF_DEFAULT_COMMAND "fd --type f --hidden \
  --exclude '.*' \
  --exclude '.git' \
  --exclude '.cache' \
  --exclude '.DS_Store' \
  --exclude 'node_modules' \
  --exclude 'venv' \
  --exclude '__pycache__' \
  --exclude 'tmp' \
  --exclude 'dist' \
  --exclude 'build'"

set -x FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND

set -x FZF_ALT_C_COMMAND "fd --type d --hidden \
  --exclude '.*' \
  --exclude '.git' \
  --exclude '.cache' \
  --exclude 'node_modules' \
  --exclude 'venv' \
  --exclude 'tmp' \
  --exclude 'dist' \
  --exclude 'build'"
