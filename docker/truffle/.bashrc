# EXPORTS
#######################################################

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

#export PS1="[\[\033[1;34m\w\[\033[0m]\n[\t \u]$ "
export PS1="\[\033[0;35m\]\u@\\h\[\033[0m\]:\w> "
export HISTFILESIZE=3000 # the bash history should save 3000 commands
export HISTCONTROL=ignoredups #don't put duplicate lines in the history.



# Setings
##########################################################
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi


#Aliases
##########################################################
alias hist='history | grep $1' #Requires one input
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias ps='ps auxf'
alias ping='ping -c 2'
alias ll='ls -alF'
alias la='ls -A'
alias lm='ls -l | less'
# list size of all files and dirs and sort
alias imbadu="du -sk ./* | sort -n | awk 'BEGIN{ pref[1]=\"K\"; pref[2]=\"M\"; pref[3]=\"G\";} { total = total + \$1; x = \$1; y = 1; while( x > 1024 ) { x = (x + 1023)/1024; y++; } printf(\"%g%s\t%s\n\",int(x*10)/10,pref[y],\$2); } END { y = 1; while( total > 1024 ) { total = (total + 1023)/1024; y++; } printf(\"Total: %g%s\n\",int(total*10)/10,pref[y]); }'"

#Functions
##########################################################

#Function takes in a file name and it turns it into a script
function vis {
   file=~/bin/$1.sh
   echo $file
   #Test to see if file exists
   if [ -e $file ]
   then {
      echo "File already exists."
      echo "Directory listing for ~/bin/ :"
      ls -l --color=auto ~/bin
   }
   else {
      #Continue creating it if it dosen't exists
      touch $file
      chmod +x $file
      echo "#!/bin/bash" >> $file
      vim $file
      echo "Moved to '$file'."
   }
   fi
}

# Cool History Summerizer
historyawk(){ history|awk '{a[$2]++}END{for(i in a){printf"%5d\t%s\n",a[i],i}}'|sort -nr|head; }

# handy find/grep aliases
rgrep() { fgrep -niIR "${1}" .; }
finame() { find . -iname "*${1}*"; }


# loads .profile
if [[ -e ~/.profile ]]; then
	. ~/.profile
fi

echo -e "\
         ____                 _           _         _   _               \n\
        |  _ \  _____   _____| |__   __ _(_)_ __   | | | |___  ___ _ __ \n\
        | | | |/ _ \ \ / / __| '_ \ / _\` | | '_ \  | | | / __|/ _ \ '__|\n\
        | |_| |  __/\ V / (__| | | | (_| | | | | | | |_| \__ \  __/ |   \n\
        |____/ \___| \_/ \___|_| |_|\__,_|_|_| |_|  \___/|___/\___|_|   \n\
                                                                        \n\
       ____                                 _____            __  __ _      \n\
      / ___|_ __ ___  _   _ _ __           |_   _| __ _   _ / _|/ _| | ___ \n\
     | |  _| '__/ _ \| | | | '_ \   _____    | || '__| | | | |_| |_| |/ _ \\n\
     | |_| | | | (_) | |_| | |_) | |_____|   | || |  | |_| |  _|  _| |  __/\n\
      \____|_|  \___/ \__,_| .__/            |_||_|   \__,_|_| |_| |_|\___|\n\
                           |_|                                             \n"
