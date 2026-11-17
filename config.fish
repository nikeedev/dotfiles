if status is-interactive
    # Commands to run in interactive sessions can go here
end
alias cls=clear
alias sober="flatpak run org.vinegarhq.Sober"

alias get_loc="echo lat, long, alt: 59.46279 5.57334, 72";

fish_add_path /home/nikee/dev/weather/target/release/
fish_add_path /home/nikee/dev/giter/target/release/

alias taras=/home/nikee/dev/taras/taras

function fish_greeting
    echo welcome to the terminal $USER@$hostname!\n
    echo Weather report for today:\n

    weather --place "møllendalen" --short
end

set -x SSH_AUTH_SOCK $HOME/.ssh/ssh-agent.sock
# set -x XAUTHORITY $HOME/.Xauthority

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin $PATH /home/nikee/.ghcup/bin # ghcup-env
