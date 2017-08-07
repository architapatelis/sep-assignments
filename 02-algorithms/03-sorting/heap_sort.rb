def heap_sort(collection)
  if collection.length <= 1
    return collection
  else
    heapify(collection)
    end_ = (collection.length - 1)
    while end_ > 0
      collection[end_], collection[0] = collection[0], collection[end_]
      end_ -= 1
      sift_down(collection, 0, end_)
    end
    return collection
  end
end

# create a max heap order using heapify
def heapify(collection)
  # start is the first parent node
  start = (collection.length - 2) / 2
  #from start to root '0'
  while start >= 0
    sift_down(collection, start, collection.length - 1)
    start -= 1
  end
  collection
end

def sift_down(collection, start, end_)
  root = start
  loop do
    child = root * 2 + 1
    break if child > end_
    #if left child is less than right child
    # then compare root with right child
    if child + 1 <= end_ && collection[child] < collection[child + 1]
      child += 1
    end
    #if root is less than child swap, so as to create max heap order
    if collection[root] < collection[child]
      collection[root], collection[child] = collection[child], collection[root]
      root = child
    else
      break
    end
  end
end
