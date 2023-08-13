#!/bin/bash
. ./validator.sh
. ./parser.sh


main() {
    path_to_logs="../04/*.log"
    for file in $path_to_logs
    do
        cat $file >> output.log
    done
    parse_$1 "output.log"
}

valid $1 $2
if [ $? -eq 0 ]; then
    echo -n "" > output.log
    main $1 > output_$1.log
    rm output.log
fi














