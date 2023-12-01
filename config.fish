if status is-interactive
    # Commands to run in interactive sessions can go here
end

abbr --add c clear
abbr --add gco git co
abbr --add gp git pull
abbr --add gb git br
abbr --add gg git grep
abbr --add gs git status

source (brew --prefix asdf)/libexec/asdf.fish

