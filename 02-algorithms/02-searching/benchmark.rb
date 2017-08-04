require 'benchmark'
require_relative 'fibonnaci_recursive'
require_relative 'fibonacci_iterative'
require_relative 'binary_search_recursive'
require_relative 'binary_search_iterative'

numbers = []
(1..1000000).each do |num|
  numbers.push(num)
end

p "Fibonnaci Recursive"
puts Benchmark.measure {
  fib_recursive(20)
}

p "Fibonnaci Iterative"
puts Benchmark.measure {
  fib_iterative(20)
}

p "Binary Search Recursive"
puts Benchmark.measure {
  binary_search_recursive(numbers, 888777)
}

p "Binary Search Iterative"
puts Benchmark.measure {
  binary_search_iterative(numbers, 888777)
}
