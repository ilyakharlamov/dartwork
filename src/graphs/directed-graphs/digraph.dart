import '../../../src/fundamentals/stacks/bag.dart';

class Digraph {
    int _V;
    int _E;
    List<Bag<int>> _adj;
    
   /**
     * Create an empty digraph with V vertices.
     * @throws java.lang.IllegalArgumentException if V < 0
     */
    Digraph(int V) {
        if (V < 0) 
          throw ("IllegalArgumentException: Number of vertices in a Digraph must be nonnegative");
        _V = V;
        _E = 0;
        _adj = new List<Bag<int>>(V);
        for (int v = 0; v < V; v++) {
            _adj[v] = new Bag<int>();
        }
    }
    /**
     * Return the number of vertices in the digraph.
     */
    int get V => _V; 
    /**
     * Return the number of edges in the digraph.
     */
    int get E => _E;

   /**
     * Create a digraph from input stream.
     */  
   /* public Digraph(In in) {
        try {
            this.V = in.readInt();
            if (V < 0) throw new IllegalArgumentException("Number of vertices in a Digraph must be nonnegative");
            adj = (Bag<Integer>[]) new Bag[V];
            for (int v = 0; v < V; v++) {
                adj[v] = new Bag<Integer>();
            }
            int E = in.readInt();
            if (E < 0) throw new IllegalArgumentException("Number of edges in a Digraph must be nonnegative");
            for (int i = 0; i < E; i++) {
                int v = in.readInt();
                int w = in.readInt();
                addEdge(v, w); 
            }
        }
        catch (NoSuchElementException e) {
            throw new InputMismatchException("Invalid input format in Digraph constructor");
        }
    }

   /**
     * Copy constructor.
     */
    public Digraph(Digraph G) {
        this(G.V());
        this.E = G.E();
        for (int v = 0; v < G.V(); v++) {
            // reverse so that adjacency list is in same order as original
            Stack<Integer> reverse = new Stack<Integer>();
            for (int w : G.adj[v]) {
                reverse.push(w);
            }
            for (int w : reverse) {
                adj[v].add(w);
            }
        }
    }
        

    public int V() {
        return V;
    }


    public int E() {
        return E;
    }*/

   /**
     * Add the directed edge v->w to the digraph.
     * @throws java.lang.IndexOutOfBoundsException unless both 0 <= v < V and 0 <= w < V
     */
    void addEdge(int v, int w) {
        if (v < 0 || v >= _V) 
          throw ("IndexOutOfBoundsException:vertex $v is not between 0 and ${_V-1}");
        if (w < 0 || w >= _V) 
          throw ("IndexOutOfBoundsException:vertex $w is not between 0 and ${_V-1}");
        _adj[v].add(w);
        _E++;
    }

   /**
     * Return the list of vertices pointed to from vertex v as an Iterable.
     * @throws java.lang.IndexOutOfBoundsException unless 0 <= v < V
     */
    Iterable<int> adj(int v) {
        if (v < 0 || v >= V) throw "IndexOutOfBoundsException";
        return _adj[v];
    }

   /**
     * Return the reverse of the digraph.
     */
    /*public Digraph reverse() {
        Digraph R = new Digraph(V);
        for (int v = 0; v < V; v++) {
            for (int w : adj(v)) {
                R.addEdge(w, v);
            }
        }
        return R;
    }

   /**
     * Return a string representation of the digraph.
     */
    public String toString() {
        StringBuilder s = new StringBuilder();
        String NEWLINE = System.getProperty("line.separator");
        s.append(V + " vertices, " + E + " edges " + NEWLINE);
        for (int v = 0; v < V; v++) {
            s.append(String.format("%d: ", v));
            for (int w : adj[v]) {
                s.append(String.format("%d ", w));
            }
            s.append(NEWLINE);
        }
        return s.toString();
    }

   /**
     * Test client.
     */
    public static void main(String[] args) {
        In in = new In(args[0]);
        Digraph G = new Digraph(in);
        StdOut.println(G);
    }*/

}