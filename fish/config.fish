starship init fish | source
if status is-interactive

    # Commands to run in interactive sessions can go here

    #----------------------------------------------#
    # function fish_prompt
    #     # Icons
    #     set -l home_icon " "          # Home directory icon
    #     set -l dir_icon " "           # Regular directory icon
    #     set -l root_icon " "          # Root directory icon
    #     set -l arrow ""              # Prompt arrow
    #
    #     # Colors
    #     set -l color_blue (set_color blue)
    #     set -l color_magenta (set_color magenta)
    #     set -l color_red (set_color red)
    #     set -l color_green (set_color green)
    #     set -l color_cyan (set_color cyan)
    #     set -l color_purple (set_color purple)
    #     set -l color_yellow (set_color yellow)
    #     set -l color_reset (set_color normal)
    #
    #     # Current directory handling
    #     set -l current_dir (prompt_pwd)  # Gets shortened path with ~ for home
    #
    #     # Set appropriate icon based on directory
    #     if test "$PWD" = "$HOME"
    #         set dir_icon "$home_icon"
    #     else if test "$PWD" = "/"
    #         set dir_icon "$color_green$root_icon$color_reset"
    #     end
    #
    #     # Display the prompt
    #     # Format: [directory] arrow
    #     echo -n "$color_purple$dir_icon$color_reset $color_cyan"❨"$color_purple$current_dir$color_reset$color_cyan"❩\n"$color_reset"
    #
    #
    #     # Status indicator (changes color based on last command exit status)
    #     echo -n " "
    #     if test $status -eq 0
    #         echo -n "$color_purple$arrow$color_reset"
    #     else
    #         echo -n "$color_red$arrow$color_reset"
    #     end
    #
    #     # Final space before user input
    #     echo -n " "
    # end

    function histnum
        history | awk '{printf(" %3d - %s\n", nr, $0)}'
    end

    # Aliases
    alias ls='eza --icons=always --color=always'
    alias lsa='eza --icons=always --color=always -a'
    alias ll='eza --icons=always --color=always -la'
    alias cat='bat --theme=base16'
    alias install='brew install -v'
    alias reinstall='brew reinstall -v'
    alias uninstall='brew uninstall -v'
    alias search='brew search'
    alias chart1='cat Library/Java\ Big\ O\ Complexity\ Cheatsheet.md'
    alias chart2='cat Library/Trick\ And\ Others\ Cheetsheet'
    alias fishconfig='nvim ~/.config/fish/config.fish'
    alias ghosttyconfig='nvim ~/.config/ghostty/config'
    alias vsc='codium .'
    alias lst='eza -T --git-ignore'
    alias hist='history | cat'
    alias df='df -h'
    alias ff='fastfetch'
    alias gc='git clone'
end

fish_vi_key_bindings # Enable Vim keybindings
# Bind Option+F to accept full suggestion in insert mode
bind -M insert \ef forward-word
bind -M insert \eb backward-word

function fish_command_not_found
    echo " $argv[1]? I don't know what that is. "
end

#yazi Configuration
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

if type -q fzf
    fzf --fish | source
end
bind ƒ fzf-complete # Requires fzf.fish plugin

eval "$(/opt/homebrew/bin/brew shellenv)"
