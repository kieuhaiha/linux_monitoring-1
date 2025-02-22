#!/bin/bash

analyze_directory() {
    local dir=$1

    # Общее число папок, включая вложенные
    total_folders=$(find "$dir" -type d | wc -l)

    # Топ-5 папок с самым большим весом в порядке убывания
    top_5_folders=$(du -h "$dir" --max-depth=5 2>/dev/null | sort -hr | head -n 5 | awk '{print NR " - " $2 ", " $1}')

    # Общее число файлов
    total_files=$(find "$dir" -type f | wc -l)

    # Подсчет числа конфигурационных файлов, текстовых файлов, исполняемых файлов, логов, архивов и символических ссылок
    conf_files=$(find "$dir" -type f -name "*.conf" | wc -l)
    text_files=$(find "$dir" -type f -exec file --mime-type {} + | grep "text/plain" | wc -l)
    exec_files=$(find "$dir" -type f -executable | wc -l)
    log_files=$(find "$dir" -type f -name "*.log" | wc -l)
    archive_files=$(find "$dir" -type f \( -name "*.tar" -o -name "*.gz" -o -name "*.zip" -o -name "*.7z" -o -name "*.bz2" \) | wc -l)
    symlink_files=$(find "$dir" -type l | wc -l)

    # Топ-10 файлов с самым большим весом в порядке убывания
    top_10_files=$(find "$dir" -type f -exec du -h {} + 2>/dev/null | sort -hr | head -n 10 | while read -r size path; do
        filename=$(basename "$path")
        extension="${filename##*.}"

        # Определение расширения
        case "$extension" in
            "conf") extension="conf" ;;
            "log") extension="log" ;;
            "js") extension="js" ;;
            "ts") extension="ts" ;;
            "tar"|"gz"|"zip"|"7z"|"bz2") extension="archive" ;;
            *) if [[ -x "$path" ]]; then
                extension="exe"
               else
                extension="unknown"
               fi ;;
        esac

        echo "$path, $size, $extension"
    done | awk '{print NR " - " $0}')

    # Топ-10 исполняемых файлов с самым большим весом в порядке убывания (и их хеши)
    top_10_exec_files=$(find "$dir" -type f -executable -exec du -h {} + 2>/dev/null | sort -hr | head -n 10 | while read -r size path; do
        if [[ -f "$path" ]]; then
            hash=$(md5sum "$path" | awk '{print $1}')
            echo "$path, $size, $hash"
        fi
    done | awk '{print NR " - " $0}')

}
