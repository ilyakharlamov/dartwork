library testutils;
import "package:range/range.dart";
import 'dart:mirrors';

List<List<int>> textToList (String str, [type="int"]) {
    List<List<int>> lstAll = [];
    for (String line in str.split("\n")) {
      dynamic lineArr = line.trim().split(new RegExp(r"\s+"));
      List<int> lstLine = [];
      for (final int i in range(lineArr.length)) {
        if (type == "int") {
          lstLine.add(int.parse(lineArr[i]));          
        } else if (type=="String") {
          lstLine.add(lineArr[i]);
        }
        //print(reflect(lineArr[i]).type);       
      }
      lstAll.add(lstLine);
    }
    return lstAll;
  }
void printIterable (Iterable iterable) {
  String s ="[";
  var iter = iterable.iterator;
  while (iter.moveNext()) {
    s+=iter.current.toString()+",";
  }
  s+="]";
  print(s);
}

main () {
  print(textToList("22 11\n11 22"));
}