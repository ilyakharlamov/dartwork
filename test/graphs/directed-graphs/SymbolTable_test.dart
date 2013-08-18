import 'package:unittest/unittest.dart';
import '../../../lib/graphs/directed-graphs/Digraph.dart';
import '../../../lib/graphs/directed-graphs/SymbolTable.dart';
import "../../testutils.dart";

void main() {
  group('main-test-group',() {
    test("init", () {
      var st = new SymbolTable<String, int>();
      st.put("BBB", 2);
      st.put("AAA", 1);
      st.put("CCC", 3);
      expect(st.get("AAA"), 1);
      expect(st.keys, ["AAA", "BBB", "CCC"], reason:"order of keys is not preserved");
      expect(st.get("CCC"), 3);
    });
  });
}
