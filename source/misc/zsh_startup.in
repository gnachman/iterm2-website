ST_NAME=`hostname -f`

# iTerm2 inform terminal that command starts here
before_cmd_executes() {
  printf "\033]133;D;$?\007\033]1337;RemoteHost='$USER'@`hostname -f`\007\033]1337;CurrentDir=$PWD\007"
}

# iTerm2 tell terminal to create a mark at this location
after_cmd_executes() {
  printf "\033]133;C\007"
}

# iTerm2 mark start of prompt
iterm_prompt_start() {
  print -Pn "\033]133;A\007"
}

# iTerm2 mark end of prompt
iterm_prompt_end() {
  print -Pn "\033]133;B\007"
}

PS1="%{$(iterm_prompt_start)%}$PS1%{$(iterm_prompt_end)%}"

precmd() {
  after_cmd_executes
}

preexec() {
  before_cmd_executes
}

printf "\033]1337;RemoteHost='$USER'@`hostname -f`\007"
printf "\033]1337;CurrentDir=$PWD\007"
printf "\033]1337;ShellIntegrationVersion=1\007"

