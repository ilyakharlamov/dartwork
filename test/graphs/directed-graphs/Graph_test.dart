import 'package:unittest/unittest.dart';
import '../../../src/graphs/directed-graphs/Graph.dart';
import '../../testutils.dart';

void main() {
  group('main-test-group',() {
    test("Graph", () {
      var dag = new Graph(5);
      expect(dag.V, 5);
      dag.addEdge(0, 1);
      expect(dag.E, 1);
    });
    test("Test Graph", () {
      final List<List<int>> lines = textToList("""0 5
4 3
0 1
9 12
6 4
5 4
0 2
11 12
9 10
0 6
7 8
9 11
5 3""");
      var g = new Graph(13,13);
      for (line in lines) {
        g.addEdge(line[0], line[1]);
      }
      expect(g.adj(0), [0, 3, 9, 10, 2, 1, 4, 11, 12, 5, 8, 6, 7]);
    });
  });
}