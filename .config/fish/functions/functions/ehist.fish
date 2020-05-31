function ehist
    if not test -z $argv
        set fzf_query $argv[1]
    else
        read -l -P 'Search: ' fzf_query
    end

    history "*$fzf_query*" 2> /dev/null | fzf --query $fzf_query | string escape | sed "s/'//g" | xclip -se c
end

