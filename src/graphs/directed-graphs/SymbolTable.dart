
/*************************************************************************
 *  Sorted symbol table implementation using a java.util.TreeMap.
 *  Does not allow duplicates.
 *************************************************************************/
/*
import java.util.Iterator;
import java.util.SortedMap;
import java.util.TreeMap;
*/
import "dart:collection";
/**
 *  This class represents an ordered symbol table. It assumes that
 *  the keys are <tt>Comparable</tt>.
 *  It supports the usual <em>put</em>, <em>get</em>, <em>contains</em>,
 *  and <em>remove</em> methods.
 *  It also provides ordered methods for finding the <em>minimum</em>,
 *  <em>maximum</em>, <em>floor</em>, and <em>ceiling</em>.
 *  <p>
 *  The class implements the <em>associative array</em> abstraction: when associating
 *  a value with a key that is already in the table, the convention is to replace
 *  the old value with the new value.
 *  The class also uses the convention that values cannot be null. Setting the
 *  value associated with a key to null is equivalent to removing the key.
 *  <p>
 *  This class implements the Iterable interface for compatiblity with
 *  the version from <em>Introduction to Programming in Java: An Interdisciplinary
 *  Approach</em>.
 *  <p>
 *  This implementation uses a balanced binary search tree.
 *  The <em>put</em>, <em>contains</em>, <em>remove</em>, <em>minimum</em>,
 *  <em>maximum</em>, <em>ceiling</em>, and <em>floor</em> methods take
 *  logarithmic time.
 *  <p>
 *  For additional documentation, see <a href="http://algs4.cs.princeton.edu/35applications">Section 4.5</a> of
 *  <i>Algorithms, 4th Edition</i> by Robert Sedgewick and Kevin Wayne.
 */
class SymbolTable<Key, Value> extends Object with  IterableMixin<Key> {
  SplayTreeMap<Key, Value> _st;
  /**
   * Create an empty symbol table.
   */
  SymbolTable () {
    _st = new SplayTreeMap();
  }
  
  /**
   * Put key-value pair into the symbol table.
   * Overwites old value with new value if key is already in table.
   * Removes key from table if value is null.
   */
  void put(Key key, Value val) {
    if (val == null) 
      _st.remove(key);
    else
      _st[key] = val;
//      _st.putIfAbsent(key, val);
  }
  /**
   * Return the value paired with given key; null if key is not in table.
   */
  Value get(Key key) {
    return _st[key];
  }
  
  /**
   * Delete the key (and paired value) from table.
   * Return the value paired with given key; null if key is not in table.
   */
  Value delete(Key key) {
    return _st.remove(key);
  }
  
  /**
   * Is the key in the table?
   */
  bool contains(Key key) {
    return _st.containsKey(key);
  }
  

  /**
   * How many keys are in the table?
   */
  int get size => _st.length;
  /**
   * Return an <tt>Iterable</tt> for the keys in the table.
   * To iterate over all of the keys in the symbol table <tt>st</tt>, use the
   * foreach notation: <tt>for (Key key : st.keys())</tt>.
   */ 
  Iterable<Key> get keys =>_st.keys;
  
  
  /**
   * Return an <tt>Iterator</tt> for the keys in the table.
   * To iterate over all of the keys in the symbol table <tt>st</tt>, use the
   * foreach notation: <tt>for (Key key : st)</tt>.
   * This method is for backward compatibility with the version from <em>Introduction
   * to Programming in Java: An Interdisciplinary Approach.</em>
   */
  Iterator<Key> get iterator => _st.keys.iterator;
  
  
  /**
   * Return the smallest key in the table.
   */ 
  Key get min => _st.firstKey;

  /**
   * Return the largest key in the table.
   */ 
  Key get max => _st.lastKey;

}