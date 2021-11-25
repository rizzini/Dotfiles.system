#
# /etc/bash.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ $DISPLAY ]] && shopt -s checkwinsize

PS1='[\u@\h \W]\$ '

case ${TERM} in
  xterm*|rxvt*|Eterm|aterm|kterm|gnome*)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'

    ;;
  screen*)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033_%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'
    ;;
esac

[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion

#export PATH="/opt/VirtualGL/bin/:$PATH"
if [ -n "$(grep nvidia /etc/X11/xorg.conf)" ];then
    if [[ ! "$LD_LIBRARY_PATH" == *'opengl_libs'* ]];then
        export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}${LD_LIBRARY_PATH+:}/mnt/archlinux/opengl_libs/nvidia/"
    fi
    if [ -d "$HOME/.cache/" ];then
        export __GL_SHADER_DISK_CACHE_PATH="$HOME/.cache/";
    else
        mkdir -p $HOME/.cache/
        export __GL_SHADER_DISK_CACHE_PATH="$HOME/.cache/";
    fi
    export KWIN_TRIPLE_BUFFER=1;
    export __GL_YIELD=USLEEP;
    export __GL_MaxFramesAllowed=1;
    export KWIN_COMPOSE=O2ES;
    export __GL_THREADED_OPTIMIZATION=1;
    export __GL_SHADER_DISK_CACHE=1;
fi

alias syadm="yadm -Y /etc/yadm"
