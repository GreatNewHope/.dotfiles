MACIKIRU=24:4B:FE:53:39:69
BROADCAST=192.168.1.255
PORTNUMBER=9

wake_on_lan () {
  echo -e $(echo $(printf 'f%.0s' {1..12}; printf "$(echo "$1" | sed 's/://g')%.0s" {1..16}) | sed -e 's/../\\x&/g') | nc -w1 -u -b "$2" "$3"
}

alias rr="ranger"
alias zshconfig="nvim /home/marcos/.zshrc"
alias i3config="nvim /home/marcos/.i3/config"
alias nvimconfig="nvim /home/marcos/.config/nvim/init.vim"
alias aliases="nvim /home/marcos/.oh-my-zsh/custom/zsh_aliases.zsh"
alias wake_ikiru='wake_on_lan $MACIKIRU $BROADCAST $PORTNUMBER'
alias check_temp='head -n 1 /sys/class/thermal/thermal_zone0/temp | xargs -I{} awk "BEGIN {printf \"%.2f\n\", {}/1000}"'
alias ll='ls -l'
alias la='ls -la'
