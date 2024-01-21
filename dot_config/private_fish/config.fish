# Universal Settings
set -U EDITOR nvim
set -Ux GOPATH $HOME/.asdf/installs/golang/1.20.6/packages

# Paths
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.docker/bin
fish_add_path $HOME/.pub-cache/bin
fish_add_path /opt/homebrew/bin
fish_add_path /Applications/WezTerm.app/Contents/MacOS
fish_add_path $HOME/.emacs.d/bin
fish_add_path $GOPATH/bin
fish_add_path '/Applications/Racket v8.11.1/bin'

# General Aliases
alias vim="nvim"
alias ls="exa"
alias fishfig="vim ~/.config/fish/config.fish"
alias fishfig-commit="source ~/.config/fish/config.fish"
alias alfig="vim ~/.config/alacritty/alacritty.yml"
alias vimfig="vim ~/.config/nvim/init.lua"
alias starfig="vim ~/.config/starship.toml"
alias wezfig="vim ~/.config/wezterm/wezterm.lua"
alias tmuxfig="vim ~/.tmux.conf"
alias tmuxfig-commit="tmux source ~/.tmux.conf"
alias cz="chezmoi"

# Scala
alias scli="scala-cli"

# Ruby Env
status --is-interactive; and rbenv init - fish | source

# Git command aliases
alias gdc="git diff --cached"
alias gaa="git add ."
alias gcm="git commit -m"
alias glo="git log --oneline"

# Elixir
alias ism="iex -S mix"

# Emacs
alias emacs="emacsclient -c -a 'emacs'"

# Android Dev
alias adb="~/Library/Android/sdk/platform-tools/adb"

# Bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# Flutter
alias flw='flutter-watch'
alias flb='flutter pub run build_runner watch --delete-conflicting-outputs'

function flutter-watch
    command tmux send-keys "flutter run $1 $2 $3 $4 --pid-file=/tmp/tf1.pid" Enter \; \
        split-window -v \; \
        send-keys 'npx -y nodemon -e dart -x "cat /tmp/tf1.pid | xargs kill -s USR1"' Enter \; \
        resize-pane -y 5 -t 1 \; \
        select-pane -t 0 \;
end


if status is-interactive
    # enable VIM mode in terminal
    fish_vi_key_bindings
    # Init Python Environment
    eval "$(pyenv init -)"
    # decorate terminal with _starship_
    starship init fish | source
end

source /opt/homebrew/opt/asdf/libexec/asdf.fish
