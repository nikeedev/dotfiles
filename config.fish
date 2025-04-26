if status is-interactive
    # Commands to run in interactive sessions can go here
end
alias cls=clear
alias sober="flatpak run org.vinegarhq.Sober"

fish_add_path /home/nikee/dev/weather/target/release/
fish_add_path /home/nikee/.local/share/gem/ruby/3.3.0/bin
fish_add_path /home/nikee/dev/giter/target/release/


function fish_greeting
    echo welcome to the terminal $USER@$hostname!\n
    echo Weather report for today:\n

    weather --short
end

set -x SSH_AUTH_SOCK $HOME/.ssh/ssh-agent.sock

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin $PATH /home/nikee/.ghcup/bin # ghcup-env
