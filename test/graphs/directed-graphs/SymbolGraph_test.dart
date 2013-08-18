import 'package:unittest/unittest.dart';
import '../../../lib/graphs/directed-graphs/SymbolGraph.dart';
import '../../../lib/graphs/directed-graphs/Entry.dart';
import 'dart:collection';
//import '../../../src/graphs/directed-graphs/Toplogical.dart';
import '../../testutils.dart';

void main() {
  group('main-test-group',() {
      test("digraph", () {
        final List<List<int>> lines = textToList("""JFK MCO
            ORD DEN
            ORD HOU
            DFW PHX
            JFK ATL
            ORD DFW
            ORD PHX
            ATL HOU
            DEN PHX
            PHX LAX
            JFK ORD
            DEN LAS
            DFW HOU
            ORD ATL
            LAS LAX
            ATL MCO
            HOU MCO
        LAS PHX""", "String");
//        
        List<Entry<String, String>> entries = new List<Entry<String, String>>();
        for (List<int> line in lines) {
          entries.add(new Entry(line[0], line[1]));
        }
        SymbolGraph sg = new SymbolGraph(entries);
        expect(new HashSet.from(sg.adj("JFK")), new HashSet.from(["ATL", "MCO", "ORD"]));
        expect(new HashSet.from(sg.adj("LAX")), new HashSet.from(["PHX","LAS"]));
        //print ( );
    });
  });
}