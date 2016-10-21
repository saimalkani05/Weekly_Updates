echo -e "OS: `cat /etc/redhat-release`\nKernel_Ver: `uname -r`\nLib_Ver: `rpm -qi glibc|grep ^Version|head -1|awk '{print $3}'`\nArch: `arch`\nCPUs: `cat /proc/cpuinfo|grep -c ^processor`\n`free | grep Mem | awk '{printf("Memory(GB): %.1f ",$2/1048576)}'`\n`free | grep Swap | awk '{printf("Swap(GB): %.1f ",$2/1048576)}'`\n` df -Pk 2>/dev/null|egrep ^/dev\|:|grep -v /home/|awk '{if($1~/:/) n+=$2; else if($6~/^\/(|boot|opt|tmp|var|usr)$/) l+=$2; else s+=$2; } END {printf("Local Disk(GB): %d\nStorage(GB): %d\n", l/1048576 + 0.5, s/1048576 + 0.5)}'`\n\nDISKINFO:\n*********\n\n`df -h`\n"
