function nvm_auto_use --on-variable PWD
    if test -f .nvmrc
        nvm use
    end
end
