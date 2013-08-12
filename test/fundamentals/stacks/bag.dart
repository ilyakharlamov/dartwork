import 'package:unittest/unittest.dart';
import '../../../src/fundamentals/stacks/bag.dart';

void main() {
  group('main-test-group',() {
    test("if i am a shampoo", ()=>expect("1", "1"));
    test("bag size", () {
      var bag = new Bag<int>();
      expect(true, bag.isEmpty);
      bag.add(123);
      expect(bag.size, 1);
      bag.add(456);
      expect(bag.size, 2);
      var iter = bag.iterator;
      expect(iter.current, null);
      iter.moveNext();
      expect(iter.current, 456);
      iter.moveNext();
      expect(iter.current, 123);
      expect(iter.moveNext(), false);
    });
  });
}