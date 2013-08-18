import 'package:unittest/unittest.dart';
import '../../../lib/fundamentals/stacks/queue.dart';

void main() {
  group('main-test-group',() {
    test("queue size", () {
      var q = new Queue<int>();
      expect(true, q.isEmpty);
      q.enqueue(777);
      expect(q.dequeue(), 777);
      expect(q.isEmpty, true);
    });
    
    test("queue test FIFO", () {
      var q = new Queue<int>();
      q.enqueue(111);
      q.enqueue(222);
      q.enqueue(333);
      expect(q.size, 3);
      expect(111, q.dequeue());
      expect(222, q.dequeue());
      expect(333, q.dequeue());
      expect(true, q.isEmpty);
    });
  });
}