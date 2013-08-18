library SymbolGraph;
import "Graph.dart";
import "SymbolTable.dart";
import "AbstractGraph.dart";
import "Entry.dart";
/**
 * This Graph client allows clients to define graphs with String vertex names instead of integer indices.
 */
class SymbolGraph {
    SymbolTable<String, int> st;  // string -> indePx
    List<String> keys;           // index  -> string
    AbstractGraph G;

    SymbolGraph(List<Entry<String, String>> entries) {
      st = new SymbolTable<String, int>();
      // First pass builds the index by reading strings to associate
      for (Entry<String, String> entry in entries) {
        String key = entry.key;
        if ( st.contains(key) )
          continue;
        st.put(entry.key, st.size);
        st.put(entry.value, st.size);
      }
      
      keys = new List<String>(st.size);
      // distinct strings with an index
      for (String name in st.keys) {
          keys[st.get(name)] = name;
      }

      // second pass builds the graph by connecting first vertex on each
      // line to all others
      G = new Graph(st.size);
      for (Entry<String, String> entry in entries) {
        int v = st.get(entry.key);
        int w = st.get(entry.value);
        G.addEdge(v, w);
      }
    }

    bool contains(String s) => st.contains(s);

    int index(String s) => st.get(s);
    /**
     * Returns
     */
    List<String> adj (String name) {
      List<String> lst = new List<String>();
      var indexIter = G.adj[index(name)].iterator;
      while (indexIter.moveNext()) {
        lst.add(this.name(indexIter.current));
      }
      return lst;
    }

    String name(int v) => keys[v];
}