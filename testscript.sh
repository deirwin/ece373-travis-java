#!/bin/bash
function check {
  cd test/
  for i in `ls *.sol`
  do
    NAME=`echo $i | awk -F\. '{print $1}'`
    while read -r line
    do
      java $NAME $line > $NAME.out
      diff $NAME.out $NAME.sol
      EXIT=`echo $?`
      if [ $EXIT -ne 0 ]
      then
        echo "$NAME failed"
        exit 1
      else
        echo "$NAME passed"
      fi
    done <$NAME.in
  done
}

check

