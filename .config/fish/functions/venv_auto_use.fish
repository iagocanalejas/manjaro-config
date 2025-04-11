function venv_auto_use --on-variable PWD
	if set -q VIRTUAL_ENV
        deactivate
    end
    if test -d ./venv
        . ./venv/bin/activate.fish
    end
end
