#!/bin/bash

save_to_file() { 
FILE_NAME=$(date +"%d_%m_%y_%H_%M_%S").status

echo "Хотите записать данные в файл? (y/n)"
read answer
if [ "$answer" = "y" ] || [ "$answer" = "Y" ];then
    func_echo > $FILE_NAME
fi
}