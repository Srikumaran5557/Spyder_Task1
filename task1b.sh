#! /usr/bin/bash


log_file="comp_log.txt"

fileline(){
	echo "--------------------------------------------------------------------------------" >> "$log_file"
}
write_to_log_file() {
    fileline
    echo "                                  COMPUTER LOG" >>"$log_file"
    fileline
    echo "Date: $(date)" >> "$log_file"
    echo "">> "$log_file"
    echo "Uptime:" >> "$log_file"
    uptime >> "$log_file"
    fileline
    echo "Disk Usage:" >> "$log_file"
    df -h >> "$log_file"
    fileline
    echo "Memory Usage:" >> "$log_file"
    free -h >> "$log_file"
    fileline
    echo "Most Expensive Process:" >> "$log_file"
    ps -eo pid,%cpu,%mem,cmd --sort=-%cpu | head -n 2 | tail -n 1 >> "$log_file"
    fileline
    echo "Open TCP Ports:" >> "$log_file"
    netstat -tuln | awk '$6 == "LISTEN" {print $4}' >> "$log_file"
    fileline
    echo "Current Connections:" >> "$log_file"
    netstat -an | grep ESTABLISHED  >> "$log_file"
    fileline
    echo "Running Processes:" >> "$log_file"
    ps aux >> "$log_file"
    fileline
}
write_to_log_file


