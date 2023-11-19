#!/bin/sh
cur_ver=$(curl https://api.github.com/repos/kidonng/notion-appimage/releases/latest --silent |
	jq ".tarball_url" |
	grep --perl-regexp --only-matching 'tarball.*' |
	cut --fields=2 --delimiter='/' |
	cut --delimiter='-' --fields=1)
# printf "$cur_ver"

new_ver=$(curl --silent https://desktop-release.notion-static.com/latest.yml |
	head --lines=1 |
	cut --delimiter=' ' --fields=2)
# printf "$new_ver"

if [ $cur_ver = $new_ver ]; then
	printf "eq\n"
else
	printf "ne\n"
fi
