# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi
NEWLINE=$'\n'
TEAL=$'\[\033[38;5;87m\]'
NC=$'\[\033[0m\]'
YELLOW=$'\[\033[38;5;220m\]'
GREEN=$'\[\033[38;5;155m\]'
LIGHT_GREEN=$'\[\033[24;38;5;150m\]'
TAN=$'\[\033[4;38;5;222m\]'
LAVENDER=$'\[\033[38;5;189m\]'

function prompt_cmd
{
  X_WIDTH="$(stty size < /dev/tty | cut -d" " -f2)"
  LINE_ONE_HOST_INFO="${NEWLINE}${TEAL}┌──╢ ${GREEN}${USER}${TEAL}@${YELLOW}${HOSTNAME} ${TEAL}╟──╢ ${TAN}"
  LINE_ONE_PATH=$(sed -e "s|$HOME|~|g" <<<"$PWD")
  temp_line_one="$(sed -e 's|\\\[[^]]*\]||g' <<<"${LINE_ONE_HOST_INFO}${LINE_ONE_PATH}")"
  count="$(wc -m <<<"${temp_line_oney}}")"
  if ((( count > X_WIDTH - 4 ))); then
    delta=$(( count - X_WIDTH ))
    LINE_ONE_PATH=$(echo "$LINE_ONE_PATH" | sed -e "s|/.\{${delta}\}[^/]*|/...|")
  fi
  LINE_ONE="${LINE_ONE_HOST_INFO}${LINE_ONE_PATH}"
  export PS1="${LINE_ONE}/${NC}${NEWLINE}${TEAL}│${NEWLINE}${TEAL}└─╢ ${LAVENDER}\t${TEAL} ╟──${LIGHT_GREEN}\$ ${NC}"
}

export PROMPT_COMMAND=prompt_cmd
