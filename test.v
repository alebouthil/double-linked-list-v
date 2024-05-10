import doubly_linked_list_v as dll

fn main() {
	mut temp := dll.Linked_List[int]{}
	temp.push_rear(10)
	temp.push_rear(20)
	temp.push_rear(30)
	println(temp.to_array())
}
