#!/bin/bash

while true
do
	 /usr/lib/x86_64-linux-gnu/nextcloudcmd $( [ $NC_SILENT == true ] && echo "--silent" ) $( [ $NC_TRUST_CERT == true ] && echo "--trust" ) --non-interactive --exclude /usr/lib/x86_64-linux-gnu/sync-exclude.lst --davpath "$NC_DAV_PATH" -u "$NC_USER" -p "$NC_PASS" "$NC_SOURCE_DIR" "$NC_URL" && echo "synced 1" | curl --data-binary @-  http://pushgateway.infra:9091/metrics/job/swisscomply-nextcloud
	sleep 60
done
