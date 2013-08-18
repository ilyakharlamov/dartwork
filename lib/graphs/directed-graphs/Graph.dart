library Graph;
import 'dart:math' as math;
//import 'Digraph.dart';
import '../../fundamentals/stacks/bag.dart';
import 'AbstractGraph.dart';
/*************************************************************************
 *  A graph, implemented using an array of sets.
 *  Parallel edges and self-loops allowed.
 *************************************************************************/
/**
 *  The <tt>Graph</tt> class represents an undirected graph of vertices
 *  named 0 through V-1.
 *  It supports the following operations: add an edge to the graph,
 *  iterate over all of the neighbors adjacent to a vertex.
 *  Parallel edges and self-loops are permitted.
 *  <p>
 *  For additional documentation, see <a href="http://algs4.cs.princeton.edu/41undirected">Section 4.1</a> of
 *  <i>Algorithms, 4th Edition</i> by Robert Sedgewick and Kevin Wayne.
 */
class Graph extends AbstractGraph {
    
   /**
     * Create an empty graph with V vertices.
     * @throws java.lang.IllegalArgumentException if V < 0
     */
    Graph (int v, [int e=0]) {
        if (v < 0) 
          throw ("IllegalArgumentException Number of vertices in a Digraph must be nonnegative");
        this.V = v;
        this.E = e;
        adj = new List<Bag<int>>(V);
        for (int i = 0; i < V; i++)
            adj[i] = new Bag<int>();
        if (E < 0) 
          throw ("IllegalArgumentException Number of edges in a Digraph must be nonnegative");
        var rng = new math.Random();
        for (int i = 0; i < E; i++) {
            int v = (int) (rng.nextInt(1000000000000) * V);
            int w = (int) (rng.nextInt(1000000000000) * V);
            addEdge(v, w);
        }
    }   
   /**
     * Add the undirected edge v-w to graph.
     * @throws java.lang.IndexOutOfBoundsException unless both 0 <= v < V and 0 <= w < V
     */
    void addEdge(int v, int w) {
      if (v == null) {
        throw ("vertice start should not be null");
      }
      if (w == null) {
        throw ("vertice end should not be null");
      }      
      if (v < 0 || v >= V) 
        throw ("IndexOutOfBoundsException:vertex $v is not between 0 and ${V-1}");
      if (w < 0 || w >= V) 
        throw ("IndexOutOfBoundsException:vertex $w is not between 0 and ${V-1}");
      adj[v].add(w);
      adj[w].add(v);
      E++;
    }
}