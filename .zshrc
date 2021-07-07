# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
export ZSH=$HOME/powerlevel10k

source ~/powerlevel10k/powerlevel10k.zsh-theme

# MANTENGA 1000 LÍNEAS DE HISTORIAL DENTRO DEL SHELL Y GUÁRDELO EN ~ / .ZSH_HISTORY:

HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

########################################FUNCION NMAP#########################################
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

###############################################################################################

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

#########COMIENZO DE ALIAS##############################################   

###### ALIAS MANUALES #########################

alias ll='ls -lha --group-dirs=first'
alias ls='lsd --group-dirs=first'
alias nv='nvim'
alias can='bat'
alias mk='mkdir'
alias smk='sudo mkdir'
#alias =' --group-dirs=first'

##############################################

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

######################## PACMAN Y YAY #############################

alias inst='sudo pacman -S'   
alias  actu='sudo pacman -Syu' 
#alias yaysua="yay -Sua --noconfirm"
#alias yasy="yay -Syu --noconfirm"  

################ OBTENER REPOS MÁS RÁPIDOS ############################################

alias mirror="sudo reflector --latest 5  --sort rate --save /etc/pacman.d/mirrorlist"


###################################### PLUGINS DE ZSH ###################################
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

####################### COLORES PARA COMANDO LS ###############################

#LS_COLORS='di=32:fi=35:ln=93:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=37:*.rpm=90'
#export LS_COLORS
###############################################################################


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
export ZSH=$HOME/powerlevel10k

source ~/powerlevel10k/powerlevel10k.zsh-theme

# MANTENGA 1000 LÍNEAS DE HISTORIAL DENTRO DEL SHELL Y GUÁRDELO EN ~ / .ZSH_HISTORY:

HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

########################################FUNCION NMAP#########################################
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

###############################################################################################

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

#########COMIENZO DE ALIAS##############################################   

###### ALIAS MANUALES #########################

alias ll='ls -lha --group-dirs=first'
alias ls='lsd --group-dirs=first'
alias nv='nvim'
alias can='bat'
alias mk='mkdir'
alias smk='sudo mkdir'
#alias =' --group-dirs=first'

##############################################

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

######################## PACMAN Y YAY #############################

alias inst='sudo pacman -S'   
alias  actu='sudo pacman -Syu' 
#alias yaysua="yay -Sua --noconfirm"
#alias yasy="yay -Syu --noconfirm"  

################ OBTENER REPOS MÁS RÁPIDOS ############################################

alias mirror="sudo reflector --latest 5  --sort rate --save /etc/pacman.d/mirrorlist"


###################################### PLUGINS DE ZSH ###################################
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

####################### COLORES PARA COMANDO LS ###############################

#LS_COLORS='di=32:fi=35:ln=93:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=37:*.rpm=90'
#export LS_COLORS
###############################################################################


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
