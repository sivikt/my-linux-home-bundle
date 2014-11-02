# Easier navigation: .., ..., ~ and -
alias .1='cd ..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
alias cd..='cd ..'


# Git
alias gt='git'
alias gtcl='git clone'
alias gtco='git checkout'
alias gtpl='git pull'
alias gtph='git push'
alias gtb='git branch'
alias gtst='git status'


# Mercurial
alias hgbg='hg branches | grep'
alias hgb='hg branch'
alias hgud='hg up default'
alias hgu='hg up'
alias hgpl='hg pull'
alias hgm='hg merge'
alias hgmd='hg merge default'
alias hgc='hg ci -m'
alias hgph='hg push'
alias hgphnb='hg push --new-branch'
alias hgi='hg import'
alias hge='hg export -o'
alias hgs='hg st'
alias hgo='hg out'
alias hgh='hg heads .'


# Maven
alias mvncit='mvn clean install'
alias mvnci='mvn clean install -Dmaven.test.skip=true'


# Grunt
alias gw='grunt watch'


# Services
alias rmysql='sudo service mysql start'
alias cmysql='mysql -u root'


# Easier file & directory listing
alias l='ls -CF'  # directories and files in columns
alias la='ls -A'  # directories and files incl. hidden in columns
alias ll='ls -alF'  # everything with extra info as a list
alias lsd='ls -l | grep "^d"'  # only directories as a list
alias l.='ls -d .* --color=auto'


# Shortcuts
alias c="clear"
alias v="vim"
alias es="emacs -nw"
alias bc='bc -l' # calculator with math support
alias sha1='openssl sha1' # generate sha1 digest
alias mkdir='mkdir -pv'
alias diff='colordiff'
# Stop after sending count ECHO_REQUEST packets #
alias ping='ping -c 5'
# Do not wait interval 1 second, go fast #
alias fastping='ping -c 100 -s.2'
alias oports='netstat -tulanp'
# do not delete / or prompt if deleting more than 3 files at a time #
#alias rm='rm -I --preserve-root'
# confirmation #
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
# Parenting changing perms on / #
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
# become root #
alias root='sudo -i'
alias su='sudo -i'


## Archives
alias untar='tar -xvzf'


## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'


# Processes
alias psgrep='ps ax | grep'
alias kill9='kill -9'
## pass options to free ## 
alias meminfo='free -m -l -t'
## get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
## get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'
## Get server cpu info ##
alias cpuinfo='lscpu'
## older system use /proc/cpuinfo ##
##alias cpuinfo='less /proc/cpuinfo' ##
## get GPU ram on desktop / laptop## 
alias gpumeminfo='grep -i --color memory /var/log/Xorg.0.log'


# if user is not root, pass all commands via sudo #
if [ $UID -ne 0 ]; then
    alias reboot='sudo reboot'
    alias apt-get='sudo apt-get'
fi


alias apggen='apg -s -a 1 -m 63 -n 4'
