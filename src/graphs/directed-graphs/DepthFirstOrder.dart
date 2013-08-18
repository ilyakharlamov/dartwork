library DepthFirstOrder;
import "Digraph.dart";
import "package:range/range.dart";
import "../../fundamentals/stacks/queue.dart";
import "../../fundamentals/stacks/stack.dart";

/*************************************************************************
 *  Compute preorder and postorder for a digraph digraph.
 *  Runs in O(E + V) time.
 *************************************************************************
*/
class DepthFirstOrder {
    List<bool> marked;          // marked[v] = has v been marked in dfs?
    List<int> _pre;                 // pre[v]    = preorder  number of v
    List<int> _post;                // post[v]   = postorder number of v
    Queue<int> preorder;   // vertices in preorder
    Queue<int> postorder;  // vertices in postorder
    int preCounter = 0;            // counter or preorder numbering
    int postCounter = 0;           // counter for postorder numbering

    // depth-first search preorder and postorder in a digraph
    DepthFirstOrder(Digraph G) {
        _pre    = new List<int>(G.V);
        _post   = new List<int>(G.V);
        postorder = new Queue<int>();
        preorder  = new Queue<int>();
        marked    = new List<bool>(G.V);
        for (int i in range(marked.length)){
          marked[i]=false;
        }
        for (int v = 0; v < G.V; v++) {
            if (!marked[v]) 
              dfs(G, v);
        }
    }
    // run DFS in digraph G from vertex v and compute preorder/postorder
    void dfs(Digraph G, int v) {
        marked[v] = true;
        _pre[v] = preCounter++;
        preorder.enqueue(v);
        for (final int w in G.adj(v)) {
            if (!marked[w]) {
                dfs(G, w);
            }
        }
        postorder.enqueue(v);
        _post[v] = postCounter++;
    }
    int pre (int v) => _pre[v];
    int post (int v) => _post[v];
    // return vertices in reverse postorder as an Iterable
    Iterable<int> reversePost() {
        Stack<int> reverse = new Stack<int>();
        for (int v in postorder)
            reverse.push(v);
        return reverse;
    }
    // check that pre() and post() are consistent with pre(v) and post(v)
    bool check(Digraph G) {
        // check that post(v) is consistent with post()
        int r = 0;
        for (int v in postorder) {
            if (post(v) != r) {
                print("post(v) and post() inconsistent");
                return false;
            }
            r++;
        }
        // check that pre(v) is consistent with pre()
        r = 0;
        for (int v in preorder) {
            if (pre(v) != r) {
                print("pre(v) and pre() inconsistent");
                return false;
            }
            r++;
        }
        return true;
    }

}