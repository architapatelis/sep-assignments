
require 'benchmark'
require_relative 'bucket_sort'
require_relative 'heap_sort'
require_relative 'quick_sort'


numbers = (1..50).to_a.shuffle!

puts "Quick Sort"
puts Benchmark.measure {
  quick_sort(numbers)
}

numbers.shuffle!

puts "Heap Sort"
puts Benchmark.measure {
  heap_sort(numbers)
}

numbers.shuffle!

puts "Bucket Sort"
puts Benchmark.measure {
  bucket_sort(numbers)
}

numbers.shuffle
