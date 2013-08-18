library EdgeWeightedDigraph;
import 'dart:math';
import "DirectedEdge.dart";
import '../../fundamentals/stacks/bag.dart';
/*************************************************************************
 *  Compilation:  javac EdgeWeightedDigraph.java
 *  Execution:    java EdgeWeightedDigraph V E
 *  Dependencies: Bag.java DirectedEdge.java
 *
 *  An edge-weighted digraph, implemented using adjacency lists.
 *
 *************************************************************************/

/**
 *  The <tt>EdgeWeightedDigraph</tt> class represents an directed graph of vertices
 *  named 0 through V-1, where each edge has a real-valued weight.
 *  It supports the following operations: add an edge to the digraph,
 *  iterate over all of edges leaving a vertex.
 *  Parallel edges and self-loops are permitted.
 *  <p>
 *  For additional documentation, see <a href="http://algs4.cs.princeton.edu/44sp">Section 4.4</a> of
 *  <i>Algorithms, 4th Edition</i> by Robert Sedgewick and Kevin Wayne.
 **/
class EdgeWeightedDigraph {
    final int _V;
    int _E;
    List<Bag<DirectedEdge>> _adj;
    
    /**
     * Create a edge-weighted digraph with V vertices and E edges.
     */
    EdgeWeightedDigraph (this._V, [this._E]) {
        if (_V < 0) 
          throw ("IllegalArgumentException Number of vertices in a Digraph must be nonnegative");
        this._E = 0;
        _adj = new List<Bag<DirectedEdge>>(_V);
        for (int v = 0; v < _V; v++)
            _adj[v] = new Bag<DirectedEdge>();
        if ( _E == null ) {
          return;
        }
        if (_E < 0) 
          throw ("IllegalArgumentException Number of edges in a Digraph must be nonnegative");
        var rng = new Random();
        for (int i = 0; i < _E; i++) {
            int v = (int) (rng.nextInt(1000000000000) * _V);
            int w = (int) (rng.nextInt(1000000000000) * _V);
            double weight = (100 * rng.nextInt(1000000000000)).round() / 100.0;
            DirectedEdge e = new DirectedEdge(v, w, weight);
            addEdge(e);
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
     * Add the directed edge e to this digraph.
     */
    void addEdge(DirectedEdge e) {
        int v = e.from;
        if (_V-1 < v ) {
          throw "Range exception, trying to assign edge with from=$v while EWD size is only $_V";
        }
        _adj[v].add(e);
        _E++;
    }
    /**
     * Return the edges incident from vertex v as an Iterable.
     * To iterate over the edges incident from vertex v in digraph G, use foreach notation:
     * <tt>for (DirectedEdge e : G.adj(v))
     */
    Iterable<int> adj(int v) {
        if (v < 0 || v >= V) throw "IndexOutOfBoundsException";
        return _adj[v];
    }
    
    /**
     * Return all edges in this digraph as an Iterable.
     * To iterate over the edges in the digraph, use foreach notation:
     * <tt>for (DirectedEdge e : G.edges())</tt>.
     */
    Iterable<DirectedEdge> edges() {
        Bag<DirectedEdge> list = new Bag<DirectedEdge>();
        for (int v = 0; v < _V; v++) {
            for (final DirectedEdge e in adj(v)) {
                list.add(e);
            }
        }
        return list;
    }
    /**
     * Return number of edges incident from v.
     */
    int outdegree(int v) {
        return _adj[v].size;
    }
    
    /**
     * Return a string representation of this digraph.
     */
    String toString() {
        String NEWLINE = "\n";
        String s = "";
        s+=("$_V  $_E$NEWLINE");
        for (int v = 0; v < V; v++) {
            s+="$v: ";
            for (DirectedEdge e in _adj[v]) {
                s+= "$e  ";
            }
            s+=NEWLINE;
        }
        return s;
    }
}



/*
    
    

   


   /**
     * Copy constructor.
     */
    public EdgeWeightedDigraph(EdgeWeightedDigraph G) {
        this(G.V());
        this.E = G.E();
        for (int v = 0; v < G.V(); v++) {
            // reverse so that adjacency list is in same order as original
            Stack<DirectedEdge> reverse = new Stack<DirectedEdge>();
            for (DirectedEdge e : G.adj[v]) {
                reverse.push(e);
            }
            for (DirectedEdge e : reverse) {
                adj[v].add(e);
            }
        }
    }

   


   




    

  



   

    /**
     * Test client.
     */
    public static void main(String[] args) {
        In in = new In(args[0]);

    }

}*/