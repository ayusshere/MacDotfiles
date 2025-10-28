#──────────────────────────────────────────────
# 🌟  Starship Prompt
#──────────────────────────────────────────────
starship init fish | source

#──────────────────────────────────────────────
# 🐚  Interactive Session Setup
#──────────────────────────────────────────────
if status is-interactive

    #──────────────────────────────────────────
    # ⚡ Aliases
    #──────────────────────────────────────────
    alias ls='eza --icons=always --color=always'
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
    alias ghostty='open -na Ghostty.app'
    alias vsc='code .'
    alias lst='eza -T --git-ignore'
    alias hist='history | cat'
    alias fishconfig='nvim ~/.config/fish/config.fish'
    alias ghosttyconfig='nvim ~/.config/ghostty/config'
    alias yaziconfig='nvim ~/.config/yazi/yazi.toml'
    alias aerospaceconfig='nvim ~/.aerospace.toml'
    alias starshipconfig='nvim ~/.config/starship.toml'
    alias chart1='bat ~/Library/Java\ Big\ O\ Complexity\ Cheatsheet.md'
    alias chart2='bat ~/Library/Trick\ And\ Others\ Cheetsheet'
    alias touch='bass touch'  # Run bash command in Fish safely

    #──────────────────────────────────────────
    # 💬 Custom “Command Not Found” Handler
    #──────────────────────────────────────────
    function fish_command_not_found
        set cmd $argv[1]

        # 30 Cool Random Messages 🌀
        set messages \
            "🚫 '$cmd'? Command not found. Try again, space cowboy 🤠" \
            "💀 '$cmd'? That command died before it was born." \
            "🧙‍♂️ '$cmd'? Only ancient wizards know that spell." \
            "🐙 '$cmd'? Deep sea command... not found." \
            "🔥 '$cmd'? Too hot to exist!" \
            "🤖 '$cmd'? Even AI doesn’t know that one." \
            "🌀 '$cmd'? Lost in the terminal multiverse." \
            "👻 '$cmd'? A ghost command, perhaps?" \
            "⚡ '$cmd'? Shockingly, it’s not real." \
            "🎩 '$cmd'? Magic trick failed — command vanished." \
            "🚀 '$cmd'? Maybe it took off without you." \
            "🐍 '$cmd'? Not even Python knows that one." \
            "🧩 '$cmd'? Doesn’t fit anywhere in the system." \
            "🧠 '$cmd'? Hmm… I can’t find it in my memory." \
            "🎮 '$cmd'? Not a cheat code, buddy." \
            "😵 '$cmd'? That command just broke my brain." \
            "🕵️ '$cmd'? I've searched everywhere — nothing found!" \
            "🐉 '$cmd'? Only dragons can execute that." \
            "🥴 '$cmd'? You sure that’s even a command?" \
            "💫 '$cmd'? Floating somewhere in cyberspace." \
            "🧊 '$cmd'? Frozen… can’t execute that one." \
            "💣 '$cmd'? Boom! Not recognized." \
            "🎭 '$cmd'? That command’s wearing a disguise." \
            "🔮 '$cmd'? The crystal ball shows… nothing." \
            "🦄 '$cmd'? Mythical. Doesn’t exist here." \
            "💻 '$cmd'? That one’s not in the matrix." \
            "🧱 '$cmd'? Error — ran into a digital wall." \
            "📡 '$cmd'? Signal lost. Try again later." \
            "🪄 '$cmd'? Poof! It vanished into thin air." \
            "😈 '$cmd'? Even the devil doesn’t know that one."

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
    function y
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
eval "$(/opt/homebrew/bin/brew shellenv)"
zoxide init fish | source

#──────────────────────────────────────────────
# 🔍  FZF Integration
#──────────────────────────────────────────────
if type -q fzf
    fzf --fish | source
end

# Use fd as FZF’s source (faster search)
set -x FZF_DEFAULT_COMMAND 'fd --type f --hidden --exclude .git --exclude .cache'
set -x FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
set -x FZF_ALT_C_COMMAND 'fd --type d --hidden --exclude .git --exclude .cache'


function show_thought
    # 💡 Motivational thoughts
    sleep 0.05
    set thoughts \
set thoughts \
    "🌱 Stay curious, code smart" \
    "💫 Dream big, ship bigger" \
    "⚙️ Errors teach, mastery follows" \
    "🪲 Bugs = hidden lessons" \
    "🌻 Learn constantly, grow infinitely" \
    "🚀 Fail fast, learn faster" \
    "💡 Think logic, build passion" \
    "🐛 Debugging = path to mastery" \
    "🧠 Outsmart the problem" \
    "✨ Create logic that inspires" \
    "💻 Brain = ultimate IDE" \
    "🛠️ Build, break, repeat" \
    "🎯 Practice patterns, gain power" \
    "🔥 Frustration fuels growth" \
    "🏋️ DSA = brain gym" \
    "🌄 Consistency beats talent" \
    "🚢 Keep learning, keep shipping" \
    "🧼 Clean code, clear mind" \
    "💥 One bug closer to mastery" \
    "🧩 Think like a compiler, act like a creator" \
    "☕ Coffee + code = life" \
    "⚡ Optimize everything" \
    "🌍 DSA trains mind, Dev shapes world" \
    "🔑 Focus, iterate, conquer" \
    "🕹️ Code smart, debug faster" \
    "📈 Small wins, big growth" \
    "💎 Logic sharp, creativity sharper" \
    "🖤 Solve, ship, repeat" \
    "🔥 Passion fuels productivity" \
    "🌟 Build cool things daily" \
    "🧠 Mind gym: solve, refactor, repeat" \
    "💡 Idea > syntax > implementation" \
    "🪲 Bug hunting = brain hacking" \
    "🚀 Push limits, ship features" \
    "🎯 One problem, one solution, one victory" \
    "🛠️ Tools sharpen talent, code sharpens mind" \
    "🌱 Growth mindset > instant results" \
    "💫 Think algorithms, live creatively" \
    "⚡ Speed + accuracy = mastery" \
    "🐛 Debug your logic, not your life" \
    "🧩 Piece problems together like puzzles" \
    "💻 Code is poetry for the logical mind" \
    "🔥 Burn distractions, fuel focus" \
    "🏋️ Push memory, lift complexity"


    # 🎲 Get a random index safely (Fish style)
    set count_thoughts (count $thoughts)
    set random_index (random 1 $count_thoughts)

    set msg "$thoughts[$random_index]"

    # 🖥️ Center the text
    set width (tput cols)
    set msg_length (string length --visible "$msg")
    set pad (math "floor(($width - $msg_length) / 2)")
    if test $pad -lt 0
        set pad 0
    end

    # 🎨 Pick a random Catppuccin-like color
    set colors AAE484 89B4FA F5C2E7 FAB387 B4BEFE F9E2AF
    set color_index (random 1 (count $colors))

    set_color -o $colors[$color_index]
    printf "%*s%s\n" $pad "" "$msg"
    set_color normal
end

show_thought


