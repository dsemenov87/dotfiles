function elocate
    if not test -z $argv
        set fzf_query $argv[1]
    else
        read -l -P 'Search: ' fzf_query
    end

    set -l select (locate $fzf_query 2> /dev/null | fzf --query $fzf_query | string escape) 

    set -l open_status 0
    if not test -z "$select"
        e $select
        set open_status $status
    end

    return $open_status
end

