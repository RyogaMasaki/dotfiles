# accesso tools
# Damian Rogers (damian at sudden-desu.net)

if [[ -z $ACCESSO_USER ]]; then
	echo "\033[31;1mPlease set ACCESSO_USER variable!\033[0m"
fi

# Automatically open .log files with less
alias -s log="less -M"

axo_url="https://accesso.axosoft.com/viewitem"
# axd - Opens a browser to an Axosoft defect
axd() {
	xdg-open "${axo_url}?id=${1}&type=defects" &> /dev/null
}

# axf - Opens a browser to an Axosoft feature
axf() {
	xdg-open "${axo_url}?id=${1}&type=features" &> /dev/null
}

# axt - Opens a browser to an Axosoft task
axt() {
	xdg-open "${axo_url}?id=${1}&type=tasks" &> /dev/null
}

# nphd - Opens a browser to a Prod Help Desk ticket
# Usage: nphd 1234
nphd() {
	# todo: input checks
	local jira_url="https://accessoclientservices.atlassian.net/projects/NPHD/queues/custom/120"
	xdg-open "${jira_url}/NPHD-${1}" &> /dev/null
}

# ago - ssh to host using Accesso creds
ago() {
	if [ -z "$1" ]; then
		echo "Must specify a hostname"; return -1
	fi
	ssh $ACCESSO_USER@$1
}
compdef '_hosts' ago

# aput - scp file(s) to a given host using Accesso creds
aput() {
	if [ -z "$1" ]; then
		echo "Must specify a hostname"; return -1
	fi
	if [ -z "$2" ]; then
		echo "Must specify at least one local file"; return -1
	fi
	local host=$1; shift
	scp $@ $ACCESSO_USER@$host:~
}

# aget - scp file(s) from a given host to the current dir using Accesso creds
aget() {
	if [ -z "$1" ]; then
		echo "Must specify a hostname"; return -1
	fi
	if [ -z "$2" ]; then
		echo "Must specify at least one remote file"; return -1
	fi
	HOST=$1; shift
	scp $ACCESSO_USER@$HOST:"$@" .
}

# sess - Session search
# Searches for all service call reqs/resps with a given session ID
sess() {
	if [ -z "$1" ]; then
		echo "Must specify a session ID"; return -1
	fi
	grep "Session\[$1" *.log | grep SERVICE |  xmllint --format - | pygmentize -l xml

}

# aland - Land a jar on a server
# aland service.jar accesso00 user@host
aland() {
	# todo - add input checks
	basename=${1%%.*}
	jarname=${basename}_${ACCESSO_USER}.jar
	lnname=${basename}_${2}.jar
	scp ${1} ${3}:/usr/local/accesso/lib/${jarname} && ssh ${3} "cd /usr/local/accesso/lib && ln -sf ${jarname} ${lnname}"
}

# al - Accesso logs
# Switches to today's log directory for a given island
al() {
	if [ -z "$1" ]; then
		echo "Must specify an island"; return -1
	fi
	cd /var/log/accesso/$1/$(date +%Y%m%d)
	ll
}
compdef '_files -W /var/log/accesso' al

# req - Sends a request to a service
req() {
  #todo: input validation
  curl -s --data "${2}" -X POST "http://${1}" | xmllint --format - | pygmentize -l xml
}

