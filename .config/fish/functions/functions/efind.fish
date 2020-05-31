function efind
    set dir "."
    if not test -z $argv
        set dir $argv[1]
    end

    read -l -P 'Search: ' fzf_query

    set -l select (find -L $dir -name "*$fzf_query*" 2> /dev/null | fzf --query $fzf_query | string escape) 

    set -l open_status 0
    if not test -z "$select"
        e $select
        set open_status $status
    end

    return $open_status
end
