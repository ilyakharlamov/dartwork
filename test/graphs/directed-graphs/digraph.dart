import 'package:unittest/unittest.dart';
import '../../../src/graphs/directed-graphs/digraph.dart';

void main() {
  group('main-test-group',() {
    test("bag size", () {
      var dag = new Digraph(5);
      expect(dag.V, 5);
      dag.addEdge(0, 1);
      expect(dag.E, 1);
    });
  });
  
  var arr = [1, 2, 3];
  for (var i in arr) {
    print("i is $i");
  }
}