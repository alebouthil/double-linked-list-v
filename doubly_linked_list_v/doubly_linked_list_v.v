module doubly_linked_list_v

pub struct Linked_List[T] {
mut:
	tail   &Node[T] = unsafe { 0 }
	head   &Node[T] = unsafe { 0 }
	length int
}

struct Node[T] {
mut:
	next  &Node[T] = unsafe { 0 } // unsafe used to declare null pointers when Node created
	prev  &Node[T] = unsafe { 0 }
	value T
}

pub fn (l Linked_List[T]) get_head() !T {
	// returns value of node at head of list
	return l.head.value
}

pub fn (l Linked_List[T]) get_tail() !T {
	// returns value of node at tail of list
	return l.tail.value
}

pub fn (mut l Linked_List[T]) len() int {
	// getter for list length
	return l.length
}

pub fn (l Linked_List[T]) is_empty() bool {
	return l.length == 0
}

pub fn (mut l Linked_List[T]) push_rear(value T) {
	// push new value onto rear of list
	if l.is_empty() {
		x := Node[T]{
			value: value
		}
		l.head = &x
		l.tail = &x
		l.length += 1
	} else {
		x := Node[T]{
			value: value
			prev: l.tail
		}
		l.length += 1
		l.tail.next = &x
		l.tail = &x
	}
}
pub fn (mut l Linked_List[T]) push_front(value T) {
	if l.is_empty() {
		x := Node[T]{
			value : value
		}
		l.head = &x
		l.tail = &x
		l.length += 1
	} else {
		x := Node[T]{
			value : value
			next : l.head
		}
		l.length += 1
		l.head.prev = &x
		l.head = &x
	}
}

pub fn (mut l Linked_List[T]) pop_rear() !T {
	// returns value of last node and deletes it

	value := l.tail.value
	if l.length == 1 {
		unsafe {
			l.tail = nil
			l.head = nil
		}
		l.length -= 1
		return value
	} else {
		unsafe {
			l.tail.prev.next = nil
		}
		l.tail = l.tail.prev
		l.length -= 1
		return value
	}
}
pub fn (mut l Linked_List[T]) pop_front() !T{
	//returns value of front node and deletes it
	value := l.head.value
	if l.length == 1 {
		unsafe {
			l.tail = nil
			l.head = nil
		}
		l.length -= 1
		return value
	} else {
		unsafe {
			l.head.next.prev = nil
		}
		l.head = l.head.next
		l.length -= 1
		return value
	}
}
pub fn (l Linked_List[T]) to_array() []T {
	mut array := [l.head.value]
	mut x := l.head.next
	for _ in 0..l.length{
		unsafe {if x == nil {break}}
		array << x.value
		x = x.next
	}
	return array
}
