set -x EDITOR "vim"
set -x BROWSER "firefox"
set -x PAGER "less -X"
set -x BAT_PAGER "less -RFX"
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -x BAT_STYLE "plain"
set -x BAT_THEME "base16"
set -x DOTNET_CLI_TELEMETRY_OPTOUT 1
set -x TERM "xterm-256color"

set -x GOPATH "$HOME/go"
set -x GOBIN "$GOPATH/bin"
set -x PATH $PATH $GOBIN

set -x PATH $PATH "/usr/local/bin"
set -x PATH $PATH "/usr/local/go/bin"
set -x PATH $PATH "$HOME/.cargo/bin"

# Allow system wide installation of npm and yarn packages without sudo.
set -x npm_config_prefix "$HOME/.node_modules"
set -x PATH $PATH "$HOME/.node_modules/bin"

abbr -a o xdg-open

if status --is-interactive
    # Only apply the theme if we are not inside tmux, otherwise the colors are messed up.
    set -q TMUX
    if [ $status -ne 0 ]
        theme_gruvbox dark hard
    end
end

# edit config neovim
function ecn
    vim ~/.config/nvim/init.vim
end

# edit config fish
function ecf
    vim ~/.config/fish/config.fish
end

# edit config tmux
function ect
    vim ~/.tmux.conf
end

# tmux session study
function tss
    set session 'study'
    set base_dir "$HOME/Documents/gdrive/Studium/5-Semester"

    # Accept upper, lower and mixed case.
    switch (string lower $argv[1])
        case dbs
            set window DBS
        case dne
            set window DNE
        case rga
            set window RGA
        case vsy
            set window VSY
        case web
            set window WEB
        case '*'
            set window ''
    end

    if tmux has-session -t $session 2>/dev/null
        if [ $window != '' ]
            tmux attach -t $session:$window
        else
            tmux attach -t $session
        end
        return
    end

    tmux new -A -d -s study -n 'DBS' -c "$base_dir/DBS"
    tmux new-window -t $session -n 'DNE' -c "$base_dir/DNE"
    tmux new-window -t $session -n 'RGA' -c "$base_dir/RGA"
    tmux new-window -t $session -n 'VSY' -c "$base_dir/VSY"
    tmux new-window -t $session -n 'WEB' -c "$base_dir/WEB"

    if [ $window != '' ]
        tmux attach -t $session:$window
    else
        tmux attach -t $session:0
    end
end

function fish_prompt
set -g __fish_git_prompt_showdirtystate true
    set_color brblack
    echo -n "["(date "+%H:%M")"] "
    set_color yellow
    echo -n $USER
    set_color brblack
    echo -n "@"
    set_color blue
    echo -n (uname -n)" "
    set_color green
    if [ $PWD = $HOME ]
        echo -n "~"
    else
        echo -n (basename $PWD)
    end
    set_color normal
    printf '%s' (fish_git_prompt)
    set_color brblack
    echo -n ' | '
    set_color normal
end
