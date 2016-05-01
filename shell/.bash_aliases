# echo .bash_my loaded from extern

# outdated: export PATH="$PATH:$DIR/bash/scripts"
# export CDPATH="$CDPATH=.:~/programming/web/"

# outdated: export WORKON_HOME="$HOME/Envs"
# source $HOME/bin/virtualenvwrapper_bashrc

extract() {
    if [ -f "$1" ] ; then
        case "$1" in
            *.tar.bz2) tar xjf "$1" ;;
            *.tar.gz) tar xzf "$1" ;;
            *.tar.Z) tar xzf "$1" ;;
            *.bz2) bunzip2 "$1" ;;
            *.rar) unrar x "$1" ;;
            *.gz) gunzip "$1" ;;
            *.jar) unzip "$1" ;;
            *.tar) tar xf "$1" ;;
            *.tbz2) tar xjf "$1" ;;
            *.tgz) tar xzf "$1" ;;
            *.zip) unzip "$1" ;;
            *.Z) uncompress "$1" ;;
            *) echo "'$1' cannot be extracted." ;;
        esac
    else
        echo "'$1' is not a file."
    fi
}

mktar() { tar cvf  "${1%%/}.tar"     "${1%%/}/"; }
mktgz() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }
mktbz() { tar cvjf "${1%%/}.tar.bz2" "${1%%/}/"; }
mktxz() { tar cvJf "${1%%/}.tar.xz" "${1%%/}/"; }
# Make a directory and then CD into it.
mkcd() { mkdir -p "$*"; cd "$*"; }

# beeps off
if [ -n "$DISPLAY" ]; then
  xset b off
fi

alias soa="source bin/activate"
alias soav="source ~/venv_horse/bin/activate"

alias con1='conky -q -c $DIR/../conky/.conky_calender; conky -q -c $DIR/../conky/.conkyrc'
alias con2='cd $DIR/../conky/; conky -q -c .conky_calender; conky -q -c .conkyrc'

# variables
user=$(whoami)
home_dir=$(echo "/home/$user")
bash_scripts=$(echo "$DIR"/bash)
# echo $bash_scripts
# $DIR = ..siehe redirect! variable for this directory

# alias ls='ls -lF'
alias pydoc='python -m pydoc'
alias dir='ls --color=auto --format=vertical'
alias vdir='ls --color=auto --format=long'
alias l.='ls -d .??*'
alias ld='ls -d */'
alias ll='ls -lhX'
alias la='ls -a | grep ^.*'
alias ldir='ls -lhA |grep ^d'
alias lfiles='ls -lhA |grep ^-'
#alias l='ls -CF'

# cpufreq aliases
alias ci='cpufreq-info'
alias cig='cpufreq-info|grep mom; cpufreq-info|grep current'
function cs {
# echo :$1:
if [ $1 ]; then
    cpuspeed=$1
    echo argument passed :$1: condition met
else
    cpuspeed="800"
    echo else condition met, default "$cpuspeed" used
fi
sudo cpufreq-set -d 800Mhz; sudo cpufreq-set -c1 -d 800Mhz;
sudo cpufreq-set -u "$cpuspeed"Mhz; sudo cpufreq-set -c1 -u "$cpuspeed"Mhz;
sudo cpufreq-set -g conservative; sudo cpufreq-set -c1 -g conservative;
cpufreq-info | grep mom; }
function fanmanipulation { echo level "$1" | sudo tee /proc/acpi/ibm/fan; }

# git
alias ga='git add $1'
alias gas='git add . |gc'
alias gs='git status'
alias gp='git push'
alias gc='git commit -m $1'
alias gr='git remote $1'
#
# To see something coming into ls output: lss
alias lss='ls -lrt | grep $1'

# To check a process is running in a box with a heavy load: pss
alias pss='ps -ef | grep $1'

# base dir nav
alias programming='cd $home_dir/programming; ls'
alias documents='cd $home_dir/documents'
alias music='cd $home_dir/music'
alias downloads='cd $home_dir/downloads'
alias cfg='cd $(echo -n "$DIR/$*")'
# alias cfg='chmod +x $bash_scripts/args_to_path ; .$bash_scripts/args_to_path $* ; chmod -x $bash_scripts/args_to_path'
# alias cfg='$bash_scripts args_to_path $*'

# from kenneth
# Python/Django
function idle3 {
idle-python3.2
}
export idle3
# alias idle3="idle-python3.2"
alias pm="python3 manage.py"
alias sm="python3 manage.py schemamigration"
alias m="python3 manage.py migrate"
alias pms="python3 manage.py shell"
alias pmr='python3 manage.py runserver'
alias pmrp="python3 manage.py runserver_plus"
alias pmsp="python3 manage.py shell_plus"
alias dgo='source bin/activate; pip freeze'
alias django='cd $(echo $home_dir/programming/web/)'

