# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

source ~/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme

#UTILIDAD EXTRACTPORT

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

function mkt(){
	mkdir {nmap,content,exploits,scripts}
}

#######################################################################################
#UTILIDAD CONTROLC REPORTMACHINE
reportMachine () {
        if [ $1 ]
        then
                machine_name=$1 
                mkdir -p Report/$machine_name
                pushd Report/$machine_name &> /dev/null
                mkdir -p {Alcance,Reconocimiento/"Enumeración de servicios",Vulnerabilidades,zzz_data/Images}
                pushd Reconocimiento &> /dev/null
                echo "TWVkaWFudGUgdW4gcmVjb25vY2ltaWVudG8gZGUgcHVlcnRvcyBlZmVjdHVhZG8gY29uIE5tYXAsIGhhIHNpZG8gcG9zaWJsZSBpZGVudGlmaWNhciBsb3Mgc2lndWllbnRlcyBwdWVydG9zIGFiaWVydG9zOgoKQSBjb250aW51YWNpw7NuLCBzZSBsaXN0YW4gbGFzIHZlcnNpb25lcyB5IGxvcyBzZXJ2aWNpb3MgcXVlIGNvcnJlbiBwYXJhIGNhZGEgdW5vIGRlIGVzdG9zOgo=" | base64 -d > "Escaneo de puertos.md"
                echo "QSB0cmF2w6lzIGRlbCB2YWxvciBkZWwgKipUVEwqKiwgaGEgc2lkbyBwb3NpYmxlIGlkZW50aWZpY2FyIGVsIHNpc3RlbWEgb3BlcmF0aXZvIGVuIHVzbyBwb3IgZWwgc2Vydmlkb3IgcmVtb3RvLiBFc3RlIHZhbG9yIGVzIHZpc2libGUgbWVkaWFudGUgZWwgZW52w61vIGRlIHVuYSB0cmF6YSBJQ01QIGVuIGxhIHJlc3B1ZXN0YSBkZWwgc2Vydmlkb3I6Cg==" | base64 -d > "Sistema Operativo.md"
                popd &> /dev/null
                pushd Alcance &> /dev/null
                echo "RWwgb2JqZXRpdm8gZGUgZXN0YSBhdWRpdG9yw61hIGNvbXByZW5kZSBlbCBhbsOhbGlzaXMgZGUgdnVsbmVyYWJpbGlkYWRlcyBkZWwgc2Vydmlkb3IgYG1hY2hpbmVfbmFtZWAsIHNpZW5kbyBuZWNlc2FyaW8gY3VtcGxpciBjYWRhIHVubyBkZSBsb3Mgc2lndWllbnRlcyBwdW50b3M6CgoqIERldGVybWluYXIgbGFzIHZ1bG5lcmFiaWxpZGFkZXMgZXhpc3RlbnRlcyBlbiBsb3Mgc2VydmljaW9zIGV4cHVlc3RvcwoqIExsZXZhciBhIGNhYm8gdW5hIGV4cGxvdGFjacOzbiBkZSBsYXMgdnVsbmVyYWJpbGlkYWRlcyBlbmNvbnRyYWRhcywgZGV0YWxsYW5kbyBlbCBpbXBhY3RvIHkgYWxjYW5jZSBkZSBlc3RhcwoqIEVuIGNhc28gZGUgZ2FuYXIgYWNjZXNvIGFsIHNlcnZpZG9yLCBidXNjYXIgdsOtYXMgcG90ZW5jaWFsZXMgZGUgZXNjYWxhciBwcml2aWxlZ2lvcyBwYXJhIGNvbnZlcnRpcnNlIGVuIGFkbWluaXN0cmFkb3IgZGVsIHNpc3RlbWEKCkxvcyBwdW50b3MgYW50ZXJpb3JtZW50ZSBjaXRhZG9zIGRlYmVyw6FuIGlyIGFjb21wYcOxYWRvcyBkZSBldmlkZW5jaWFzIHF1ZSBqdXN0aWZpcXVlbiBjYWRhIHVubyBkZSBsb3MgdmVjdG9yZXMgZW5jb250cmFkb3MsIHB1ZXMgZW4gY2FzbyBjb250cmFyaW8gZXN0YXMgb2N1cnJlbmNpYXMgc2Vyw6FuIHRvbWFkYXMgY29tbyBpbnbDoWxpZGFzLgoKTGFzIHNpZ3VpZW50ZXMgcHJ1ZWJhcyBxdWVkYW4gZXhjbHVpZGFzIGR1cmFudGUgZWwgcHJvY2VzbyBkZSBhdWRpdG9yw61hOgoKKiBEZW5lZ2FjaW9uZXMgZGUgU2VydmljaW8gKERvUykK" | base64 -d | sed 's|machine_name|'"$machine_name"'|g' > Objetivos.md
                popd &> /dev/null
                pushd Vulnerabilidades &> /dev/null
                echo "IyDDjW5kaWNlIGRlIHZ1bG5lcmFiaWxpZGFkZXMgZGV0ZWN0YWRhcwoKKiBbQW50ZWNlZGVudGVzXSgjYW50ZWNlZGVudGVzKQoqIFtWdWxuZXJhYmlsZGFkZXNdKCN2dWxuZXJhYmlsaWRhZGVzKQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQojIyBBbnRlY2VkZW50ZXMKTGEgcHJlc2VudGUgcMOhZ2luYSB0cmF0YSBkZSByZXByZXNlbnRhciBjYWRhIHVuYSBkZSBsYXMgdnVsbmVyYWJpbGlkYWRlcyBkZXRlY3RhZGFzIHNvYnJlIGVsIGFjdGl2byBhdWRpdGFkby4gVW5hIHZleiBjb25jbHVpZGEgbGEgYXVkaXRvcsOtYSwgc2UgYm9ycsOzIHRvZG8gdGlwbyBkZSBhcmNoaXZvIHRlbXBvcmFsIGNyZWFkbyBlbiBlbCBzaXN0ZW1hLgoKIyMgVnVsbmVyYWJpbGlkYWRlcwo=" | base64 -d > Ocurrencias.md
                popd &> /dev/null && popd &> /dev/null
                chown $(who -q | awk '{print $1}' | head -n 1):$(who -q | awk '{print $1}' | head -n 1) -R Report
        else
                echo -e "\n[!] Uso: reportMachine machineName\n"
        fi
}


########################################################################################
#UTILIDAD WHYCSYSTEM

#!/usr/bin/python

import subprocess, re, sys

def return_ttl(address):
	proc = subprocess.Popen(["ping -c 1 %s" % address, ""], stdout=subprocess.PIPE, shell=True)
	(out, err) = proc.communicate()
	out = out.split()
	out = re.findall(r"\d{1,3}", out[12])

	return out[0]

def return_ttl_os_name(ttl_number):

	if ttl_number >= 0 and ttl_number <= 64:
		return "Linux"
	elif ttl_number >= 65 and ttl_number <= 128:
		return "Windows"
	else:
		return "Unknown"

if len(sys.argv) != 2:
	print "\n[*] Usage: python " + sys.argv[0] + " <ip-address>\n"
	sys.exit(1)

if __name__ == '__main__':
	addr = sys.argv[1]
	ttl = return_ttl(addr)

	try:
		print "\n%s -> %s" % (addr, return_ttl_os_name(int(ttl)))
	except:
		pass
#########################################################################
#########COMIENZO DE ALIAS##############################################   

###### ALIAS MANUALES #########################

alias ll='ls -lha --group-dirs=first'
alias ls='lsd --group-dirs=first'
#alias cat='bat'
#alias =' --group-dirs=first'
#alias l=' --group-dirs=first'
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
alias  upda='sudo pacman -Syu' 
#alias yaysua="yay -Sua --noconfirm"
#alias yaysyu="yay -Syu --noconfirm"  

################ OBTENER REPOS MÁS RÁPIDOS ############################################

alias mirror="sudo reflector --latest 20  --sort rate --save /etc/pacman.d/mirrorlist"


###################################### PLUGINS DE ZSH ###################################
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

############## ESTOS SON COMO COLORES PARA TMUX EN LA TTY PERO SALEN COMO CLAROS LOS COLORES ###############
# if [ "$TERM" = "linux" ]; then
#    echo -en "\e]P0343742" #black
#    echo -en "\e]P1F5958B" #darkred
#    echo -en "\e]P2B7E48C" #darkgreen
#    echo -en "\e]P3FFFFB9" #brown
#    echo -en "\e]P47EB6FF" #darkblue
#    echo -en "\e]P5C5C8C6" #darkmagenta
#    echo -en "\e]P6C2EFFF" #darkcyan
#    echo -en "\e]P7DDDDDD" #lightgrey
#    echo -en "\e]P8CCCCCC" #darkgrey
#    echo -en "\e]P9FF8D80" #red
#   echo -en "\e]PADBFFB3" #green
#    echo -en "\e]PBFFBE64" #yellow
#    echo -en "\e]PCA8CEEA" #blue
#    echo -en "\e]PDE296FF" #magenta
#    echo -en "\e]PE9CE9FF" #cyan
#    echo -en "\e]PFEEEEEE" #white
#    #clear #for background artifacting
#fi
############################################################################

####################### COLORES PARA COMANDO LS ###############################

LS_COLORS='di=32:fi=35:ln=93:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=37:*.rpm=90'
export LS_COLORS
###############################################################################


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
