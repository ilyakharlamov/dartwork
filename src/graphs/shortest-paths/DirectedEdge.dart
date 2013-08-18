library DirectedEdge;
/*************************************************************************
 *  Compilation:  javac DirectedEdge.java
 *  Execution:    java DirectedEdge
 *
 *  Immutable weighted directed edge.
 *
 *************************************************************************/

/**
 *  The <tt>DirectedEdge</tt> class represents a weighted edge in an directed graph.
 *  <p>
 *  For additional documentation, see <a href="http://algs4.cs.princeton.edu/44sp">Section 4.4</a> of
 *  <i>Algorithms, 4th Edition</i> by Robert Sedgewick and Kevin Wayne.
 */
class DirectedEdge { 
  /**
   * Return the vertex where this edge begins.
   */
    final int from;
    /**
     * Return the vertex where this edge ends.
     */
    final int to;
    final double weight;
    /**
     * Create a directed edge from v to w with given weight.
     */
    DirectedEdge(int this.from, int this.to, double this.weight) {
    }
    
    /**
     * Return a string representation of this edge.
     */
    String toString() {
      return "$from -> $to $weight";
    }

}