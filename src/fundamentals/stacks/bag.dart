library bag;
import "dart:collection";
class Bag<Item> extends Object with IterableMixin<Item> {
  int _N; // number of elements in bag
  Node _first;
  Bag () {
    _first = null;
    _N = 0;
  }
  bool get isEmpty => _first==null;
  int get size => _N;
   /**
     * Add the item to the bag.
     */
    void add(Item item) {
        Node oldfirst = _first;
        _first = new Node();
        _first.item = item;
        _first.next = oldfirst;
        _N++;
    }

    ListIterator<Item> get iterator {
    return new ListIterator<Item>(_first);
  }
}

class Node<Item> extends Object {
  Item item;
  Node next;
}


class ListIterator<Item> implements Iterator<Item> {
  Node _current;
  ListIterator (Node current) {
    _current=new Node();
    _current.next=current;
  }
  Item get current => _current.item;
  bool moveNext () {
    if ( _current.next == null ) {
      return false;
    }
    _current=_current.next;
    return true;
  }

}