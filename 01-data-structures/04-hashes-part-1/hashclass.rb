class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  # operator overloading
  # use the index operator '[]' to insert/write a value for a particular key
  # if there isn't a item at the index, then add the item hash to that index
  # elsif there is an item already at the index AND the keys don't match, then resize
  # elsif the keys are the same, but values are different:
  # only value gets posted at index, otherwise if you try to post a new hash object, it would lead to infinite collision and expansion.
  def []=(key, value)
    item = HashItem.new(key, value)
    i = index(key, size()) #index

    if @items[i].nil?
      @items[i] = item
    elsif @items[i].key != item.key
      self.resize
      self[key] = value # Recursive call to []=(key, value)
    elsif @items[i].value != item.value # values are different
      self.resize
      @items[index(item.key, size)] = value
    end
  end

  # use the index operator '[]' to lookup/read a value for a particular key
  def [](key)
    i = index(key, size())
    if @items[i]
      @items[i].value
    end
  end

  # in case of collision double the size of the array
  def resize
    # Create a temporary array by copying original array and removing nil elements
    temp_array = @items.compact

    # Double the size of original array
    @items = Array.new(self.size * 2)
    temp_array.each { |item| self[item.key] = item.value }
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    sum = 0
    key.each_byte do |c|
      sum += c
    end
    sum % size
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

end
