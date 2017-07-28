require_relative 'node'

class Heap
  attr_accessor :heap_list, :current_size

  def initialize
    @heap_list = [0]
    @current_size = 0
  end

  def insert(data)
    @heap_list.push(data)
    @current_size += 1
    perc_up(@current_size)
  end

  def perc_up(i)
    while (i / 2).floor > 0
      if @heap_list[i].rating < @heap_list[(i / 2).floor].rating
        tmp = @heap_list[(i / 2).floor]
        @heap_list[(i / 2).floor] = @heap_list[i]
        @heap_list[i] = tmp
      end
      i = (i / 2).floor
    end
  end

  def delete(data)
    node = find(data)
    if node
      i = @heap_list.index(node)
      node_to_delete = @heap_list[i]
      @heap_list[i] = @heap_list[@current_size]
      @current_size -= 1
      @heap_list.pop()
      perc_down(i)
      return node
    end
  end

  def perc_down(i)
    while (i * 2) <= @current_size
      min_child = min_child(i)
      if @heap_list[i].rating > @heap_list[min_child].rating
        temp = @heap_list[i]
        @heap_list[i] = @heap_list[min_child]
        @heap_list[min_child] = temp
      end
      i = min_child
    end
  end

  def min_child(i)
    if (i * 2) + 1 > @current_size
      return i * 2
    else
      if @heap_list[i*2].rating < @heap_list[(i*2) +1].rating
        return i * 2
      else
        return (i * 2) + 1
      end
    end
  end

  def find(data)
    @heap_list.each do |node|
      if node != 0 && !node.nil?
        if node.title == data
          return node
        end
      end
    end
    return nil
  end

  def print
    @heap_list.each do |node|
      unless node == 0 || node == nil
        puts "#{node.title}: #{node.rating}"
      end
    end

  end
end
