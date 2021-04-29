#!/bin/bash

# Setup all the input variables

for i in "$@"
do
case $i in
    -p=*|--project=*)
    PROJECT="${i#*=}"
    shift 
    ;;
    -r=*|--repo=*)
    REPO="${i#*=}"
    shift 
    ;;
    -s=*|--sourceBranch=*)
    SOURCEBRANCH="${i#*=}"
    shift 
    ;;
    -b=*|--targetBranch=*)
    TARGETBRANCH="${i#*=}"
    shift 
    ;;
    -t=*|--title=*)
    TITLE="${i#*=}"
    shift 
    ;;   
    -d=*|--des=*)
    DES="${i#*=}"
    shift 
    ;;
	-e=*|--token=*)
    TOKEN="${i#*=}"
    shift 
    ;; 

esac
done

bodyObj='{
"'sourceRefName'"="'refs/heads/$SOURCEBRANCH'",
  "'targetRefName'"= "'refs/heads/$TARGETBRANCH'",
  "'title'"= "'$TITLE'",
  "'description'"="'$DES'",
  }'

#URL ="https://dev.azure.com/NationalTrust-Hosting/$project/_apis/git/repositories/$repo/pullRequests?api-version=5.0

curl -X POST -H "Content-Type: application/json" -H @"Authorization: Basic" -d "$bodyObj" "$URL"