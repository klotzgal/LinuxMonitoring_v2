#!/bin/bash

parse_1() {
    cat $1 | sort -k8
}

parse_2() {
    cat $1 | awk '{print $1}' | uniq
}

parse_3() {
    grep -e " [4-5]0[0-9] [0-9]" $1
}

parse_4() {
    parse_3 $1 | awk '{print $1}' | uniq
}