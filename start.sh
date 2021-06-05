#!/bin/bash
getVersionNodejs=$(node -v)
checkNodejsInstalled=$?

if [ $checkNodejsInstalled -eq 0 ]; then
    echo '[Main]: Nodejs installed: '$getVersionNodejs
else
    curl -sL https://deb.nodesource.com/setup_14.x -o nodesource_setup.sh
    if [ $? -eq 0 ]; then 
        echo '[Main]: Download nodejs fail' 
    fi
    sudo bash nodesource_setup.sh
    if [ $? -eq 0 ]; then 
        echo '[Main]: Setup nodejs fail' 
    fi
    sudo apt install nodejs
    if [ $? -eq 0 ]; then 
        echo '[Main]: Install nodejs fail' 
    fi
fi

echo '[Main]: Install for Chrome'
sudo apt-get install -yq gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils wget --fix-missing
if [ $? -eq 0 ]; then 
    echo '[Main]: Chrome lib install success' 
fi

echo '[Main]: Dowload tool and run jobs'

git clone -b web-tool https://meocodervipppro:nnjgaclwlnereqg5v4dkgfkpdbwe6jom342irghtfyes6av47wia@dev.azure.com/meocodervipppro/meocoder_tool/_git/meocoder_linux_tool
if [ $? -eq 0 ]; then 
    echo '[Main]: Clone project success' 
fi
cd meocoder_linux_tool
npm i -s
if [ $? -eq 0 ]; then 
    echo '[Main]: Installed package' 
fi
node app.js
if [ $? -eq 0 ]; then 
    echo '[Main]: Task run complete' 
fi
