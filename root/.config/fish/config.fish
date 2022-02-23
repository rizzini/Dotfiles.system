set fish_greeting;
set VIRTUAL_ENV_DISABLE_PROMPT "1";
source ("/usr/bin/starship" init fish --print-full-init | psub);
alias syadm="sudo yadm -Y /etc/yadm";
