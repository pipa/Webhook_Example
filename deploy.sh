#!/bin/sh
#
# Description:
#	Script will receive 3 Arguments (Project Name, Environment, Branch)
#	Various things happening here: 
#	1.) Changing to the repo directory
#	2.) Resetting the local master branch to look exactly like remote origin master branch
# 	3.) Clean off any files that don't need to be there
#	4.) Pull just to be doubly sure we have all the latest changes
#	5.) Switches branch to master just to be extra sure that we are on the right 
#		branch and our working tree has the right files.
#	
# Written by: LM
#

if [[ -n "$1" ]] ; then
	PROJECT_NAME=$1
else
	PROJECT_NAME="lm-blog"
fi

if [[ -n "$2" ]] ; then
	BRANCH=$2
else
	BRANCH="master"
fi

cd /webroot/$PROJECT_NAME
git reset --hard origin/$BRANCH
git clean -f
git pull
git checkout $BRANCH

# forever stop index.js
# NODE_ENV=production forever start index.js
echo "#-----------------------------------------------#"
echo "#              Execution Completed              #"
echo "#-----------------------------------------------#"