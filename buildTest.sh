#!/bin/bash
scalac *.scala;
for file in ./tests/in/*; do
    echo "Testing: $file"
    cat $file | scala $1 | xxd > testingxxd.temp
    file=${file/.in}
    xxd ${file/in/expected}.out > expectedxxd.temp
    echo 'Discrepancies between in and expected:'
    diff testingxxd.temp expectedxxd.temp
    rm *.temp
done
rm *.class
