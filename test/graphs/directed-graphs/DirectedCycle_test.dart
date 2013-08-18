/* *  % java DirectedCycle tinyDG.txt 
 *  Cycle: 3 5 4 3 
 *
 *  %  java DirectedCycle tinyDAG.txt 
 *  No cycle*/
 import 'package:unittest/unittest.dart';
 import '../../../src/graphs/directed-graphs/Digraph.dart';
 import '../../../src/graphs/directed-graphs/DirectedCycle.dart';
 import "../../testutils.dart";

 void main() {
   group('main-test-group',() {
     test("has cycle", () {
       List<List<int>> lines = textToList("""4  2
           2  3
           3  2
           6  0
           0  1
           2  0
           11 12
           12  9
           9 10
           9 11
           7  9
           10 12
           11  4
           4  3
           3  5
           6  8
           8  6
           5  4
           0  5
           6  4
           6  9
           7  6""");
       var dag = new Digraph(13);
       for (List<int> line in lines) {;
         dag.addEdge(line[0], line[1]);
       }
       DirectedCycle dc = new DirectedCycle(dag);
       expect(dc.cycle, [3,5,4,3]);
     });
     
     
     test("no cycle", () {
       List<List<int>> lines = textToList("""2 3 
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
       var dag = new Digraph(13);
       for (List<int> line in lines) {;
         dag.addEdge(line[0], line[1]);
       }
       DirectedCycle dc = new DirectedCycle(dag);
       expect(dc.cycle, null);
     });
   });
 }