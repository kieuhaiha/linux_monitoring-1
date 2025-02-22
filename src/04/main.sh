#!/bin/bash

source ./config_reader.sh
source ./validation.sh
source ./output_formatter.sh
source ./system_info.sh

read_config

column1_background=${column1_background:-$DEFAULT_COLUMN1_BACKGROUND}
column1_font_color=${column1_font_color:-$DEFAULT_COLUMN1_FONT_COLOR}
column2_background=${column2_background:-$DEFAULT_COLUMN2_BACKGROUND}
column2_font_color=${column2_font_color:-$DEFAULT_COLUMN2_FONT_COLOR}

validate_input "$column1_background" "$column1_font_color" "$column2_background" "$column2_font_color"

get_system_info

func_echo

echo
output_colors