function try_source --argument-names file
    if test -r $file
        source $file
    end
end
