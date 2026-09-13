#!/bin/bash

# dir sweep git push
# for each directory in current directory:
#   cd in
#   git pull --rebase
#     if something happened git rebase --abort and send message
#   if ok send message

dirs=$(ls -d */)

for dir in $(ls -d */); do
  echo "-- cd $dir"
  cd $dir

  echo "-- git pull --rebase"
  git pull --rebase

  if [ $? != 0 ]; then
    echo "-- Error code $? found, aborting."
    echo "-- git rebase --abort"
    git rebase --abort
  fi

  echo "-- cd .."
  cd ..
  echo "$dir done\n"
  echo
done
