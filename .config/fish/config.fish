### CLEANING AND ADDING TO THE PATH
set -e fish_user_paths
set -U fish_user_paths $HOME/.bin $HOME/.local/bin $HOME/Applications /var/lib/flatpak/exports/bin/ $fish_user_paths

### EXPORT ###
set fish_greeting # Supresses fish's intro message
set TERM xterm-256color # Sets the terminal type
set XDG_CONFIG_HOME /home/canalejas/.config

### SET MANPAGER
### "bat" as manpager
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

### AUTOCOMPLETE AND HIGHLIGHT COLORS ###
set fish_color_normal brcyan
set fish_color_autosuggestion '#7d7d7d'
set fish_color_command brcyan
set fish_color_error '#ff6c6b'
set fish_color_param brcyan

### FLATPAK ###
set -l xdg_data_home $XDG_DATA_HOME ~/.local/share
set -gx --path XDG_DATA_DIRS $xdg_data_home[1]/flatpak/exports/share:/var/lib/flatpak/exports/share:/usr/local/share:/usr/share

for flatpakdir in ~/.local/share/flatpak/exports/bin /var/lib/flatpak/exports/bin
    if test -d $flatpakdir
        contains $flatpakdir $PATH; or set -a PATH $flatpakdir
    end
end

### SPARK ###
set -g spark_version 1.0.0

complete -xc spark -n __fish_use_subcommand -a --help -d "Show usage help"
complete -xc spark -n __fish_use_subcommand -a --version -d "$spark_version"
complete -xc spark -n __fish_use_subcommand -a --min -d "Minimum range value"
complete -xc spark -n __fish_use_subcommand -a --max -d "Maximum range value"

function spark -d "sparkline generator"
    if isatty
        switch "$argv"
            case {,-}-v{ersion,}
                echo "spark version $spark_version"
            case {,-}-h{elp,}
                echo "usage: spark [--min=<n> --max=<n>] <numbers...>  Draw sparklines"
                echo "examples:"
                echo "       spark 1 2 3 4"
                echo "       seq 100 | sort -R | spark"
                echo "       awk \\\$0=length spark.fish | spark"
            case \*
                echo $argv | spark $argv
        end
        return
    end

    command awk -v FS="[[:space:],]*" -v argv="$argv" '
        BEGIN {
            min = match(argv, /--min=[0-9]+/) ? substr(argv, RSTART + 6, RLENGTH - 6) + 0 : ""
            max = match(argv, /--max=[0-9]+/) ? substr(argv, RSTART + 6, RLENGTH - 6) + 0 : ""
        }
        {
            for (i = j = 1; i <= NF; i++) {
                if ($i ~ /^--/) continue
                if ($i !~ /^-?[0-9]/) data[count + j++] = ""
                else {
                    v = data[count + j++] = int($i)
                    if (max == "" && min == "") max = min = v
                    if (max < v) max = v
                    if (min > v ) min = v
                }
            }
            count += j - 1
        }
        END {
            n = split(min == max && max ? "▅ ▅" : "▁ ▂ ▃ ▄ ▅ ▆ ▇ █", blocks, " ")
            scale = (scale = int(256 * (max - min) / (n - 1))) ? scale : 1
            for (i = 1; i <= count; i++)
                out = out (data[i] == "" ? " " : blocks[idx = int(256 * (data[i] - min) / scale) + 1])
            print out
        }
    '
end
### END OF SPARK ###

### FUNCTIONS ###
# Spark functions
function commits
    git log --author="$argv" --format=format:%ad --date=short | uniq -c | awk '{print $1}' | spark | lolcat
end

# Function for creating a backup file
# ex: backup file.txt
# result: copies file as file.txt.bak
function backup --argument filename
    cp $filename $filename.bak
end

### END OF FUNCTIONS ###

### ALIASES ###
alias clear='echo -en "\x1b[2J\x1b[1;1H" ; echo; echo; seq 1 (tput cols) | sort -R | spark | lolcat; echo; echo'

# root privileges
alias doas="doas --"

# pipe history into fzf
alias history='history | fzf'

# activate current python environment
alias activate='source venv/bin/activate.fish'

# navigation
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# vim and emacs
alias vim='nvim'
alias n='nvim .'

# Changing "ls" to "exa"
alias ls='exa -al --color=always --group-directories-first' # my preferred listing
alias la='exa -a --color=always --group-directories-first' # all files and dirs
alias ll='exa -l --color=always --group-directories-first' # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.='exa -a | grep -E "^\."'

# pacman and yay
alias update='sudo pacman -Syuy --noconfirm && yay -Syuy --noconfirm && flatpak update'
alias unlock='sudo rm /var/lib/pacman/db.lck' # remove pacman lock
alias cleanup='sudo pacman -Rns (pacman -Qtdq)' # remove orphaned packages

# get fastest mirrors
alias mirror="sudo pacman-mirrors --fasttrack"

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='grep -E --color=auto'
alias fgrep='fgrep --color=auto'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# adding flags
alias df='df -h' # human-readable sizes
alias free='free -m' # show sizes in MB

# ps
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"
alias psmem='ps auxf | sort -nr -k 4'
alias pscpu='ps auxf | sort -nr -k 3'

# git
alias addup='git add -u'
alias addall='git add .'
alias branch='git branch'
alias checkout='git checkout'
alias clone='git clone'
alias commit='git commit -m'
alias fetch='git fetch'
alias pull='git pull origin'
alias push='git push origin'
alias pushf='git push -f'
alias tag='git tag'
alias newtag='git tag -a'

# get error messages from journalctl
alias jctl="journalctl -p 3 -xb"

# switch between shells
# I do not recommend switching default SHELL from bash.
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"
alias tofish="sudo chsh $USER -s /bin/fish && echo 'Now log out.'"

# the terminal rickroll
alias rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'

# Unlock LBRY tips
alias tips="lbrynet txo spend --type=support --is_not_my_input --blocking"

# Add asdf
source /opt/asdf-vm/asdf.fish

# quick access
alias euw='cd ~/Workspace/work/eusend-web/etxweb-vueApp && npm run serve'


### RANDOM COLOR SCRIPT ###
# Or install it from the Arch User Repository: shell-color-scripts
colorscript random

starship init fish | source
zoxide init fish | source

# pnpm
set -gx PNPM_HOME "/home/canalejas/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# launch tmux on fish start
if status is-interactive
and not set -q TMUX
    exec tmux
end
