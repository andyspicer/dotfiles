#!/bin/bash

#finds all dotfiles in the home directory and archives them into my dotfiles repo folder.

find ~/ -maxdepth 1 ! \( -type d \)  -name ".*" -print0 | xargs -0 tar cvf ~/Dropbox/Development/dev-repos/aws-dev/aws-dotfiles/awsdotfiles_bak.tar.gz
