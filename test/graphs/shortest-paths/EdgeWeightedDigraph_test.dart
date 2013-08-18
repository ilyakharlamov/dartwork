        /*EdgeWeightedDigraph G = new EdgeWeightedDigraph(in);
        StdOut.println(G);*/
import 'package:unittest/unittest.dart';
import '../../../src/graphs/shortest-paths/DirectedEdge.dart';
import '../../../src/graphs/shortest-paths/EdgeWeightedDigraph.dart';

void main() {
  group('test',() {
    
    test("init", () {
      var dag = new EdgeWeightedDigraph(5);
      expect(dag.V, 5);
    });
    test("", () {
      var ewd = new EdgeWeightedDigraph(8, 15);
      var arr =[[4,5,0.35],
      [5,4,0.35],
      [4,7,0.37],
      [5,7,0.28],
      [7,5,0.28],
      [5,1,0.32],
      [0,4,0.38],
      [0,2,0.26],
      [7,3,0.39],
      [1,3,0.29],
      [2,7,0.34],
      [6,2,0.40],
      [3,6,0.52],
      [6,0,0.58],
      [6,4,0.93]];
      for (var i in arr) {
        ewd.addEdge(new DirectedEdge(i[0],i[1],i[2]));
      }
      expect(ewd.E, arr.length);
    });
  });
  
}