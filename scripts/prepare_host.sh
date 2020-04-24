#!/bin/bash
PREF="[NEO4J-YELP]"

hash docker 2>/dev/null || { 
    echo "$PREF Docker is not installed!"
    read -r -p "$PREF I can install this for Ubuntu, may I proceed? [y/N] " response
    if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
    then
        sudo apt install -y docker.io \
            && sudo groupadd docker \
            && sudo usermod -aG docker $USER \
            && sudo docker-compose --version \
            && echo "$PREF It may be necessary to restart your machine for permission related for changes to take effect."
    else
        echo "$PREF Exiting..."; exit 0;
    fi
}
hash docker-compose 2>/dev/null || { 
    echo "$PREF Docker Compose is not installed!"
    read -r -p "$PREF I can install this for Ubuntu, may I proceed? [y/N] " response
    if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
    then
        sudo curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose \
            && sudo chmod +x /usr/local/bin/docker-compose \
            && sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose \
            && sudo docker-compose --version
    else
        echo "$PREF Exiting..."; exit 0;
    fi
}

echo "$PREF The host machine is ready to launch Neo4j container!"
