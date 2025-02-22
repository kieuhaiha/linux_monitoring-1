#!/bin/bash

source ./validation.sh
source ./analyze_directory.sh
source ./output.sh
source ./execution_time.sh

# Проверка наличия аргумента
validate_arguments "$@"

# Начало отсчета времени
START_TIME=$(start_timer)

DIR=$1

# Проверка существования каталога
validate_directory "$DIR"

# Выполнение анализа директории
analyze_directory "$DIR"

# Подсчет времени выполнения
EXECUTION_TIME=$(calculate_execution_time "$START_TIME")

# Вывод результатов
output_results
