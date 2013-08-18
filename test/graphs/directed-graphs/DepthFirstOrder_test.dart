import 'package:unittest/unittest.dart';
import '../../../src/graphs/directed-graphs/Digraph.dart';
import '../../../src/graphs/directed-graphs/DepthFirstOrder.dart';

void main() {
  group('main-test-group',() {
    test("DFS", () {
      var dag = new Digraph(5);
      expect(dag.V, 5);
      dag.addEdge(0, 1);
      expect(dag.E, 1);
    });
  });
  var arr = [
             [2,3], 
             [0,6], 
             [0,1], 
             [2,0], 
             [11,12], 
             [9,12], 
             [9,10], 
             [9,11], 
             [3,5], 
             [8,7], 
             [5,4], 
             [0,5], 
             [6,4], 
             [6,9], 
             [7,6]
             ];
  var dag = new Digraph(13);
  for (var i in arr) {
    dag.addEdge(i[0], i[1]);
  }
  var dfs = new DepthFirstOrder(dag);
  expect(dfs._pre, [0, 3, 9, 10, 2, 1, 4, 11, 12, 5, 8, 6, 7]);
  expect(dfs._post, [8,2,10,9,0,1,7,11,12,6,5,4,3]);
}