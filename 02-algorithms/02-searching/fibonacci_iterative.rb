
def fib_iterative(n)
  fib_array = []
  fib_array[0] = 0
  fib_array[1] = 1

  (2..n).each do |i|
    fib_array[i] = fib_array[i - 1] + fib_array[i - 2]
  end
  fib_array[n]
end
