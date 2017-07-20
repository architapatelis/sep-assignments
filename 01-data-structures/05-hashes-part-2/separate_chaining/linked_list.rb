require_relative 'node'

class LinkedList
  attr_accessor :head, :tail

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if @head == nil # no head exist, so we need to create one
      @head = node
      @tail = @head # both head and tail are same (e.g. n1)
    else
      @tail.next = node # set the pointer (e.g. n1 points to n2)
      @tail = node # then set the new tail value to n2
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    if @head === @tail #if there is only one node
      @head = nil
      @tail = nil
    else # iterate over linked list
      current_node = @head
      # check to see if current_node is not NIL && that the next node is not the tail node
      while ((!current_node.nil?) && (current_node.next != @tail)) do
        current_node = current_node.next
      end
      @tail = current_node
      @tail.next = nil
    end
  end

  # This method prints out a representation of the list.

  def print
    if !@head.nil?
      current_node = @head
      until current_node == tail
      p self.size
        if self.size > 1
          puts "#{current_node.key}: #{current_node.value}"
          current_node = current_node.next
        end
      end
      if current_node == @tail
        puts "#{current_node.key}: #{current_node.value}"
      end
    end
  end


  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
      if !@head.nil?
      if @head === node
        remove_front
      elsif @tail === node
        remove_tail
      else # iterate over the list
        current_node = @head
        while !current_node.nil? && current_node.next != node
          current_node = current_node.next #move to the next node
        end
        if current_node.next == node
          current_node.next = current_node.next.next # skip over the matched node and thereby reset current_node's next node.
        end
      end
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    node.next = @head
    @head = node
    if @tail.nil?
      @tail = node
    end
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    first_node = @head
    if @head === @tail
      @head = nil
      @tail = nil
    elsif !@head.nil?
      @head = first_node.next

      if @head.next.nil? #in case there were only two nodes, and we delete the first one, then new_head_node is also the tail node
        @tail = @head
      end
    end
    return first_node
  end
  
  def size
    length = 0
    if !head.nil?
      length = 1
      current_node = @head
      while current_node != @tail
        current_node = current_node.next
        length += 1
      end
    end
    return length
  end

  def serach_node(key)
    current_node = @head
    while !current_node.nil? && current_node.key != key
      current_node = current_node.next
    end
    current_node
  end
end
