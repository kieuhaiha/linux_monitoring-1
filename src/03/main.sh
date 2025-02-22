#!/bin/bash

source ./validation.sh
source ./output_formatter.sh
source ./system_info.sh

if [[ $# -ne 4 ]]; then
    echo "Укажите 4 параметра в диапазоне от 1 до 6."
    exit 1
fi

TITLE_BACKGROUND=$1  
FONT_COLOR1=$2
VALUE_BACKGROUND=$3
FONT_COLOR2=$4

validate_input "$TITLE_BACKGROUND" "$FONT_COLOR1" "$VALUE_BACKGROUND" "$FONT_COLOR2"

get_system_info

func_echo
