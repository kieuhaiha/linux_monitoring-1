#!/bin/bash

DEFAULT_COLUMN1_BACKGROUND=1   # белый
DEFAULT_COLUMN1_FONT_COLOR=2   # красный
DEFAULT_COLUMN2_BACKGROUND=1   # белый
DEFAULT_COLUMN2_FONT_COLOR=4   # синий

read_config() {
    if [[ -f "./config" ]]; then
        source ./config
    fi
}
