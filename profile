#############################################
#### .profile
####

########################
## Setup Path
##

# Lower Indices have higher precedence.
BIN_PATHS[0]="$HOME/.home-bin"
BIN_PATHS[1]="/usr/local/bin"
BIN_PATHS[2]="/usr/local/opt/groovy/libexec/bin" # Groovy
BIN_PATHS[3]="$HOME/.rbenv/bin"
BIN_PATHS[4]="/usr/local/rbenv/bin" # Sometimes I put rbenv files here.
BIN_PATHS[5]="/usr/local/opt/apr/bin"
BIN_PATHS[6]="/usr/local/opt/apr-util/bin"
BIN_PATHS[7]="/usr/local/opt/openssl@1.1/bin"


index=${#BIN_PATHS[*]}
while [ $index -gt 0 ]; do
  ((index--))
  
  currpath=${BIN_PATHS[$index]}
    
  if [ -d $currpath ]; then 
    export PATH=$currpath:$PATH;
  fi
  
done

unset index
unset currpath
unset BIN_PATHS

########################
## Enable rbenv
##

if which rbenv > /dev/null; then
  eval "$(rbenv init -)";
fi

########################
## Source Other Files
##

SOURCE_PATHS[0]=$HOME/.bashrc
SOURCE_PATHS[1]=$HOME/.bash_aliases
SOURCE_PATHS[2]=$HOME/.project_aliases

for currpath in "${SOURCE_PATHS[@]}"; do
  if [ -f $currpath ]; then
    source $currpath;
  fi
done

unset currpath
unset SOURCE_PATHS

##########################
## Setup Bash Completions
##

COMPLETION_PATHS[0]="/usr/local/etc/bash_completion.d/docker"
COMPLETION_PATHS[1]="/usr/local/etc/bash_completion.d/brew"
COMPLETION_PATHS[2]="/usr/local/etc/bash_completion.d/npm"
COMPLETION_PATHS[3]="/usr/local/etc/bash_completion.d/git-completion.bash"
COMPLETION_PATHS[4]="/usr/local/etc/bash_completion.d/watson"

for currpath in "${COMPLETION_PATHS[@]}"; do
  if [ -f $currpath ]; then
    source $currpath;
  fi
done

unset currpath
unset COMPLETION_PATHS

##########################
## Setup Prompt
##

GIT_PROMPT="/usr/local/etc/bash_completion.d/git-prompt.sh"

# Basic Prompt
PS1="\u@\h \W \$ "

# Modify Prompt with Git
if [ -f $GIT_PROMPT ]; then
  source $GIT_PROMPT;
  PS1="\u@\h \W\$(__git_ps1 \":%s\")\$ "
fi



if [ -d ~/miniconda3 ]; then
	# >>> conda initialize >>>
	# !! Contents within this block are managed by 'conda init' !!
	__conda_setup="$('/Users/tobiasoleary/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
	if [ $? -eq 0 ]; then
	    eval "$__conda_setup"
	else
	    if [ -f "/Users/tobiasoleary/miniconda3/etc/profile.d/conda.sh" ]; then
	        . "/Users/tobiasoleary/miniconda3/etc/profile.d/conda.sh"
	    else
	        export PATH="/Users/tobiasoleary/miniconda3/bin:$PATH"
	    fi
	fi
	unset __conda_setup
	# <<< conda initialize <<<
fi

