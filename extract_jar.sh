#!/bin/bash

merge_dirs=$(find . -type d -path "*/original-without-dependencies/merge")

for dir in $merge_dirs; do
  cd "$dir"

  for jar_file in *.jar; do
    [ -f "$jar_file" ] && jar xvf "$jar_file"
  done

  cd -
done
