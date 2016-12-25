#####################################
## .bash_aliases
## Holds all my aliases & functions
## Referenced from .profile
#####################################
#### - Functions
#### - Aliases
#### 

#############################
## Functions
#############################
## - https, https, www
## - cdf

#####################
## Quick Opening
##

#opens web page with http
function http {
	open "http://$1"
}

#opens web page with https
function https {
	open "https://$1"
}

#opens web page with https
function www {
  open "https://$1"
}

#opens web at localhost
# $1 - portnumber
# $2 - path
function localhost {
  open "http://localhost:$1$2"
}

# cd into whatever is the forefront Finder window.
cdf() {  # short for cdfinder
  cd "`osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)'`"
}


#############################
## ALIASES
#############################
## - Enhancing Common Commands
## - Quick Terminal
## - Quick Opening
## - Quick CDing
## - Quick Editoring
## - Quick SSH
## - Utilties
## - Quick Local Server Management
## - Ruby & Rails Helpers
## - Fun & Games


#####################
## Overriding / Enhancing Common Commands
##

alias ls="ls -FG"
alias ll='ls -FGlhA'
alias la="ls -AFG"

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias mkdir='mkdir -pv'
alias ping='ping -c 5'

alias mate="mate --recent"

#####################
## Quick Terminal
##

alias c="clear"
alias h="history"

#####################
## Quick Opening
##

## Apps
alias acorn="open /Applications/Acorn.app"
alias timekeeper="open /Applications/TimeKeeper.app"
alias safari="open /Applications/Safari.app"
alias chrome="open /Applications/Chrome.app"
alias firefox="open -a /Applications/Firefox.app"
alias mail="open /Applications/Mail.app"
alias slack="open /Applications/Slack.app"
alias sketch="open /Applications/Sketch.app"
alias activitymonitor="open /Applications/Utilities/Activity\ Monitor.app"
alias sequelpro="open /Applications/Sequel\ Pro.app"
alias transmit="open /Applications/Transmit.app"
alias dash="open /Applications/Dash.app"
alias xcode="open /Applications/Xcode.app"

## Sites

alias github="open https://github.com"

#####################
## Quick CDing
##

alias ..="cd .."
alias ...="cd ../.."

#####################
## Quick Editoring
##

QUICK_EDITOR=""
if which mate > /dev/null; then
  QUICK_EDITOR="mate"
elif which subl > /dev/null; then
  QUICK_EDITOR="subl -n"
elif which atom > /dev/null; then
  QUICK_EDITOR="atom -n"
elif [ ! -z "$EDITOR" ]; then 
  QUICK_EDITOR="$EDITOR"
fi 
  

if [ ! -z QUICK_EDITOR ]; then
  alias hosts="$QUICK_EDITOR /etc/hosts"
  alias vhosts="$QUICK_EDITOR /etc/apache2/extra/httpd-vhosts.conf"
  alias aliases="$QUICK_EDITOR $HOME/.bash_aliases"
  alias profile="$QUICK_EDITOR $HOME/.profile"
  alias bashrc="$QUICK_EDITOR $HOME/.bashrc"
  alias phpini="$QUICK_EDITOR /etc/php.ini"
fi

unset QUICK_EDITOR

#####################
## Quick SSH
##

# port stuff is for rmate
alias ssh-islamey="ssh -R 52698:localhost:52698 -p 46559 webmin@islamey.tobiasoleary.com"

#####################
## Utilies
##

alias path='echo -e ${PATH//:/\\n}'
alias fastping='ping -c 5 -s2'
alias resource="source ~/.profile"
alias myip="dig +short myip.opendns.com @resolver1.opendns.com;"
alias git-warning-fix="rm .git/refs/remotes/origin/HEAD && git fetch --all"
alias clean-xcode-profiles="rm ~/Library/MobileDevice/Provisioning\ Profiles/*"
alias pull-dotfiles="cd ~/.dotfiles && git pull"

# Argument $1 is the commit message
function push-dotfiles {
  cd ~/.dotfiles && git add . && git commit -m "$1" && git push
}


#requires wget
if which wget > /dev/null; then 
  alias speedtest="wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip;"
else
  alias speedtest="echo 'speedtest - requires wget to be installed.'"
fi

#####################
## Quick Local Server Management
##

## Docker
alias swagger-editor-start="docker run -p 8080:8080 swaggerapi/swagger-editor"

## Apache
alias apache-start="sudo apachectl start"
alias apache-stop="sudo apachectl stop"
alias apache-restart="sudo apachectl restart"

## NGINX
alias nginx-start="nginx"
alias nginx-reload="nginx -s reload"
alias nginx-restart="nginx -s reopen"
alias nginx-stop="nginx -s stop"

## MYSQL
alias mysql-start="mysql.server start"
alias mysql-restart="mysql.server restart"
alias mysql-stop="mysql.server stop"

#####################
## Ruby & Rails Helpers
##	

alias rb="rbenv" 
alias bake="bundle exec rake"
alias cake="bundle exec cap"

#Uninstalls all gems
if which rbenv > /dev/null; then 
  alias gem-uninstall-all='gem list --no-version | grep -v rbenv* | xargs gem uninstall -aIx'
else
  alias gem-uninstall-all='gem list | cut -d" " -f1 | xargs gem uninstall -aIx && '
fi

#####################
## Fun & Games
##

alias play-ascii-startwars="telnet towel.blinkenlights.nl"
