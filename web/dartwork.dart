import 'dart:html';
import 'package:js/js.dart' as js;
import '../src/graphs/directed-graphs/digraph.dart';

void main() {
  /*query("#sample_text_id")
    ..text = "Click me!"
    ..onClick.listen(reverseText);*/
/*  js.scoped(() {
    var dee3 = js.context.d3; 
    var dataset = js.array([ 5, 10, 15, 20, 25 ]);
    dee3.select("body").selectAll("p")
      .data(dataset)
        .enter()
          .append("p")
            .text(new js.Callback.many((d, i, context) { return d; }));
  });*/
  var list = [];
  list.add({
    "source":"1",
    "target":"2",
    "type":"depends",
  });
  list.add({
    "source":"1",
    "target":"3",
    "type":"depends",
  });
  
  
  var tinyDAG = [ [4, 2 ],
                  [2, 3 ],
                  [3, 2 ],
                  [6, 0 ],
                  [0, 1 ],
                  [2, 0 ],
                  [11, 12],
                  [12, 9],
                  [9, 10 ],
                  [9, 11 ],
                  [7, 9 ],
                  [10, 12],
                  [11, 4],
                  [4, 3 ],
                  [3, 5 ],
                  [6, 8 ],
                  [8, 6 ],
                  [5, 4 ],
                  [0, 5 ],
                  [6, 4 ],
                  [6, 9 ],
                  [7, 6 ]];
  var digraph = new Digraph(13);
  for (var pair in tinyDAG) {
    js.context.console.log(js.array(pair));
    digraph.addEdge(pair[0], pair[1]);
  }
  var lst = [];
  for (var i in range()) {
    
  }
  
  
  //js.context.showLinks(js.array(list));
}

void reverseText(MouseEvent event) {
  var text = query("#sample_text_id").text;
  var buffer = new StringBuffer();
  for (int i = text.length - 1; i >= 0; i--) {
    buffer.write(text[i]);
  }
  query("#sample_text_id").text = buffer.toString();
}
