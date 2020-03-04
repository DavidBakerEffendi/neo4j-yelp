# Neo4j Yelp Dataset Solution

Contains Python scripts to import and model the Yelp challenge dataset into Neo4j respectively.

## Getting Started

### Step 1: Getting Neo4j Community Edition

Download the [Neo4j Community Edition](https://neo4j.com/download-thanks/?edition=community&release=4.0.1&flavour=unix) 
ZIP or tarball or start the Neo4j Docker container with the `docker-compose.yml` file.

If using the ZIP or tarball, extract the archive to a directory e.g. `$HOME`:
```bash
$ tar -xvzf neo4j-community-4.0.1-unix.tar.gz -C ~/.
```

### Step 2: Server Plugins and Configuration
The `neo4j-community.x.x.x` directory (where `x.x.x` would be the version you are using) in this project contains details
on the files that need to be changed on the server. Note, the changes must be made on your server files and not on this 
project! This project's directory is simply a demonstration. 

The following files must be changed on the server:

* `plugins/apoc-x.x.x.x-all.jar`: Download the latest [APOC plugin](https://github.com/neo4j-contrib/neo4j-apoc-procedures/releases) and place it under the plugins directory on your server.
* `conf/neo4j.conf`: This has been configured to whitelist the APOC functions we use in the import process.
* `import/{business, review, user}.json`: All Yelp files one wishes to import must be placed here. This script only 
considers the three JSON files listed here.

### Step 3: Starting Neo4j

If not using the Docker image, start Neo4j using the `neo4j` binary in the `neo4j-community-4.0.1/bin` file. Example:
```bash
$ ~/neo4j-community-4.0.1/bin/neo4j start
```
Optionally, one can set their `~/.profile`, `~/.bashrc`, or `~/.zshrc` etc. to add Neo4j binaries to their path by adding the following line: 
```bash
export PATH=/home/david/neo4j-community-4.0.1/bin:$PATH
```
Then one can simply use:
```bash
$ neo4j start
```
Note this needs to run with Oracle Java 11 or OpenJDK 11. I recommend using [AdoptOpenJDK 11](https://adoptopenjdk.net/installation.html?variant=openjdk11&jvmVariant=hotspot) and setting $JAVA_HOME to the location of the directory e.g. `export JAVA_HOME=/home/david/Downloads/jdk-11.0.5+10`.

Neo4j browser should now be running on `http://localhost:7474`. Default username and password is `neo4j` and `neo4j` respectively.

### Step 4: Python Dependencies

Before running the `neo4j_yelp.py` script, make sure that you have installed all of the dependencies and edited `config.py` to contain your credentials. To download all the dependencies you can simply type:
```bash
$ pip3 install -r requirements.txt --user
```

### Step 5: Import the Dataset

Now that everything is configured and ready, the import script can be run with:
```bash
$ python3 neo4j_yelp.py
```
If all goes well, you will see the following output from the terminal:
```bash
[INFO] Clearing graph of any existing data
[INFO] Asserting schema
[INFO] Loading businesses
[INFO] Loading users
[INFO] Loading reviews
```