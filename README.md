A general-purpose algoritms library written in Dart language.
The implemented Algoritms are:

Fundamentals
============

stacks
------
* Bag 
* Queue 
* Stack

Graphs
======
directed graphs
---------------
* Graph
* Digraph
* DirectedCycle
* DepthFirstOrder
* SymbolGraph
* SymbolDigraph
* SymbolTable
* Topological

The major part is based on Robert Sedgewick's book Algorithms ISBN 978-0-321-57351-3
 
Compatibility with the latest Dart release:
[![Build Status](https://drone.io/github.com/ilyakharlamov/dartwork/status.png)](https://drone.io/github.com/ilyakharlamov/dartwork/latest)


Usage example:
```dart
import "package:unittest/unittest.dart";
import "package:dartwork/graphs/directed-graphs/Digraph.dart";
import "package:dartwork/graphs/directed-graphs/DirectedCycle.dart";

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
```
