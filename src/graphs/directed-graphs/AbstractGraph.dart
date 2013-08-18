library directedgraphs;
import '../../../src/fundamentals/stacks/bag.dart';
import '../../../src/fundamentals/stacks/stack.dart';
abstract class AbstractGraph {
  /**
   * The number of vertices in the graph.
   */
  int V;
  /**
   * The number of edges in the graph.
   */
  int E;
  int edges;
  /**
   * The list of vertices pointed to from vertex v as an Iterable.
   * @throws IndexOutOfBoundsException unless 0 <= v < V
   */
  List<Bag<int>> adj;
  
  AbstractGraph ();
  /**
   * Copy constructor.
   */
  AbstractGraph.fromGraph(AbstractGraph G) {
    this(G.V);
    this.E = G.E;
    for (int v = 0; v < G.V; v++) {
      // reverse so that adjacency list is in same order as original
      Stack<int> reverse = new Stack<int>();
      for ( int w in G.adj[v] ) {
        reverse.push(w);
      }
      for (int w in reverse) {
        adj[v].add(w);
      }
    }
  }
  
  void addEdge (int v, int w);

  /**
   * Return a string representation of this graph.
   */
  String toString() {
    String NEWLINE = "\n";
    String s = "";
    s+=("$V  $E$NEWLINE");
    for (int v = 0; v < V; v++) {
      s+="$v: ";
      for (int i in adj[v]) {
        s+= "$i  ";
      }
      s+=NEWLINE;
    }
    return s;
  }
  
}