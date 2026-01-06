set -x STARSHIP_CONFIG ~/.config/starship/starship.toml

set -gx PATH $PATH ~/.cargo/bin

set -gx PATH $PATH ~/.local/bin

set -gx EDITOR nvim

#Yazi shell wrapper	
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

if status is-interactive

    starship init fish | source

    fastfetch

    alias ls 'lsd -a'

    alias ff fastfetch

end
