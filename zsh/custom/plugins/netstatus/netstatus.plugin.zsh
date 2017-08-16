#  netstatus.plugin.zsh
#  Damian Rogers (damian at sudden-desu.net)

function netstatus() {
	for iface in $(ls /sys/class/net)
	do
		# skip over the loopback interface
		if [ "$iface" = "lo" ]; then
			continue
		fi
		ifpath=/sys/class/net/$iface
		OPERSTATE=$(cat $ifpath/operstate | tr \[a-z\] \[A-Z\])
		ADDRESS=$(cat $ifpath/address)
		TX_BYTES=$(cat $ifpath/statistics/tx_bytes | numfmt --to=iec --suffix=B)
		RX_BYTES=$(cat $ifpath/statistics/rx_bytes | numfmt --to=iec --suffix=B)

		echo $iface $OPERSTATE $ADDRESS Tx:$TX_BYTES Rx:$RX_BYTES
	done
}
