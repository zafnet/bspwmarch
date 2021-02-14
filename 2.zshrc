# MANTENGA 1000 LÍNEAS DE HISTORIAL DENTRO DEL SHELL Y GUÁRDELO EN ~ / .ZSH_HISTORY:

HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

################################ ESTABLECER COLORES DE 'MAN' #################################

function man() {
    env \
    LESS_TERMCAP_mb=$'\e[01;31m' \
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    man "$@"
}

#########COMIENZO DE ALIAS#######   

###### ALIAS MANUALES ###########

alias ll='ls -lha --group-dirs=first'
alias ls='lsd --group-dirs=first'
alias cat='bat'
#alias =' --group-dirs=first'
#alias l=' --group-dirs=first'
#alias =' --group-dirs=first'

####### ALIAS PARA GIT #############
alias gad='git add .'
alias branch='git branch'
alias checkout='git checkout'
alias clone='git clone'
alias commit='git commit -m'
#alias fetch='git fetch'
alias pull='git pull origin'
alias push='git push origin master'
alias status='git status'
#alias tag='git tag'
#alias newtag='git tag -a'

######## COLOREAR LA SALIDA DE GREP (BUENO PARA ARCHIVOS DE REGISTRO)######
alias grep='grep --color=auto'


######################## PACMAN Y YAY #############################

alias inst='sudo pacman -S'   
alias  upda='sudo pacman -Syu' 
#alias yaysua="yay -Sua --noconfirm"
#alias yaysyu="yay -Syu --noconfirm"  

################ OBTENER REPOS MÁS RÁPIDOS ############################################

alias mirror="sudo reflector --latest 20  --sort rate --save /etc/pacman.d/mirrorlist"


###################################### PLUGINS DE ZSH ###################################
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh


