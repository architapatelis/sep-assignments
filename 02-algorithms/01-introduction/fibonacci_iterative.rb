def fib(n)
  fib_array = []
  fib_array[0] = 0
  fib_array[1] = 1

  (2..n).each do |i|
    fib_array[i] = fib_array[i - 1] + fib_array[i - 2]
  end
  fib_array[n]
end



#tests:
puts fib(0)
puts fib(1)
puts fib(2)
puts fib(3)
puts fib(4)
puts fib(5)
puts fib(6)
puts fib(7)
puts fib(8)
puts fib(9)
puts fib(10)
