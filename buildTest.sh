#!/bin/bash
scalac *.scala;
if [ $? -eq 0 ]; then
    if [ $# -eq 1 ]; then
        tests=*
    else
        tests=${@:2}
    fi
    for file in ./tests/in/$tests; do
        echo "Testing: $file"
        cat $file | scala $1 | xxd > testingxxd.temp
        file=${file/.in}
        xxd ${file/in/expected}.out > expectedxxd.temp
        echo 'Discrepancies between in and expected:'
        diff testingxxd.temp expectedxxd.temp
    done
    rm testingxxd.temp expectedxxd.temp
    rm *.class
else
    echo Compilation Failed!
fi
