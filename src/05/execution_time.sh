#!/bin/bash

start_timer() {
    date +%s.%N
}

calculate_execution_time() {
    local start_time=$1
    local end_time=$(date +%s.%N)
    echo "$(echo "$end_time - $start_time" | bc)"
}
