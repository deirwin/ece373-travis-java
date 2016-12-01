#!/bin/bash

# Function that runs our testsuite
function check {
  # The test/ directory stores txt files that
  # have the inputs and outputs for each test
  cd test/
  # We loop through each text file. We name each
  # text file test#., where # is the number of the test
  # Files ending in *.in store the input, and
  # files ending in *.sol store the expected output
  for i in `ls *.sol`
  do
    # We strip the extension off the files
    # to get the name of each test
    NAME=`echo $i | awk -F\. '{print $1}'`
    # Each line of test#.in stores the 
    # command line parameter input for multiple
    # runs of the same test driver with different input.
    # We loop through each line and run a separate
    # test with the different input specified.
    while read -r line
    do
      # We run the test and store the output as test#.out
      java $NAME $line > $NAME.out

      # We check whether the output matches our expected output
      diff $NAME.out $NAME.sol

      # A non-zero return code means that it does not match
      EXIT=`echo $?`
      if [ $EXIT -ne 0 ]
      then
        echo "$NAME failed"
        # We exit immediately if a test fails
        exit 1
      else
        echo "$NAME passed"
      fi
    done <$NAME.in
  done
}

check

# The script will exit with 1 if a test fails
# and will exit with 0 if it is successful
