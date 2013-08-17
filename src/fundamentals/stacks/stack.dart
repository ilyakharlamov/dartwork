import "dart:collection";
import "shared.dart";
/**
 *  The <tt>Stack</tt> class represents a last-in-first-out (LIFO) stack of generic items.
 *  It supports the usual <em>push</em> and <em>pop</em> operations, along with methods
 *  for peeking at the top item, testing if the stack is empty, and iterating through
 *  the items in LIFO order.
 *  <p>
 *  All stack operations except iteration are constant time.
 *  <p>
 *  For additional documentation, see <a href="/algs4/13stacks">Section 1.3</a> of
 *  <i>Algorithms, 4th Edition</i> by Robert Sedgewick and Kevin Wayne.
 */
class Stack<Item> extends Object with IterableMixin<Item> {
  int _N; // number of elements in bag
  Node _first;
  Node _last;
  /**
   * Create an empty stack.
   */
  Stack() {
    _first = null;
    _N = 0;
    //assert check();
  }
  
  /**
   * Is the queue empty?
   */
  bool get isEmpty => _first==null;
  int get size => _N;

  /**
   * Add the item to the stack.
   */
  void push(Item item) {
    Node oldfirst = _first;
    _first = new Node();
    _first.item = item;
    _first.next = oldfirst;
    _N++;
//    assert check();
  }
  
  /**
   * Delete and return the item most recently added to the stack.
   * @throws java.util.NoSuchElementException if stack is empty.
   */
  Item pop() {
    if (isEmpty) 
      throw ("NoSuchElementException Stack underflow");
    Item item = _first.item;        // save item to return
    _first = _first.next;            // delete first node
    _N--;
//    assert check();
    return item;                   // return the saved item
  }
  
  /**
   * Return the item least recently added to the queue.
   * @throws java.util.NoSuchElementException if queue is empty.
   */
  Item peek() {
    if ( isEmpty ) 
      throw ("NoSuchElementException Queue underflow");
    return _first.item;
  }
  
  ListIterator<Item> get iterator {
   return new ListIterator<Item>(_first);
  }
  /*
   *  // check internal invariants
    private boolean check() {
        if (N == 0) {
            if (first != null) return false;
        }
        else if (N == 1) {
            if (first == null)      return false;
            if (first.next != null) return false;
        }
        else {
            if (first.next == null) return false;
        }

        // check internal consistency of instance variable N
        int numberOfNodes = 0;
        for (Node x = first; x != null; x = x.next) {
            numberOfNodes++;
        }
        if (numberOfNodes != N) return false;

        return true;
    } 
   */
  
}

/*
   


   


   /**
     * Return an iterator to the stack that iterates through the items in LIFO order.
     */
    public Iterator<Item> iterator()  { return new ListIterator();  }

    // an iterator, doesn't implement remove() since it's optional
    private class ListIterator implements Iterator<Item> {
        private Node current = first;
        public boolean hasNext()  { return current != null;                     }
        public void remove()      { throw new UnsupportedOperationException();  }

        public Item next() {
            if (!hasNext()) throw new NoSuchElementException();
            Item item = current.item;
            current = current.next; 
            return item;
        }
    }


   /**
     * A test client.
     */
    public static void main(String[] args) {
        Stack<String> s = new Stack<String>();
        while (!StdIn.isEmpty()) {
            String item = StdIn.readString();
            if (!item.equals("-")) s.push(item);
            else if (!s.isEmpty()) StdOut.print(s.pop() + " ");
        }
        StdOut.println("(" + s.size() + " left on stack)");
    }
}*/