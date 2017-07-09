class MyStack
  attr_accessor :top, :stack

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    index = stack.length
    stack[index] = item
    @top = stack.last
  end

  def pop
    item_to_pop = @top
    if !empty?
      stack.delete_at(stack.length - 1)
      @top = stack.last
    end
    return item_to_pop
  end

  def empty?
    stack.length == 0
  end

end
