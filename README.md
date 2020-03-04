# Neo4j Yelp Dataset Solution

Contains Python scripts to import and model the Yelp challenge dataset into Neo4j respectively.

## Getting Started

### Step 1:

Download the [Neo4j Community Edition](https://neo4j.com/download-thanks/?edition=community&release=4.0.1&flavour=unix) ZIP or tarball or start the Neo4j Docker container with the `docker-compose.yml` file.

If using the ZIP or tarball, extract the archive to a directory e.g. `$HOME`:
```
tar -xvzf neo4j-community-4.0.1-unix.tar.gz -C ~/.
```

### Step 2:

If not using the Docker image, start Neo4j using the `neo4j` binary in the `neo4j-community-4.0.1/bin` file. Example:
```
~/neo4j-community-4.0.1/bin/neo4j start
```
Note this needs to run with Oracle Java 11 or OpenJDK 11. I recommend using [AdoptOpenJDK 11](https://adoptopenjdk.net/installation.html?variant=openjdk11&jvmVariant=hotspot) and setting $JAVA_HOME to the location of the directory e.g. `export JAVA_HOME=/home/david/Downloads/jdk-11.0.5+10`.

Neo4j browser should now be running on `http://localhost:7474`. Default username and password is `neo4j` and `neo4j` respectively.

### Step 3:

Before running the `neo4j_yelp.py` script, make sure that you have installed all of the dependencies and edited `config.py` to contain your credentials. To download all the dependencies you can simply type:
```
pip3 install -r requirements.txt --user
```

