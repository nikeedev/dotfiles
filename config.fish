if status is-interactive
    # Commands to run in interactive sessions can go here
end
alias cls=clear

fish_add_path /home/nikee/dev/weather/target/debug 

function fish_greeting
    echo welcome to the terminal $USER@$hostname!\n
    echo Weather report for today:\n

    /home/nikee/dev/weather/target/release/weather --short

end

