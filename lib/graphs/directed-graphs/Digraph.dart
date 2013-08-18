library directedgraphs;
import '../../fundamentals/stacks/bag.dart';
import 'AbstractGraph.dart';

class Digraph extends AbstractGraph {
    
   /**
     * Create an empty digraph with V vertices.
     * @throws java.lang.IllegalArgumentException if V < 0
     */
    Digraph(int V) {
        if (V < 0) 
          throw ("IllegalArgumentException: Number of vertices in a Digraph must be nonnegative");
        this.V = V;
        this.E = 0;
        adj = new List<Bag<int>>(V);
        for (int v = 0; v < V; v++) {
            adj[v] = new Bag<int>();
        }
    }
   /**
     * Add the directed edge v->w to the digraph.
     * @throws java.lang.IndexOutOfBoundsException unless both 0 <= v < V and 0 <= w < V
     */
    void addEdge(int v, int w) {
        if (v < 0 || v >= V) 
          throw ("IndexOutOfBoundsException:vertex $v is not between 0 and ${V-1}");
        if (w < 0 || w >= V) 
          throw ("IndexOutOfBoundsException:vertex $w is not between 0 and ${V-1}");
        adj[v].add(w);
        E++;
    }
    /**
     * Return the reverse of the digraph.
     */
    Digraph reverse() {
      Digraph R = this(V);
      for (int v = 0; v < V; v++) {
        for (int w in adj[v]) {
          R.addEdge(w, v);
        }
      }
      return R;
  }
}