#################
## .bashrc
##


# Setup Timezone
if [ -f "/usr/share/zoneinfo/America/New_York" ]; then
	export TZ="/usr/share/zoneinfo/America/New_York"
fi

# Setup Editor (Mate, else Sublime, else Atom)
if [ -e "/usr/local/bin/mate" ]; then
	export EDITOR="/usr/local/bin/mate -w" 	#Set Default Editor to TextMate
elif [ -e "/usr/local/bin/subl" ]; then 
	export EDITOR="/usr/local/bin/subl -n -w" #Set Default Editor to Sublime (New Window)
elif [ -e "/usr/local/bin/atom" ]; then
  export EDITOR="/usr/local/bin/atom -n -w"
fi

#Groovy Setup

if [ -d "/usr/local/opt/groovy/libexec" ]; then
  export GROOVY_HOME="/usr/local/opt/groovy/libexec"
fi


##############################
## OFF - YOU SHALL NOT PASS
##############################


# #########################
# ## Java Options
# ##
#
# export JAVA_OPTS='-Xmx512m'
#
# # Ruby Garbage Collections Performance Setting Suggested by Ledbury
# export RUBY_GC_MALLOC_LIMIT=59000000
# export RUBY_HEAP_MIN_SLOTS=600000
# export RUBY_FREE_MIN=10000
#
# #########################
# ## New Relic Options
# ##
#
# # Turn off New Relic locally.
# export NEWRELIC_ENABLE=false
#
#
