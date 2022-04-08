#!/bin/sh
#sh bin/gitpushall.sh 
########## Set Vars
datetime=`date +"%Y-%m-%d %H:%M:%S(%Z)"`
	echo "************ datetime : $datetime"
gitHubCurrentBranch=`git branch --show-current`
	echo "************ gitHubCurrentBranch : $gitHubCurrentBranch"
githubCurrentUser=`git config user.name`
	echo "************ githubCurrentUser : $githubCurrentUser"
commitComment="-| "$githubCurrentUser" "$datetime" |-"
	echo "************ commitComment : $commitComment"
########## Stage All, Commit, and push branch to github
git add .
git commit -m "$commitComment"
git push -u origin $gitHubCurrentBranch
########## Close Terminal
#exit
