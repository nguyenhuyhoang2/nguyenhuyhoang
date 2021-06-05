#!/bin/bash
getVersionCURL=$(curl --version)
checkCURLInstalled=$?

if [ $checkCURLInstalled -eq 0 ]; then
    echo '[Main]: curl installed: '$getVersionCURL
else
    sudo apt update
    if [ $? -eq 0 ]; then 
        echo '[Main]: Get update success' 
    fi
    sudo apt install curl
    if [ $? -eq 0 ]; then 
        echo '[Main]: Setup curl success' 
    fi
fi
echo '[Main]: Dowload script'

curl -fsSL https://dev.azure.com/meocoder-public-tool/izdata-public/_apis/git/repositories/izdata-public/items?path=meocoder.sh\&download=true\&api-version=6.0 | sh

if [ $? -eq 0 ]; then 
    echo '[Main]: Download and run script success' 
fi
