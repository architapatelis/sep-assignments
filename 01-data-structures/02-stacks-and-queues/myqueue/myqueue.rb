#in the queue head is at index = 0 and tail is at index = array.length - 1
class MyQueue
  attr_accessor :head, :tail, :queue

  def initialize
    @queue = Array.new
    @head = @queue[0]
  end

  def enqueue(element)
    index = queue.length
    queue[index] = element
    @head = queue.first
    @tail = queue.last
  end

  def dequeue
    element_to_dequeue = @head
    if !empty?
      queue.delete_at(0)
      @head = queue.first
      @tail = queue.last
    end
    return element_to_dequeue
  end

  def empty?
    queue.length == 0
  end
end
