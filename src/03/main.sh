#!/bin/bash
# . ./validator.sh
. ./delete_files.sh

cur_path=$(pwd)
del $1
cd $cur_path
echo  "" > ../02/log.txt

# # valid $1 $2 $3
# if [ $? -eq 0 ]; then
#     folders_and_files $1 $2 $3
# fi




