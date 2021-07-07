#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return
 
# MANTENGA 1000 LÍNEAS DE HISTORIAL DENTRO DEL SHELL Y GUÁRDELO EN ~ / .BASH_HISTORY:
 
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.bash_history
 
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

######################################
NMAP#########################################
# Extract nmap information
function extractPorts(){
	ports="$(cat $1 | grep -oP '\d{1,5}/open' | awk '{print $1}' FS='/' | xargs | tr ' ' ',')"
	ip_address="$(cat $1 | grep -oP '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}' | sort -u | head -n 1)"
	echo -e "\n[*] Extracting information...\n" > extractPorts.tmp
	echo -e "\t[*] IP Address: $ip_address"  >> extractPorts.tmp
	echo -e "\t[*] Open ports: $ports\n"  >> extractPorts.tmp
	echo $ports | tr -d '\n' | xclip -sel clip
	echo -e "[*] Ports copied to clipboard\n"  >> extractPorts.tmp
	cat extractPorts.tmp; rm extractPorts.tmp
}

#############################################################################################
#########COMIENZO DE ALIAS#######  

 
 
################ OBTENER REPOS MÁS RÁPIDOS ############################################
 
alias mirror="sudo reflector --latest 20  --sort rate --save /etc/pacman.d/mirrorlist"

########################################################################################
  
###### ALIAS MANUALES ###########
 
alias ll='ls -lha --group-dirs=first'
alias ls='lsd --group-dirs=first'
alias nv='nvim'
alias can='bat'
alias mk='mkdir'
alias smk='sudo mkdir'
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
################################################

######## COLOREAR LA SALIDA DE GREP (BUENO PARA ARCHIVOS DE REGISTRO)######
alias grep='grep --color=auto'
 
###########################################################################
  
####################### COLORES PARA COMANDO LS ###############################

#LS_COLORS='di=32:fi=35:ln=93:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=37:*.rpm=90'
#export LS_COLORS
###############################################################################
 
######################## PACMAN Y YAY #############################

alias inst='sudo pacman -S'   
alias  actu='sudo pacman -Syu' 
#alias yaysua="yay -Sua --noconfirm"
#alias yasy="yay -Syu --noconfirm"  

###########################################################################

################ OBTENER REPOS MÁS RÁPIDOS ############################################

alias mirror="sudo reflector --latest 5  --sort rate --save /etc/pacman.d/mirrorlist"

########################################################################################3
 
#config bashrc usuario
export PS1="\[\033[38;5;28m\]\u\[$(tput sgr0)\]\[\033[38;5;36m\]@\[$(tput sgr0)\]\[\033[38;5;48m\]\h\[$(tput sgr0)\]\[\033[38;5;13m\]{\[$(tput sgr0)\]\[\033[38;5;43m\]\w\[$(tput sgr0)\]\[\033[38;5;13m\]}\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;10m\]\\$\[$(tput sgr0)\]"
