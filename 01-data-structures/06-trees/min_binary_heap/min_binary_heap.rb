require_relative 'node'

class Heap
  attr_reader :root

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    # 1. Insert a new node at the end of Heap.
    # 2. Compare the value of the new child node with its parent.
    # 3. If the value of parent node is greater than child, then swap_with the parent node with the child node.
    inserted = nil
    if root == @root
      children = [root]
    else
      children = root
    end
    next_row = []
    children.each do |child|
      if child.left == nil
        child.left = node
        node.parent = child
        inserted = node
      elsif child.right == nil
        child.right = node
        node.parent = child
        inserted = node
      else
        next_row.push(child.left)
        next_row.push(child.right)
      end
      if inserted
        break
      end
    end
    if inserted
      arrange_node(inserted)
    else
      insert(next_row, node)
    end
  end

  def arrange_node(node)
    if node != @root
      if node.rating < node.parent.rating
        # node's grandparent
        g_par = node.parent.parent if node.parent.parent != nil
        # node's parent
        par = node.parent
        # node's children
        l = node.left
        r = node.right

        # if node's parent has another child
        if par.left == node
          temp_child = node.parent.right
        else
          temp_child = node.parent.left
        end
        if temp_child != nil
          if par.left == node
            node.right = temp_child
          else
            node.left = temp_child
          end
          temp_child.parent = node
        end
        # reconnect node to node's parent
        # sawp smaller child/node with larger parent/root
        if par.left == node
          node.left = par
        else
          node.right = par
        end
        # assign new parent to the par node
        par.parent = node
        # assign new parent to node's children
        l.parent = par if l != nil
        r.parent = par if r != nil
        # assign new children to node's parent
        par.left = l
        par.right = r
        # link node's grandparent to node
        if g_par != nil && g_par.left == par
          g_par.left = node
        end
        if g_par != nil && g_par.right == par
          g_par.right = node
        end
        # link node to node's grandparent
        if g_par == nil
          @root = node
        end
        node.parent = g_par

        arrange_node(node)
      end
    end
  end

  def delete(root, data)
    node_to_del = find(root, data)
    return nil if node_to_del == nil
    swap_with = last_node()
    if swap_with != node_to_del
      # remove relationship to old parent for swap_with node
      if swap_with.parent.right == swap_with
        swap_with.parent.right = nil
      end
      if swap_with.parent.left == swap_with
        swap_with.parent.left = nil
      end
      # link swap_with node to node_to_del's parent
      if node_to_del.parent != nil
        swap_with.parent = node_to_del.parent
        # link node_to_del's parent to swap_with
        if node_to_del.parent.left == node_to_del
          node_to_del.parent.left = swap_with
        else
          node_to_del.parent.right = swap_with
        end
      else
        swap_with.parent = nil
        @root = swap_with
      end
      swap_with.left = node_to_del.left
      swap_with.right = node_to_del.right
      node_to_del.left.parent = swap_with if !node_to_del.left.nil?
      node_to_del.right.parent = swap_with if !node_to_del.right.nil?
      arrange_node(swap_with)
      if (!swap_with.left.nil? && swap_with.rating > swap_with.left.rating) || (!swap_with.right.nil? && swap_with.rating > swap_with.right.rating)
        rearrange(swap_with)
      end
    else
      if node_to_del.parent.left == node_to_del
        node_to_del.parent.left = nil
      else
        node_to_del.parent.right = nil
      end
      node_to_del = nil
    end
  end

  def last_node(children=nil)
    if children == nil
      children = [@root]
    end
    next_row = []
    children.each do |child|
      next_row.push(child.left) if child.left != nil
      next_row.push(child.right) if child.right != nil
    end
    if next_row.size == 0
      return children[-1]
    else
      last_node(next_row)
    end
  end

  def rearrange(node)
    unless node.left.nil?
      if node.right.nil? || node.left.rating < node.right.rating
        swap_with = node.left
        swap_with.left.parent = node if !swap_with.left.nil?
        node.left = swap_with.left
        swap_with.left = node
        swap_with.right.parent = node if !swap_with.right.nil?
        temp = node.right
        node.right = swap_with.right
        swap_with.right = temp
        temp.parent = swap_with
      else
        swap_with = node.right
        temp = node.left
        swap_with.left.parent = node
        swap_with.right.parent = node
        node.right = swap_with.right
        node.left.parent = swap_with
        node.left = swap_with.left
        swap_with.left = temp
        swap_with.right = node
      end

      unless node.parent.nil?
        if node.parent.left == node
          node.parent.left = swap_with
        else
          node.parent.right = swap_with
        end
      else
        @root = swap_with
      end
      swap_with.parent = node.parent
      node.parent = swap_with
      if (!node.left.nil? && node.rating > node.left.rating) || (!node.right.nil? && node.rating > node.right.rating)
        rearrange(node)
      end
    end
  end

  def find(node, data)
    if node == nil
      return nil
    elsif node.title == data
      return node
    else
      right_node = find(node.right, data)
      left_node = find(node.left, data)
      if right_node != nil
        return right_node
      elsif left_node != nil
        return left_node
      else
        return nil
      end
    end
  end

  def print(nodes=nil)
    if nodes == nil
      if @root
        nodes = [@root]
      else
        return nil
      end
    end
    next_row = []
    nodes.each do |node|
      puts "#{node.title}: #{node.rating}"
      next_row.push(node.left) if node.left != nil
      next_row.push(node.right) if node.right != nil
    end
    if next_row.size == 0
      return nil
    else
      print(next_row)
    end
  end
end
