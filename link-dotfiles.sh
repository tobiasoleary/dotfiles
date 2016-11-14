#! /bin/bash

dir="`pwd`/*"
for filepath in $dir
do
  filename=$(basename "$filepath");
  ext=${filename##*.}
  if [ $filename == $ext ]; then
    curr_dotfile="$HOME/.$filename"
    orig_dotfile="$curr_dotfile.orig"
    if [ -f $curr_dotfile ] && [ -z $orig_dotfile ]
    then
      echo "Moving current dotfile to $orig_dotfile"
      mv $curr_dotfile "$orig_dotfile" && ln -s $filepath $curr_dotfile
      echo "Moved $curr_dotfile to $orig_dotfile."
      echo "Linked $filepath to $curr_dotfile"
    elif [ -z $curr_dotfile ]; then
      ln -s $filepath $curr_dotfile
      echo "Linked $filepath to $curr_dotfile"
    else
      echo "ERROR: NOT LINKING BECAUSE $curr_dotfile and $orig_dotfile exists"
    fi
    
  fi
done