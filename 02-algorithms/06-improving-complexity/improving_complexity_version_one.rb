def code_optimizations(*arrays)
  combined_array = []
  # 1: Combining arrays can be accomplished by one loop
  arrays.each do |array|
   combined_array += array
  end

  # 2 Use the Built-in pop() to remove the last element in combined_array
  sorted_array = [combined_array.pop]

  # 3 replace the for loop, with a until statement that will stop once the condition is true
  until combined_array.length == 0
    # 4 Built-in shift() sets the first item from combined_array to value to insert into sorted_array.
    val = combined_array.shift
    i = 0
    until i == sorted_array.length || val < sorted_array[i] # This iterates through sorted_array until the item that is greater than the insert value is found or end of array is reached
      i += 1
    end
    sorted_array.insert(i, val) # When val is less than the compared sorted_array value, it is inserted
  end

  # Return the sorted array
  sorted_array
end
