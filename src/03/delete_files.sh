#!/bin/bash

del() {
    # cat ../01/log.txt | awk '{print $1}' | xargs rm
    all_filepath=($(cat ../02/log.txt | awk '{print $1}'))
    
    for file in ${all_filepath[@]}
    do
        path=${file%/*} 
        cd ${file%/*} 
        rm -r ${file##*/}
        echo path
        # echo $(ls)
        echo ${file##*/}
    done



    # # cat ../01/log.txt | awk '{print $1}' | xargs rm
    # all_filepath=($(cat ../02/log.txt | awk '{print $1}'))
    # ahah=($(cat ../02/l.txt | awk '{print $1}'))
    # for p in ${ahah[@]}
    # do
    #     for file in ${all_filepath[@]}
    #     do
    #     cd $p
    #         rm -r ${file%%/*} 
    #         # rm -r ${file##*/}
    #         # echo path
    #         # echo $(ls)
    #         echo ${file##*/}
    #     done
    # done


}