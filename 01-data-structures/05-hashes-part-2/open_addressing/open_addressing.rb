require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    node = Node.new(key, value)
    i = index(key, self.size)

    if self.next_open_index(i) == -1
      resize
    end

    if @items[i].nil?
      @items[i] = node
    elsif @items[i].key == key #same key
      @items[i].value = value
    else # collision due to same index value
      j = self.next_open_index(i)
      if j != -1
        @items[j] = node
      else
        resize #reassign existing nodes to new indices
        self[key] = value # now assing "node" to a nil location
      end
    end
  end

  def [](key)
    i = self.index(key, size)
    while i < size
      if @items[i].key == key
        return @items[i].value
      else
        i += 1
      end
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    while @items[index]
      index += 1
    end
    if index >= self.size
      return -1
    else
      return index
    end
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    temp = @items.compact
    @items = Array.new(self.size * 2)
    temp.each { |node| self[node.key] = node.value }
  end

  def load_factor
    x = 0.0
    for i in 0..size-1 do
      if !@items[i].nil?
        x = x + 1
      end
    end
    x / size
  end

  def print_items
    @items.each do |i|
      if i != nil
        index = self.index(i.key, size)
        puts "index: #{index}, #{i.key}: #{i.value}"
      end
    end
    puts "load factor: #{load_factor()}"
  end
end
