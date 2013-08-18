library queue;
import "dart:collection";
import "shared.dart";
/**
 *  The <tt>Queue</tt> class represents a first-in-first-out (FIFO)
 *  queue of generic items.
 *  It supports the usual <em>enqueue</em> and <em>dequeue</em>
 *  operations, along with methods for peeking at the top item,
 *  testing if the queue is empty, and iterating through
 *  the items in FIFO order.
 *  <p>
 *  All queue operations except iteration are constant time.
 *  <p>
 *  For additional documentation, see <a href="http://algs4.cs.princeton.edu/13stacks">Section 1.3</a> of
 *  <i>Algorithms, 4th Edition</i> by Robert Sedgewick and Kevin Wayne.
 */
class Queue<Item> extends Object with IterableMixin<Item> {
  int _N; // number of elements in bag
  Node _first;
  Node _last;
  /**
   * Create an empty queue.
   */
  Queue() {
    _first = null;
    _last  = null;
    _N = 0;
    //assert check();
  }
  /**
   * Is the queue empty?
   */
  bool get isEmpty => _first==null;
  int get size => _N;
  
  /**
   * Return the item least recently added to the queue.
   * @throws java.util.NoSuchElementException if queue is empty.
   */
  Item peek() {
    if ( isEmpty ) 
      throw ("NoSuchElementException Queue underflow");
    return _first.item;
  }
  /**
   * Add the item to the queue.
   */
  void enqueue(Item item) {
    Node oldlast = _last;
    _last = new Node();
    _last.item = item;
    _last.next = null;
    if (isEmpty)
      _first = _last;
    else
      oldlast.next = _last;
    _N++;
    //assert check();
  }
  
  /**
   * Remove and return the item on the queue least recently added.
   * @throws java.util.NoSuchElementException if queue is empty.
   */
  Item dequeue() {
    if (isEmpty) 
      throw ("NoSuchElementException Queue underflow");
    Item item = _first.item;
    _first = _first.next;
    _N--;
    if (isEmpty) 
      _last = null;   // to avoid loitering
    //assert check();
    return item;
  }
  /**
   * Return string representation.
   
  String toString() {
    String s ="";
    //while (this)
    /*for (Item item : this)
      s+=(item + " ");*/
   return s;
    
  }*/
  /*
   * // check internal invariants
    private boolean check() {
        if (N == 0) {
            if (first != null) return false;
            if (last  != null) return false;
        }
        else if (N == 1) {
            if (first == null || last == null) return false;
            if (first != last)                 return false;
            if (first.next != null)            return false;
        }
        else {
            if (first == last)      return false;
            if (first.next == null) return false;
            if (last.next  != null) return false;

            // check internal consistency of instance variable N
            int numberOfNodes = 0;
            for (Node x = first; x != null; x = x.next) {
               numberOfNodes++;
            }
            if (numberOfNodes != N) return false;

            // check internal consistency of instance variable last
            Node lastNode = first;
            while (lastNode.next != null) {
               lastNode = lastNode.next;
            }
            if (last != lastNode) return false;
        }

        return true;
    } */
  
  /*
   * /**
     * Return an iterator that iterates over the items on the queue in FIFO order.
     */
    public Iterator<Item> iterator()  {
        return new ListIterator();  
    }

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
   */
  ListIterator<Item> get iterator {
   return new ListIterator<Item>(_first);
  }
}

/*class Node<Item> extends Object {
  Item item;
  Node next;
}

 



   

   



    
 

   


   /**
     * A test client.
     */
    public static void main(String[] args) {
        Queue<String> q = new Queue<String>();
        while (!StdIn.isEmpty()) {
            String item = StdIn.readString();
            if (!item.equals("-")) q.enqueue(item);
            else if (!q.isEmpty()) StdOut.print(q.dequeue() + " ");
        }
        StdOut.println("(" + q.size() + " left on queue)");
    }
}*/
