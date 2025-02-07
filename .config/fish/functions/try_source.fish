function try_source -a file
    if test -f $file
        source $file
    end
end
