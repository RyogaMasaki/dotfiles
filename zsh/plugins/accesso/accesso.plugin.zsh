# accesso tools
# Damian Rogers (damian at sudden-desu.net)

# Automatically open .log files with less
alias -s log="less -M"

# ago - ssh to host using Accesso creds
ago() {
	ssh $ACCESSO_USER@$1
}

# aput - scp file(s) to a given host using Accesso creds
aput() {
	if [ -z "$1" ]; then
		echo "Must specify a hostname"; return -1
	fi
	if [ -z "$2" ]; then
		echo "Must specify at least one local file"; return -1
	fi
	HOST=$1; shift
	scp $@ $ACCESSO_USER@$HOST:~
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
	grep "Session\[$1" *.log | grep SERVICE
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

