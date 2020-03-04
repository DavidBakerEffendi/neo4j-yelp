from py2neo import Graph
import config

uri = "{}://{}:{}@{}:{}".format(config.PROTO, config.USER, config.PASSWORD, config.HOSTNAME, config.PORT)

graph = Graph(uri)

print(graph.evaluate("MATCH (tom {name: \"Tom Hanks\"}) RETURN tom"))
