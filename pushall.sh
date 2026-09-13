#!/bin/bash

# dir sweep git push
# for each directory in current directory:
#   cd in
#   git push
#   send error or ok message

dirs=$(ls -d */)

for dir in $(ls -d */); do
  echo "-- cd $dir"
  cd $dir

  echo "-- git push"
  git push

  if [ $? != 0 ]; then
    echo "-- Error code $? found, no push"
  else
    echo "success"
  fi

  echo "-- cd .."
  cd ..
  echo "$dir done\n"
  echo
done
