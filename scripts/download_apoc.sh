#!/bin/bash
PREF="[NEO4J-YELP] "
APOC_VERSION=4.0.0.7
FILE_NAME=apoc-$APOC_VERSION-all.jar
DEST=./neo4j-community-x.x.x/plugins/

if [ -f "$DEST$FILE_NAME" ]; then
    echo $PREF"APOC present, continuing..."
else 
    echo $PREF"Preparing to download APOC"
    rm -f $FILE_NAME; rm -f $DEST$FILE_NAME;

    echo $PREF"Downloading apoc-"$APOC_VERSION"-all.jar..." \
        && wget https://github.com/neo4j-contrib/neo4j-apoc-procedures/releases/download/$APOC_VERSION/$FILE_NAME \
        && mv $FILE_NAME $DEST

    echo $PREF"Done!"
fi


