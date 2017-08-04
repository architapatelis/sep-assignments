# write a working iterative version of binary search, save it in a file named binary_search_iterative.rb.
#alphabets = ["A", "B", "C", "D", "E", "F", "G"]


def binary_search_iterative(array, value)
  low = 0
  high = array.length - 1

  while low <= high
    mid = ((low + high)/2).floor
    if array[mid] < value
      low = mid + 1
    elsif array[mid] > value
      high = mid - 1
    else
      return mid
    end
  end
  return "Value Not Found"
end
