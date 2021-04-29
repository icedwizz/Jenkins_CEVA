#!/bin/bash

# Setup all the input variables

for i in "$@"
do
case $i in
    -apiKey=*|--apiKey=*)
    APIKEY="${i#*=}"
    shift 
    ;;
    -serverBase=*|--serverBase=*)
    SERVERBASE="${i#*=}"
    shift 
    ;;
    -modelName=*|--modelName=*)
    MODELNAME="${i#*=}"
    shift 
    ;;
    -inputFolder=*|--inputfolder=*)
    INPUTFOLDER="${i#*=}"
    shift 
    ;;
    -dataLocation=*|--datalocation=*)
    DATALOCATION="${i#*=}"
    shift 
    ;;   
  
esac
done

header="Api-Key: $APIKEY" 

#########################################################################################
#
#                            CHECK SEMARCHY VERSION
#
#########################################################################################

# Update the API endpoint
versionAPI="/api/rest/admin/version"
versionURL="$SERVERBASE$versionAPI"

# Get the version
echo "Version API endpoint"
echo $versionURL
echo ""
echo "Version response:" 
curl -i -X GET "$VERSIONURL" -H "$Header"
echo ""
echo ""

#########################################################################################
#
#                            FIND THE MODEL TO IMPORT
#
#########################################################################################

# Get the file to load in 
#https://stackoverflow.com/questions/32817654/finding-a-file-that-has-highest-number-in-the-filename-using-powershell
#$inputFile = Get-ChildItem -Path $INPUTFOLDER | Sort-Object { [regex]::Replace($_.Name, '\d+', { $args[0].Value.PadLeft(20) }) } | select -Last 1

# Save that model edition
#$modelEdition = [regex]::match($inputFile, "\[(.*)\]").Groups[1].Value
#echo "modelEdition= $modelEdition"

# Produce the actual filename to load
#$inputFile="$INPUTFOLDER\$inputFile"
#$inputFile = $inputFile.replace("[", "``[")
#$inputFile = $inputFile.replace("]", "``]")
#echo "inputFile= $inputFile"

#########################################################################################
#
#                            IMPORT THE MODEL
#
#########################################################################################

# Update the API endpoint
importAPI="/api/rest/app-builder/model-imports"
importURL="$SERVERBASE$importAPI"

# Import the exported model to Semarchy
echo "Importing open model to Semarchy"
echo $importURL

echo ""
echo "Import of model response:"
curl -i -X POST -H "Content-Type: application/octet-stream"   -H "$Header"   -d "$inputFile" "$modelURL"

#########################################################################################
#
#                            DEPLOY THE MODEL
#
#########################################################################################

# Update the API endpoint
deployAPI="/api/rest/app-builder/data-locations/$DATALOCATION/deploy"
deployURL="$SERVERBASE$deployAPI"

# Set the body of the message
deployBody='{"'modelName'": "'$MODELNAME'", "modelEditionKey": "'$MODELEDITION'"}'
echo "Deploybody: $deployBody"

# Deploy the newly imported model to the data location
echo "Deploying model URL"
echo $deployURL

echo ""
echo ""

echo "Deployment response:"
curl -i -X POST -H "$Header" -H "Content-Type: application/json" -d "$deployBody" "$deployURL"


#./testRelease.sh -apiKey=LSAqh3V.9AttjtiGQAWCsX97S0WEyjgtibTrSamArce -inputFolder='Models' -serverBase=http://localhost:8088/semarchy -dataLocation=DemoTest -modelName=DemoTest




























