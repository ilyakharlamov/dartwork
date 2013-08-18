library DepthFirstOrder;
import "EdgeWeightedDigraph.dart";
import "../../fundamentals/stacks/queue.dart";
import "../../fundamentals/stacks/stack.dart";
/*************************************************************************
 *  Compilation:  javac DepthFirstOrder.java
 *  Execution:    java DepthFirstOrder filename.txt
 *  Dependencies: Digraph.java Queue.java Stack.java StdOut.java
 *                EdgeWeightedDigraph.java DirectedEdge.java
 *  Data files:   http://algs4.cs.princeton.edu/42directed/tinyDAG.txt
 *                http://algs4.cs.princeton.edu/42directed/tinyDG.txt
 *
 *  Compute preorder and postorder for edge-weighted digraph.
 *  Runs in O(E + V) time.
 *************************************************************************
*/
class DepthFirstOrder {
    List<bool> _marked;          // marked[v] = has v been marked in dfs?
    List<int> _pre;                 // pre[v]    = preorder  number of v
    List<int> _post;                // post[v]   = postorder number of v
    Queue<int> preorder;   // vertices in preorder
    Queue<int> postorder;  // vertices in postorder
    int preCounter;            // counter or preorder numbering
    int postCounter;           // counter for postorder numbering

                // depth-first search preorder and postorder in a digraph
    DepthFirstOrder(EdgeWeightedDigraph G) {
        _pre    = new List<int>(G.V);
        _post   = new List<int>(G.V);
        postorder = new Queue<int>();
        preorder  = new Queue<int>();
        _marked    = new List<bool>(G.V);
        for (int v = 0; v < G.V; v++) {
            if (!_marked[v]) 
              dfs(G, v);
        }
    }

    // run DFS in digraph G from vertex v and compute preorder/postorder
    void dfs(EdgeWeightedDigraph G, int v) {
        _marked[v] = true;
        _pre[v] = preCounter++;
        preorder.enqueue(v);
        for (final int w in G.adj(v)) {
            if (!_marked[w]) {
                dfs(G, w);
            }
        }
        postorder.enqueue(v);
        _post[v] = postCounter++;
    }
    int getPre (int v) {
      return _pre[v];
    }
    int getPost (int v) {
      return _post[v];
    }
    Iterable<int> get pre => preorder;
    Iterable<int> get post => postorder;
    

    // return vertices in reverse postorder as an Iterable
    Iterable<int> reversePost() {
        Stack<int> reverse = new Stack<int>();
        for (int v in postorder)
            reverse.push(v);
        return reverse;
    }


    // check that pre() and post() are consistent with pre(v) and post(v)
    /*
    private boolean check(Digraph G) {

        // check that post(v) is consistent with post()
        int r = 0;
        for (int v : post()) {
            if (post(v) != r) {
                StdOut.println("post(v) and post() inconsistent");
                return false;
            }
            r++;
        }

        // check that pre(v) is consistent with pre()
        r = 0;
        for (int v : pre()) {
            if (pre(v) != r) {
                StdOut.println("pre(v) and pre() inconsistent");
                return false;
            }
            r++;
        }


        return true;
    }

    
*/
}