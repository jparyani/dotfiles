#!/bin/sh

cutstring="DO NOT EDIT BELOW THIS LINE"

install_file() {
  name=$1
  target="$HOME/.$name"
  if [ -e "$target" ]; then
    if [ -d "$target" ]; then
      if ! [ -L $target ]; then 
        for name in $name/*; do
          install_file $name
        done
      fi
    else
	    if [ ! -L "$target" ]; then
	      cutline=`grep -n -m1 "$cutstring" "$target" | sed "s/:.*//"`
	      if [ -n "$cutline" ]; then
	  cutline=$((cutline-1))
	        echo "Updating $target"
	        head -n $cutline "$target" > update_tmp
	        startline=`sed '1!G;h;$!d' "$name" | grep -n -m1 "$cutstring" | sed "s/:.*//"`
	        if [ -n "$startline" ]; then
	          tail -n $startline "$name" >> update_tmp
	        else
	          cat "$name" >> update_tmp
	        fi
	        mv update_tmp "$target"
	      else
	        echo "WARNING: $target exists but is not a symlink."
	      fi
	    fi
	  fi
  else
    if [ "$name" != 'install.sh' ]; then
      echo "Creating $target"
      if [ -n "$(grep "$cutstring" "$name")" ]; then
        cp "$PWD/$name" "$target"
      else
        ln -s "$PWD/$name" "$target"
      fi
    fi
  fi
}
for name in *; do
  install_file $name
done
