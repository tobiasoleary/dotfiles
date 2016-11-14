# .profile

########################
## Setup Path

# Setup Path Variables - NOTE: The seperator is in the variables


HOME_BIN_PATH="$HOME/.home-bin"
BREW_PATH="/usr/local/bin"
RBENV_PATH="$HOME/.rbenv/bin"
RBENV_LOCAL_PATH="/usr/local/rbenv/bin" # Sometimes I make rbenv files install into this non-standard dir

if [ -d $HOME_BIN_PATH ]; then
  HOME_BIN_PATH="$HOME_BIN_PATH:"
else
  HOME_BIN_PATH=""
fi

if [ -d BREW_PATH ]; then
  BREW_PATH="$BREW_PATH:"
else
  BREW_PATH=""
fi

if [ -d RBENV_PATH ]; then
  RBENV_PATH="$RBENV_PATH:"
else
  RBENV_PATH=""
fi

if [ -d RBENV_LOCAL_PATH ]; then
  RBENV_LOCAL_PATH="$RBENV_LOCAL_PATH:"
else
  RBENV_LOCAL_PATH=""
fi

export PATH="$HOME_BIN_PATH$BREW_PATH$RBENV_PATH$RBENV_LOCAL_PATH$PATH"

# Enable rbenv
if which rbenv > /dev/null; then 
	eval "$(rbenv init -)"; 
fi

# Import .bashrc if avaialble
if [ -f $HOME/.bashrc ]; then
	source $HOME/.bashrc
fi

# Import .bash_aliases if available
if [ -f $HOME/.bash_aliases ]; then
	source $HOME/.bash_aliases;
fi

##########################
## Setup Bash Completions

DOCKER_COMPLETION="/usr/local/etc/bash_completion.d/docker"
BREW_COMPLETION="/usr/local/etc/bash_completion.d/brew"
NODE_COMPLETION="/usr/local/etc/bash_completion.d/node"
GIT_COMPLETION="/usr/local/etc/bash_completion.d/git-completion.bash"
WASTON_COMPLETION="/usr/local/etc/bash_completion.d/watson"

# Bash Completion for Docker
if [ -f $DOCKER_COMPLETION ]; then
	source $DOCKER_COMPLETION;
fi

# Bash Completion for Brew (Homebrew)
if [ -f $BREW_COMPLETION ]; then
	source $BREW_COMPLETION;
fi

# Bash Completion for Node
if [ -f $NODE_COMPLETION ]; then
	source $NODE_COMPLETION;
fi

# Bash Completion for Git
if [ -f $GIT_COMPLETION ]; then
	source $GIT_COMPLETION;
fi

# Bash Completion for Git
if [ -f $WASTON_COMPLETION ]; then
	source $WASTON_COMPLETION;
fi

##########################
## Setup Prompt

GIT_PROMPT="/usr/local/etc/bash_completion.d/git-prompt.sh"

# Basic Prompt
PS1="\u@\h \W \$ "

# Modify Prompt with Git
if [ -f $GIT_PROMPT ]; then
	source $GIT_PROMPT;
  PS1="\u@\h \W\$(__git_ps1 \":%s\")\$ "
fi

