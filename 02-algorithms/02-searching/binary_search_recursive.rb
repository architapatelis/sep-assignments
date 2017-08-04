# write a working recursive version of binary search, save it in a file named binary_search_recursive.rb.

# alphabets = ["A", "B", "C", "D", "E", "F", "G"]

def binary_search_recursive(array, value, low = 0, high = nil)
  if high == nil
    high = array.length - 1
  end

  while low <= high
    mid = ((low + high)/2).floor
    if array[mid] < value
      low = mid + 1
      binary_search_recursive(array, value, low, high)
    elsif array[mid] > value
      high = mid - 1
      binary_search_recursive(array, value, low, high)
    else
      return mid
    end
  end
  return "Value Not Found"
end
