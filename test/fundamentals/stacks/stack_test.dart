import 'package:unittest/unittest.dart';
import '../../../lib/fundamentals/stacks/stack.dart';

void main() {
  group('main-test-group',() {
    test("if i am a shampoo", ()=>expect("1", "1"));
    test("size", () {
      var s = new Stack<int>();
      expect(true, s.isEmpty);
      expect(s.size, 0);
      s.push(123);
      expect(s.size, 1);
    });
    test("LIFO", () {
      var s = new Stack<int>();
      s.push(111);
      s.push(222);
      s.push(333);
      expect(s.pop(), 333);
      expect(s.pop(), 222);
      expect(s.pop(), 111);
    });
  });
}