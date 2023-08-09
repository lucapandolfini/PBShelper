alias qs="qstat -u $USER"
alias qf="qstat -f"

function qifun() {
             ssh $(qstat -f $1 | grep exec_host | cut -f 7 -d " " | cut -f 1 -d "/") cat /var/spool/pbs/spool/$1*
}

alias qi="qifun"

function qhfun() {
             ssh -t $(qstat -f $1 | grep exec_host | cut -f 7 -d " " | cut -f 1 -d "/") htop -u $USER
}

alias qh="qhfun"

function qnfun() {
             ssh -t $(qstat -f $1 | grep exec_host | cut -f 7 -d " " | cut -f 1 -d "/") nvidia-smi
}

alias qn="qnfun"
