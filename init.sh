#!/bin/bash
PREF="[NEO4J-YELP]"

echo "$PREF Checking host machine readiness..."
bash ./scripts/prepare_host.sh

echo "$PREF Checking necessary packages..."
bash ./scripts/download_apoc.sh

read -r -p "$PREF Would you like to start the container? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    docker-compose up
else
    echo "$PREF Exiting..."; exit 0;
fi
