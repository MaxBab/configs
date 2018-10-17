# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# History file config
# Don't put duplicate lines in the history. See bash(1) for more options
HISTCONTROL=ignoredups:ignorespace
# For setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# Virtual Wrapper config
export WORKON_HOME=$HOME/Projects/Envs
source /usr/bin/virtualenvwrapper.sh

# Powerline-go config
function _update_ps1() {
    PS1="$(/usr/bin/powerline-go -cwd-max-depth 1 -modules "venv,user,host,ssh,cwd,perms,git,hg,jobs,exit,root,docker" -priority "root,cwd,user,host,ssh,perms,git-branch,git-status,hg,jobs,exit,docker" -error $?)"
}

if [ "$TERM" != "linux" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

# Allow passwordless access to libvirt daemon
export LIBVIRT_DEFAULT_URI=qemu:///system

# Terraform autocomplete
complete -C /opt/terraform/terraform terraform
