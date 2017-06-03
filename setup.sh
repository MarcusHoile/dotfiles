#!/bin/bash

###
#
# setup.sh
#
# Symlink dotfiles to home directory.
#
###

# Install vundle if it doesnt exist
if ! [ -d ~/.vim/bundle/Vundle.vim ]
then
  git clone git@github.com:VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

# Change into the directory we're executing from.
cd `dirname $0`

# Loop through each file
for file in `ls .`; do

  # Skip files that begin with an underscore, readme, and the setup file
  if [[ $file =~ ^_.* ]] || [[ $file =~ ^README ]] || [[ $file =~ ^setup ]]; then
    continue
  fi

  # Symlink file to the home directory
  ln -snf "$PWD/$file" "$HOME/.$file"
done

ln -snf "$PWD/_iterm/com.googlecode.iterm2.plist" "$HOME/com.googlecode.iterm2.plist"
