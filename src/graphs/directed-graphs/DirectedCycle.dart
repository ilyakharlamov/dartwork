library DirectedCycle;
import "Digraph.dart";
import '../../../src/fundamentals/stacks/stack.dart';

/*************************************************************************
 *  Data files:   http://algs4.cs.princeton.edu/42directed/tinyDG.txt
 *
 *  Finds a directed cycle in a digraph.
 *  Runs in O(E + V) time.
 *
 *************************************************************************/

class DirectedCycle {
    List<bool> _marked;        // marked[v] = has vertex v been marked?
    List<int> _edgeTo;            // edgeTo[v] = previous vertex on path to v
    List<bool> _onStack;       // onStack[v] = is vertex on the stack?
    Stack<int> _cycle;    // directed cycle (or null if no such cycle)

    DirectedCycle(Digraph G) {
        _marked  = new List<bool>(G.V);
        _onStack = new List<bool>(G.V);
        _edgeTo  = new List<int>(G.V);
        for (int v = 0; v < G.V; v++)
            if (_marked[v]==null)
              dfs(G, v);
    }
    
    
    // check that algorithm computes either the topological order or finds a directed cycle
    void dfs(Digraph G, int v) {
        _onStack[v] = true;
        _marked[v] = true;
        for (int w in G.adj(v)) {

            // short circuit if directed cycle found
            if (_cycle != null) 
              return;

            //found new vertex, so recur
            else if (_marked[w]==null) {
                _edgeTo[w] = v;
                dfs(G, w);
            }

            // trace back directed cycle
            else if (_onStack[w]) {
                _cycle = new Stack<int>();
                for (int x = v; x != w; x = _edgeTo[x]) {
                    _cycle.push(x);
                }
                _cycle.push(w);
                _cycle.push(v);
            }
        }
        _onStack[v] = false;
    }
    
    bool get hasCycle => _cycle != null;
    Iterable<int> get cycle => _cycle;
    
    

    // certify that digraph is either acyclic or has a directed cycle
    bool check(Digraph G) {
        if (hasCycle) {
            // verify cycle
            int first = -1, last = -1;
            for (int v in cycle) {
                if (first == -1) first = v;
                last = v;
            }
            if (first != last) {
                print("cycle begins with $first and ends with $last");
                return false;
            }
        }
        return true;
    }

}