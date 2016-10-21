#!/bin/bash

#****SAI****

SERVERS="bolfootbook01 bolfwportal01 bolfwboreas01 bolfwboreas02 bolfwboreas03 bolfwboreas04 bolfwboreas05 bolfwboreas06 bolfwboreas07 bolfwboreas08 bolfwboreas09 bolfwboreas10 bolfwcovbuild01 bolfwcovbuild02 bolfwcovbuild03 bolfwcovbuild04 bolvcov01 bolvcov02 bolvcov03 bolvcov04 bolvcov05 bolvcov06 bolvcov07 bolvcov08 bolvcov09 bolvcov10 bolvcov11 bolvcov12 bolvsierra01 bolvfwdev01 bolvprotex01 bolfwautomation01 bolfwautomation02 bolfwautomation03 bolfwautomation04 bolfwautomation05 bolfwautomation06 bolfwautomation07 bolfwautomation08 bolfwautomation09 bolfwautomation10 bolfwautomation11 bolfwautomation12 bolfwautomation13 bolfwautomation14 bolfwautomation15 bolfwautomation16 bolfwautomerge16 bolfwautomerge17 bolfwrelsvr01 bolfwamdev01 bolfwamprod01 bolacgatlassiandev01"
 
# Email 
SUBJECT="FW DEV SERVERS MONTHLY REPORT"
EMAIL="mstertz@micron.com smalkani@micron.com"
FWDEV_SERVERS_REPORT="/fwdev_servers_monthly_report.txt"
VAR=$(</Script_Monthly/sysinfo_dependent.sh)
# create new file
>$FWDEV_SERVERS_REPORT
# connect each host and pull up user listing
echo "                                                                            *****FW DEVELOPMENT SERVERS INFORMATION*****                                              " >>$FWDEV_SERVERS_REPORT            
echo -e "                                                                                 **********************************                                                   \n" >>$FWDEV_SERVERS_REPORT 
for host in $SERVERS
do
echo "=================================" >>$FWDEV_SERVERS_REPORT
echo " -> HOST: $host " >>$FWDEV_SERVERS_REPORT
echo -e "=================================\n" >>$FWDEV_SERVERS_REPORT
ssh $host $VAR >> $FWDEV_SERVERS_REPORT
done
# send an email using /bin/mail
/bin/mail -a "/fwdev_servers_monthly_report.txt" -s "$SUBJECT" "$EMAIL" < /Script_Monthly/Mess_body.sh
