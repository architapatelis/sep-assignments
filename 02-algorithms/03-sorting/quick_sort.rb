# p = pivot
# r = right most element in the array
# q = index of where the pivot ends up
def quick_sort(collection, p=0, r=collection.length - 1 )
  if p < r
    q = partition(collection, p, r)
    #sort the sub-arrays
    quick_sort(collection, p, q-1)
    quick_sort(collection, q+1, r)
  end
  return collection
end

def partition(collection, p, r)
  q = p
  (p...r).each do |j|
    if collection[j] <= collection[r]
      swap(collection, q, j)
      q += 1
    end
  end
  swap(collection, q, r)
  return q
end

def swap(collection, first_index, second_index)
  temp = collection[first_index]
  collection[first_index] = collection[second_index]
  collection[second_index] = temp
end
