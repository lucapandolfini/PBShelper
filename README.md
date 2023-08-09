## Useful shortcuts
Place them in your `~/.bashrc` file.

General purpose
```bash
alias qs="qstat -u $USER"
alias qf="qstat -f"
```

### Read standard out/error while the job is running
Usage: `qi JOBID` (or) `qi JOBID | less`

```bash
function qifun() {
             ssh $(qstat -f $1 | grep exec_host | cut -f 7 -d " " | cut -f 1 -d "/") cat /var/spool/pbs/spool/$1*
}

alias qi="qifun"
```
### Check CPU usage on the node where JOBID is running
Usage: `qh JOBID`

```bash
function qhfun() {
             ssh -t $(qstat -f $1 | grep exec_host | cut -f 7 -d " " | cut -f 1 -d "/") htop -u $USER
}

alias qh="qhfun"
```

### Check GPU usage on the node where JOBID is running
Usage: `qn JOBID`

```bash
function qnfun() {
             ssh -t $(qstat -f $1 | grep exec_host | cut -f 7 -d " " | cut -f 1 -d "/") nvidia-smi
}

alias qn="qnfun"
```
