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
<<<<<<< HEAD

if [[ "$DISPLAY" == ':0' && -n "$(grep nvidia /etc/X11/xorg.conf)" ]];then
    if [[ ! "$LD_LIBRARY_PATH" == *'opengl_libs'* ]];then
=======
if [ "$DISPLAY" == ':1' ];then
    if [[ ! "$LD_LIBRARY_PATH" == *'mnt/archlinux/opengl_libs/nvidia'* ]];then
>>>>>>> a09152429cfaa7b597515ecd815647959a7511c2
        export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}${LD_LIBRARY_PATH+:}/mnt/archlinux/opengl_libs/nvidia/"
    fi
fi

alias syadm="yadm -Y /etc/yadm"
