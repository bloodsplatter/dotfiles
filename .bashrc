alias ls='ls -lh --color --group-directories-first'
alias clipb='xclip -sel c'
alias lock='i3lock'
alias lpcodelist="lpass ls | ack '^.+\/(.+)\ \[id: (\d+)\]$' --output='$1:$2'"
export LPASS_CLIPBOARD_COMMAND="xclip -sel c -i"
export EDITOR="vim visudo"
