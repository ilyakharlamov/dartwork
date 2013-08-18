import 'package:unittest/unittest.dart';
import '../../../src/graphs/directed-graphs/Digraph.dart';
import '../../../src/graphs/directed-graphs/DirectedCycle.dart';
import '../../../src/graphs/directed-graphs/Toplogical.dart';
import '../../testutils.dart';

void main() {
  group('main-test-group',() {
    test("bag size", () {
      var dag = new Digraph(5);
      expect(dag.V, 5);
      dag.addEdge(0, 1);
      expect(dag.E, 1);
    });
  });
  
  test("topological sort", () {
    final List<List<int>> lines = textToList("""2 3 
0 6 
0 1 
2 0 
11 12  
9 12  
9 10  
9 11 
3 5 
8 7 
5 4 
0 5 
6 4 
6 9 
7 6""");
    Digraph dag = new Digraph(13);
    for (List<int> line in lines) {
      dag.addEdge(line[0], line[1]);
    }
    Topological top = new Topological(dag);
    expect(top.order, [8,7,2,3,0,6,9,10,11,12,1,5,4]);
  });
  
}