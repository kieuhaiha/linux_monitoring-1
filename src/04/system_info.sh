#!/bin/bash

get_system_info() {
    HOSTNAME=$(hostname)
    TIMEZONE=$(timedatectl | grep "Time zone" | awk '{print $3, $4, $5}')
    USER=$(whoami)
    OS=$(cat /etc/issue | cut -d\\ -f1)
    DATE=$(date +"%d %B %Y %H:%M:%S")
    UPTIME=$(uptime -p)
    UPTIME_SEC=$(awk '{print $1}' /proc/uptime)
    IP=$(hostname -I)
    MASK=$(ipcalc "$IP" | grep "Netmask" | awk '{print $2}')
    GATEWAY=$(ip route | grep "default via" | awk '{print $3}')
    RAM_TOTAL=$(free -m | awk '/Mem:/ {printf "%.3f GB", $2/1024}')
    RAM_USED=$(free -m | awk '/Mem:/ {printf "%.3f GB", $3/1024}')
    RAM_FREE=$(free -m | awk '/Mem:/ {printf "%.3f GB", $4/1024}')
    SPACE_ROOT=$(df / | awk 'NR==2 {printf "%.2f MB", $2}')
    SPACE_ROOT_USED=$(df / | awk 'NR==2 {printf "%.2f MB", $3}')
    SPACE_ROOT_FREE=$(df / | awk 'NR==2 {printf "%.2f MB", $4}')

    TITLE_BACKGROUND=${colors1[$((column1_background - 1))]}
    FONT_COLOR1=${colors2[$((column1_font_color - 1))]}
    VALUE_BACKGROUND=${colors1[$((column2_background - 1))]}
    FONT_COLOR2=${colors2[$((column2_font_color - 1))]}
}
