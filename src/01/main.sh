#!/bin/bash

if [ -z "$1" ]; then
    echo "Введите текстовый параметр."
    exit 1
fi

STRING="$1"
if [[ "$STRING" =~ ^[a-zA-Z]+$ ]]; then
    echo "$STRING"
else
    echo "Необходимо передать только текстовый параметр."
fi