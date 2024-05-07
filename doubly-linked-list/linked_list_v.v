module linked_list
// an attempt at implimenting a linked list in the v language

pub struct Linked_List{
	mut:
		tail &Node
		head &Node
		length int

}

struct Node[T]{
	value T
	next &Node
	prev &Node
}

pub fn (l Linked_List)len(){
	//getter
	return l.length
}

pub fn (l Linked_List)push<T>(value T){
	x := Node{
		value : value
		prev : l.tail
		}
	l.tail.next = x
	l.tail = x
	l.length += 1
}
pub fn (l Linked_List)pop() [T]{
//returns value of last node and deletes it
	x := Node{
	value : tail.value
	prev : tail.prev
	next : }
}
