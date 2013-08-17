library Topological;
import "Digraph.dart";
import "DepthFirstOrder.dart";
import "DirectedCycle.dart";
/*************************************************************************
 *  Compilation:  javac Topoological.java
 *  Dependencies: Digraph.java DepthFirstOrder.java DirectedCycle.java
 *                EdgeWeightedDigraph.java EdgeWeightedDirectedCycle.java
 *  Data files:   http://algs4.cs.princeton.edu/42directed/jobs.txt
 *
 *  Compute topological ordering of a DAG or edge-weighted DAG.
 *  Runs in O(E + V) time.
 *
 *  % java Topological jobs.txt "/"
 *  Calculus
 *  Linear Algebra
 *  Introduction to CS
 *  Programming Systems
 *  Algorithms
 *  Theoretical CS
 *  Artificial Intelligence
 *  Machine Learning
 *  Neural Networks
 *  Robotics
 *  Scientific Computing
 *  Computational Biology
 *  Databases
 *
 *
 *************************************************************************/

class Topological {
    Iterable<int> order;    // topological order
    // topological sort in a digraph
    Topological(Digraph G) {
        DirectedCycle finder = new DirectedCycle(G);
        if ( !finder.hasCycle ) {
            DepthFirstOrder dfs = new DepthFirstOrder(G);
            order = dfs.reversePost();
        }
    }
    // does digraph have a topological order?
    bool get hasOrder => order != null;
}