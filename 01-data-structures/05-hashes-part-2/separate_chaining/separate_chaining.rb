require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @max_load_factor = 0.7
    @items = Array.new(size)
    @item_count = 0
  end

  # Insert Method
  def []=(key, value)
    node = Node.new(key, value)
    i = self.index(key, self.size)
    linked_list = @items[i]
    if linked_list.nil?
      linked_list = LinkedList.new
      @items[i] = linked_list
    end
    linked_list.add_to_tail(node)
    @item_count += 1
    if self.load_factor > @max_load_factor
      resize
    end
  end

  def [](key)
    i = index(key, self.size)
    if !@items[i].nil?
      node = @items[i].serach_node(key)
      if !node.value.nil?
        return node.value
      end
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Calculate the current load factor
  def load_factor
    @item_count/self.size.to_f
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    # Create a temporary array by copying original array and removing nil elements
    temp_array = @items.compact

    # Double the size of original array
    @items = Array.new(self.size * 2)
    @item_count = 0
    temp_array.each do |linked_list|
      while linked_list.size > 0
        node = linked_list.remove_front
        self[node.key] = node.value # call []=(key, value)
      end
    end
  end

  def print_items
    (0...size()).each do |i|
      if @items[i] != nil
        @items[i].print
        puts "index: #{i}"
      end
    end
    puts "load factor: #{load_factor()}"
  end

end
