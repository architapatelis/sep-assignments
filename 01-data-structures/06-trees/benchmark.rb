require 'benchmark'
require_relative 'min_binary_heap/node'
require_relative 'binary_tree/node'
require_relative 'binary_tree/binary_search_tree'
require_relative 'min_binary_heap/min_binary_heap'

arr = []
(1..10000).each do |x|
  arr.push(x)
end
shuff_arr = arr.shuffle

# Binary Search Tree:
puts "Inserting binary search tree"
puts Benchmark.measure {
  root = Node.new(shuff_arr[0], shuff_arr[0])
  tree = BinarySearchTree.new(root)
  (1...shuff_arr.size-1).each do |x|
    tree.insert(root, Node.new(shuff_arr[x], shuff_arr[x]))
  end
}

puts "Searching 5000th element in binary search tree"
puts Benchmark.measure {
  root = Node.new(shuff_arr[0], shuff_arr[0])
  tree = BinarySearchTree.new(root)
  (1...shuff_arr.size-1).each do |x|
    tree.insert(root, Node.new(shuff_arr[x], shuff_arr[x]))
  end
  tree.find(root, 5000)
}

puts "Deleting a node"
puts Benchmark.measure {
  root = Node.new(shuff_arr[0], shuff_arr[0])
  tree = BinarySearchTree.new(root)
  (1...shuff_arr.size-1).each do |x|
    tree.insert(root, Node.new(shuff_arr[x], shuff_arr[x]))
  end
  tree.delete(root, 5000)
}

#**************************************

# Min Binary Heap:
puts "Inserting in min binary heap"
puts Benchmark.measure {
  heap = Heap.new
  (1...shuff_arr.size-1).each do |x|
    heap.insert(Node.new(shuff_arr[x], shuff_arr[x]))
  end
}

puts "Searching 5000th element in heap"
puts Benchmark.measure {
  heap = Heap.new
  (1...shuff_arr.size-1).each do |x|
    heap.insert(Node.new(shuff_arr[x], shuff_arr[x]))
  end
  heap.find(5000)
}

puts "Deleting a node"
puts Benchmark.measure {
  heap = Heap.new
  (1...shuff_arr.size-1).each do |x|
    heap.insert(Node.new(shuff_arr[x], shuff_arr[x]))
  end
  heap.delete(5000)
}
