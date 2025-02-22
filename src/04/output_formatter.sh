#!/bin/bash

colors1=(47 41 42 44 45 40) # Фоны: белый, красный, зеленый, синий, фиолетовый, черный
colors2=(37 31 32 34 35 30) # Шрифт: белый, красный, зеленый, синий, фиолетовый, черный
color_names=("white" "red" "green" "blue" "purple" "black")

func_echo() {
    echo -e "\033[${TITLE_BACKGROUND}m\033[${FONT_COLOR1}mHOSTNAME\033[0m = \033[${VALUE_BACKGROUND}m\033[${FONT_COLOR2}m$HOSTNAME\033[0m"
    echo -e "\033[${TITLE_BACKGROUND}m\033[${FONT_COLOR1}mTIMEZONE\033[0m = \033[${VALUE_BACKGROUND}m\033[${FONT_COLOR2}m$TIMEZONE\033[0m"
    echo -e "\033[${TITLE_BACKGROUND}m\033[${FONT_COLOR1}mUSER\033[0m = \033[${VALUE_BACKGROUND}m\033[${FONT_COLOR2}m$USER\033[0m"
    echo -e "\033[${TITLE_BACKGROUND}m\033[${FONT_COLOR1}mOS\033[0m = \033[${VALUE_BACKGROUND}m\033[${FONT_COLOR2}m$OS\033[0m"
    echo -e "\033[${TITLE_BACKGROUND}m\033[${FONT_COLOR1}mDATE\033[0m = \033[${VALUE_BACKGROUND}m\033[${FONT_COLOR2}m$DATE\033[0m"
    echo -e "\033[${TITLE_BACKGROUND}m\033[${FONT_COLOR1}mUPTIME\033[0m = \033[${VALUE_BACKGROUND}m\033[${FONT_COLOR2}m$UPTIME\033[0m"
    echo -e "\033[${TITLE_BACKGROUND}m\033[${FONT_COLOR1}mUPTIME_SEC\033[0m = \033[${VALUE_BACKGROUND}m\033[${FONT_COLOR2}m$UPTIME_SEC\033[0m"
    echo -e "\033[${TITLE_BACKGROUND}m\033[${FONT_COLOR1}mIP\033[0m = \033[${VALUE_BACKGROUND}m\033[${FONT_COLOR2}m$IP\033[0m"
    echo -e "\033[${TITLE_BACKGROUND}m\033[${FONT_COLOR1}mMASK\033[0m = \033[${VALUE_BACKGROUND}m\033[${FONT_COLOR2}m$MASK\033[0m"
    echo -e "\033[${TITLE_BACKGROUND}m\033[${FONT_COLOR1}mGATEWAY\033[0m = \033[${VALUE_BACKGROUND}m\033[${FONT_COLOR2}m$GATEWAY\033[0m"
    echo -e "\033[${TITLE_BACKGROUND}m\033[${FONT_COLOR1}mRAM_TOTAL\033[0m = \033[${VALUE_BACKGROUND}m\033[${FONT_COLOR2}m$RAM_TOTAL\033[0m"
    echo -e "\033[${TITLE_BACKGROUND}m\033[${FONT_COLOR1}mRAM_USED\033[0m = \033[${VALUE_BACKGROUND}m\033[${FONT_COLOR2}m$RAM_USED\033[0m"
    echo -e "\033[${TITLE_BACKGROUND}m\033[${FONT_COLOR1}mRAM_FREE\033[0m = \033[${VALUE_BACKGROUND}m\033[${FONT_COLOR2}m$RAM_FREE\033[0m"
    echo -e "\033[${TITLE_BACKGROUND}m\033[${FONT_COLOR1}mSPACE_ROOT\033[0m = \033[${VALUE_BACKGROUND}m\033[${FONT_COLOR2}m$SPACE_ROOT\033[0m"
    echo -e "\033[${TITLE_BACKGROUND}m\033[${FONT_COLOR1}mSPACE_ROOT_USED\033[0m = \033[${VALUE_BACKGROUND}m\033[${FONT_COLOR2}m$SPACE_ROOT_USED\033[0m"
    echo -e "\033[${TITLE_BACKGROUND}m\033[${FONT_COLOR1}mSPACE_ROOT_FREE\033[0m = \033[${VALUE_BACKGROUND}m\033[${FONT_COLOR2}m$SPACE_ROOT_FREE\033[0m"
}

output_color() {
    if [[ $1 -eq $2 ]]; then
        echo "default (${color_names[$(($2 - 1))]})"
    else
        echo "$1 (${color_names[$(($1 - 1))]})"
    fi
}

output_colors() {
    echo "Column 1 background = $(output_color $column1_background $DEFAULT_COLUMN1_BACKGROUND)"
    echo "Column 1 font color = $(output_color $column1_font_color $DEFAULT_COLUMN1_FONT_COLOR)"
    echo "Column 2 background = $(output_color $column2_background $DEFAULT_COLUMN2_BACKGROUND)"
    echo "Column 2 font color = $(output_color $column2_font_color $DEFAULT_COLUMN2_FONT_COLOR)"
}
