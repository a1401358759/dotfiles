if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Some config
set -g fish_greeting

set TERM xterm-256color

alias ll="eza --icons -l --color auto -F -a"
alias l="eza --icons -l --color auto -F -a"
alias ls="eza --icons -l --color auto -F"
# alias ps="procs"
alias gpullo="git pull origin"
alias icat="kitty +kitten icat"
alias d="kitty +kitten diff"
alias transfer="kitty +kitten transfer"
alias s="kitty +kitten ssh"
alias hg='kitty +kitten hyperlinked_grep'
alias v="nvim"
alias ping="pingu"
alias reload="exec fish"
alias unset='set --erase'
alias c="clear"
alias n="neofetch"
alias setproxy="export https_proxy=http://127.0.0.1:7890;export http_proxy=http://127.0.0.1:7890;export all_proxy=socks5://127.0.0.1:7890"
alias noproxy="set --erase https_proxy && set --erase http_proxy && set --erase all_proxy"

# Fish syntax highlighting
set -g fish_color_autosuggestion 555 brblack
set -g fish_color_cancel -r
set -g fish_color_command blue --bold
set -g fish_color_comment red
set -g fish_color_cwd green
set -g fish_color_cwd_root red
set -g fish_color_end brmagenta
set -g fish_color_error brred
set -g fish_color_escape bryellow --bold
set -g fish_color_history_current --bold
set -g fish_color_host normal
set -g fish_color_match --background=brblue
set -g fish_color_normal normal
set -g fish_color_operator bryellow
set -g fish_color_param cyan
set -g fish_color_quote yellow
set -g fish_color_redirection brblue
set -g fish_color_search_match bryellow '--background=brblack'
set -g fish_color_selection white --bold '--background=brblack'
set -g fish_color_user brgreen
set -g fish_color_valid_path --underline

# Created by `pipx` on 2022-12-09 03:14:10
set PATH $PATH /home/turbo/.local/bin
# bob nvim
set PATH $PATH /home/turbo/.local/share/bob/nvim-bin
# rustup
set PATH $PATH $HOME/.cargo/bin

zoxide init fish | source
atuin init fish | source

# Install Starship
starship init fish | source
