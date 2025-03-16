if status is-interactive
    # Commands to run in interactive sessions can go here
end
alias cls=clear
alias sober="flatpak run org.vinegarhq.Sober"

fish_add_path /home/nikee/dev/weather/target/debug 

function fish_greeting
    echo welcome to the terminal $USER@$hostname!\n
    echo Weather report for today:\n

    /home/nikee/dev/weather/target/release/weather --short
end

set -x SSH_AUTH_SOCK $HOME/.ssh/ssh-agent.sock


set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin $PATH /home/nikee/.ghcup/bin # ghcup-env