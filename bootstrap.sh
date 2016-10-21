#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function doIt() {
	find ~/ -maxdepth 1 ! \( -type d \)  -name ".*" -print0 | xargs -0 tar cvf ~/Dropbox/Development/dev-repos/aws-dev/aws-dotfiles/awsdotfiles_bak.tar.gz
if [ $? -eq 0 ]; then
	echo "Created archive of dotfiles."
else
	echo "Failed to create dotfiles backup archive."
fi
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude ".osx" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		--exclude "LICENSE-MIT.txt" \
		-avh --no-perms . ~;
	source ~/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
