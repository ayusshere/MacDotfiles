if status is-interactive
    # Commands to run in interactive sessions can go here

    # ===== ADD KEYBINDINGS HERE =====
    bind 'ƒ' forward-word  # Option+F to accept next word
    # bind \cf forward-word  # Alternative: Ctrl+F

    function histnum
        history | awk '{printf(" %3d - %s\n", nr, $0)}'
    end

    # Aliases
    alias ls='eza --icons=always --color=always -a'
    alias ll='eza --icons=always --color=always -la'
    alias cat='bat --theme=base16'
end

function fish_command_not_found
    echo "$argv[1]? I don't know what that is. "
end

if type -q fzf
    fzf --fish | source
end

function fish_prompt
    printf "%s" (starship prompt --status=$status)
end

starship init fish | source
eval "$(/opt/homebrew/bin/brew shellenv)"
