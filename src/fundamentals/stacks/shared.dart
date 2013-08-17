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

class Node<Item> extends Object {
  Item item;
  Node next;
}