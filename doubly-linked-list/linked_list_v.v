module doubly_linked_list

// an attempt at implimenting a linked list in the v language
type returntype = []int | []string | []u8 | int | string | u8

pub struct Linked_List {
mut:
	tail   &Node
	head   &Node
	length int
}

struct Node[T] {
mut:
	next  &Node = unsafe { nil } // unsafe used to declare null pointers when Node created
	prev  &Node = unsafe { nil }
	value T
}

pub fn (l Linked_List) get_head() returntype {
	// returns value of node at head of list
	return l.head.value
}

pub fn (l Linked_List) get_tail() returntype {
	// returns value of node at tail of list
	return l.tail.value
}

pub fn (l Linked_List) len() {
	// getter for list length
	return l.length
}

pub fn (l Linked_List) push[T](value T) {
	// push new value onto rear of list
	if l.length == 0 {
		x := Node{
			value: value
		}
		l.head = x
		l.tail = x
	} else {
		x := Node{
			value: value
			prev: l.tail
		}

		l.tail.next = x
		l.tail = x
		l.length += 1
	}
}

pub fn (l Linked_List) pop() returntype {
	// returns value of last node and deletes it

	if l.length == 0 {
		return error('Cannot pop from an empty list')
	}
	value := l.tail
	if l.length == 1 {
		unsafe {
			l.tail = nil
			l.head = nil
		}
		return value
	} else {
		unsafe {
			l.tail.prev.next = nil
		}
		l.tail = l.tail.prev
	}
}
