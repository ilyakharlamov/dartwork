library testutils;
import "package:range/range.dart";
import 'dart:mirrors';

List<List<int>> textToList (String str) {
    List<List<int>> lstAll = [];
    for (String line in str.split("\n")) {
      dynamic lineArr = line.trim().split(new RegExp(r"\s+"));
      List<int> lstLine = [];
      for (final int i in range(lineArr.length)) {
        lstLine.add(int.parse(lineArr[i]));
        //print(reflect(lineArr[i]).type);       
      }
      lstAll.add(lstLine);
    }
    return lstAll;
  }

main () {
  print(textToList("22 11\n11 22"));
}