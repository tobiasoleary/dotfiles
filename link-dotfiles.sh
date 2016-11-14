#! /bin/bash

dir="`pwd`/*"
for filepath in $dir
do
  filename=$(basename "$filepath");  #Get basename (w/o dir)
  ext=${filename##*.} #Get everything after the first . in filename, will be $filename is no extension.
  if [ $filename == $ext ]; then #For files with no extension 
    curr_dotfile="$HOME/.$filename"
    orig_dotfile="$curr_dotfile.orig"
    if [ -L $curr_dotfile ]; then #Already linked ignored
      echo "Ignoring $curr_dotfile is already linked."
    elif [ -e $curr_dotfile ] && [ ! -e $orig_dotfile ]; then #backup current and link
      echo "Moving current dotfile to $orig_dotfile"
      mv $curr_dotfile "$orig_dotfile" && ln -s $filepath $curr_dotfile
      echo "Moved $curr_dotfile to $orig_dotfile."
      echo "Linked $filepath to $curr_dotfile"
    elif [ ! -e $curr_dotfile ]; then #go ahead and link
      ln -s $filepath $curr_dotfile
      echo "Linked $filepath to $curr_dotfile"
    else
      echo "ERROR: NOT LINKING BECAUSE $curr_dotfile and $orig_dotfile exists"
    fi
  fi
done