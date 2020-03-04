from neo4j import GraphDatabase

uri = "bolt://0.0.0.0:7687"
driver = GraphDatabase.driver(uri, auth=("neo4j", "bitnami"))

def print_friends_of(tx, name):
    for record in tx.run("MATCH (a:Person)-[:KNOWS]->(f) "
                         "WHERE a.name = {name} "
                         "RETURN f.name", name=name):
        print(record["f.name"])

with driver.session() as session:
    session.read_transaction(print_friends_of, "Alice")