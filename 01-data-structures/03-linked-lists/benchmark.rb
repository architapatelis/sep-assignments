require 'benchmark'
require_relative 'node'
require_relative 'linked_list'

array = []
llist = LinkedList.new

Benchmark.bm do |bm|
  #10000 elements long Array
  bm.report("Create Array: ") do
    (0...10000).each do |x|
      array[x] = Node.new(x)
    end
  end

  #Create 10000 nodes
  bm.report("Create Nodes: ") do
    (0...10000).each do |x|
      llist.add_to_tail(Node.new(x))
    end
  end

  #Access the 5000th element in array
  bm.report("Get element: ") do
    array[4999]
  end

  #Access the 5000th node
  bm.report("Get node: ") do
    current_node = llist.head
    (1..4999).each do |x|
      current_node = current_node.next
    end
  end

  #Delete the 5000th element in array
  bm.report("Delete element: ") do
    array.delete_at(4999)
  end

  bm.report("Delete Node: ") do
    current_node = llist.head
    (1...4999).each do |x|
      current_node = current_node.next
    end
    llist.delete(current_node)
  end
end
