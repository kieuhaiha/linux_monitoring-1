#!/bin/bash

validate_arguments() {
    if [[ $# -ne 1 ]]; then
        echo "Укажите путь до директории"
        exit 1
    fi
}

validate_directory() {
    local dir=$1
    if [[ ! -d $dir ]]; then
        echo "Указанная директория не существует: $dir"
        exit 1
    fi
}
