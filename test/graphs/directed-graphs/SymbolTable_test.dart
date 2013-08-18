import 'package:unittest/unittest.dart';
import '../../../src/graphs/directed-graphs/Digraph.dart';
import '../../../src/graphs/directed-graphs/SymbolTable.dart';
import "../../testutils.dart";

void main() {
  group('main-test-group',() {
    test("init", () {
      var st = new SymbolTable<String, int>();
      st.put("AAA", 1);
      st.put("BBB", 2);
      st.put("CCC", 3);
      expect(st.get("AAA"), 1);
    });
  });
}
