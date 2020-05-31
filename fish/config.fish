# disable greeting
function fish_greeting
end

# warn when using rm
alias rm "echo 'warning: use `trash` for soft deletions'; and /bin/rm"

# init starship
starship init fish | source
