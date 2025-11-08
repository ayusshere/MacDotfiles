starship init fish | source

# Transient prompt setup
function starship_transient_prompt_func
   echo " "
    starship module character
end
enable_transience

# --- Keep insert mode after transient prompt ---
if status is-interactive
    function keep_insert_mode --on-event fish_prompt
        if set -q fish_bind_mode
            set fish_bind_mode insert
        end
    end
end

#──────────────────────────────────────────────
# 🐚  Interactive Session Setup
#──────────────────────────────────────────────
if status is-interactive

    #──────────────────────────────────────────
    # ⚡ Aliases
    #──────────────────────────────────────────
    alias j='java'
    alias n='node'
    alias ls='eza --icons=always --color=always --ignore-glob='Icon?''
    alias lsa='ls -a'
    alias ll='ls -la'
    alias cat='bat --theme=base16'
    alias install='brew install -v'
    alias reinstall='brew reinstall -v'
    alias uninstall='brew uninstall -v'
    alias search='brew search'
    alias df='df -h'
    alias ff='fastfetch'
    alias gc='git clone'
    alias gs='git status'
    alias ga='git add .'
    alias gcm='git commit -m'
    alias gp='git push'
    alias vsc='code .'
    alias lst='eza -T --git-ignore'
    alias hist='history | cat'
    alias fishconfig='nvim ~/.config/fish/config.fish'
    alias ghosttyconfig='nvim ~/.config/ghostty/config'
    alias yaziconfig='nvim ~/.config/yazi/yazi.toml'
    alias aerospaceconfig='nvim ~/.aerospace.toml'
    alias starshipconfig='nvim ~/.config/starship.toml'
    alias chart1='bat ~/Library/Java\ Big\ O\ Complexity\ Cheatsheet.md'
    alias touch='bass touch'  # Run bash command in Fish safely

    #──────────────────────────────────────────
    # 💬 Custom “Command Not Found” Handler
    #──────────────────────────────────────────
    function fish_command_not_found
        set cmd $argv[1]

        # 30 Cool Random Messages 🌀
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
            "😈 '$cmd'? Even hell denied it."\
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
            "💀 '$cmd'? That one’s long gone." \
            "🤖 '$cmd'? Even robots don’t know it." \
            "🐉 '$cmd'? Only dragons can run that." \
            "⚡ '$cmd'? Too strong to exist." \
            "👻 '$cmd'? Ghost command spotted." \
            "🧙 '$cmd'? Not in the spellbook." \
            "🔥 '$cmd'? Burned out of memory." \
            "🐍 '$cmd'? Python refused that." \
            "🚀 '$cmd'? Flew away somewhere." \
            "💫 '$cmd'? Lost in space." \
            "🧠 '$cmd'? Not in my memory." \
            "🔮 '$cmd'? The future says no." \
            "🪄 '$cmd'? Magic failed." \
            "😵 '$cmd'? That broke my brain." \
            "🎩 '$cmd'? Vanished like magic." \
            "💻 '$cmd'? Not in the system." \
            "😈 '$cmd'? Even the devil said no."




        # 🎨 Random Color + Message
        set colors red yellow magenta cyan green blue
        set message (random choice $messages)
        set color (random choice $colors)

        set_color $color
        echo $message
        set_color normal
    end

    #──────────────────────────────────────────
    # 📁 “y” Shortcut for Yazi File Manager
    #──────────────────────────────────────────
    function f
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        yazi $argv --cwd-file="$tmp"

        if read -z cwd <"$tmp"; and test -n "$cwd"; and test "$cwd" != "$PWD"
            cd "$cwd"
        end
        rm -f "$tmp"
    end
end

#──────────────────────────────────────────────
# ⌨️  Key Bindings (Vi-style)
#──────────────────────────────────────────────
fish_vi_key_bindings
bind -M insert \ef forward-word
bind -M insert \eb backward-word

#──────────────────────────────────────────────
# 🌍  Environment Setup
#──────────────────────────────────────────────
set -gx PATH /opt/homebrew/bin /opt/homebrew/sbin $PATH
set -gx HOMEBREW_PREFIX /opt/homebrew
set -gx HOMEBREW_CELLAR /opt/homebrew/Cellar
set -gx HOMEBREW_REPOSITORY /opt/homebrew
zoxide init fish | source

#──────────────────────────────────────────────
# 🔍  FZF Integration
#──────────────────────────────────────────────
source (fzf --fish | psub)



# Use fd as FZF’s source (faster search)
#
# Base fd command for fzf (exclude hidden and useless files)
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

# Use the same command for Ctrl+T (file search)
set -x FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND

# Use a directory-only version for Alt+C (cd)
set -x FZF_ALT_C_COMMAND "fd --type d --hidden \
  --exclude '.*' \
  --exclude '.git' \
  --exclude '.cache' \
  --exclude 'node_modules' \
  --exclude 'venv' \
  --exclude 'tmp' \
  --exclude 'dist' \
  --exclude 'build'"

