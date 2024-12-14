require_relative 'node'
class Tree
  attr_accessor :root

  def initialize(array)
    sorted_array = mergesort(array).uniq
    @root = build_tree(sorted_array, 0, sorted_array.length - 1)
  end

  def build_tree(array, start = 0, last = array.length - 1)
    return nil if start > last

    # Calculate mid index
    # Create root node with this value
    # Traverse the left side recursively
    mid = start + (last - start) / 2
    root = Node.new(array[mid])
    root.left = build_tree(array, start, mid - 1)
    root.right = build_tree(array, mid + 1, last)

    root
  end

  def insert(key, curr_node = root)
    return Node.new(key) if curr_node.nil?

    return curr_node if curr_node.data == key

    if key > curr_node.data
      curr_node.right = insert(key, curr_node.right)
    else
      curr_node.left = insert(key, curr_node.left)
    end

    return curr_node
  end

  def delete(key, curr_node = root)
    # Base case
    return curr_node if curr_node.nil?

    # If key to be searched is in a subtree
    if (key > curr_node.data)
      curr_node.right = delete(key, curr_node.right)
    elsif key < curr_node.data
      curr_node.left = delete(key, curr_node.left)
    else
      # If root matches with the given key

      # Cases when root has 0 children or
      # only right child
      return curr_node.right if curr_node.left.nil?

      return curr_node.left if curr_node.right.nil?

      succ = get_successor(curr_node)
      curr_node.key = succ.key
      curr_node.right = delete(curr_node.right, succ.data)
    end

    curr_node
  end

  def find(key)
    curr_node = root

    while true
      return nil if curr_node.nil?

      if key > curr_node.data
        curr_node = curr_node.right
      elsif key < curr_node.data
        curr_node = curr_node.left
      else
        return curr_node
      end
    end
  end

  # Traverse the tree in bfs order and yield each node to the provided block
  # Implementation : Recursion or Iteration
  # If no block is given Then return array of values
  # You will want to use an array acting as a queue to keep track of the child nodes that you have yet to traverse
  def level_order
    queue = [@root]
    result = []
    until queue.empty?
      node = queue.shift
      block_given? ? yield(node) : result << node.data
      queue << node.left unless node.left.nil?
      queue << node.right unless node.right.nil?
    end
    result unless block_given?
  end

  def inorder(root)
    result = []
    return if root.nil?

    inorder(root.left)
    block_given? ? yield(root) : result << root.data
    inorder(root.right)

    result unless block_given?
  end

  def preorder(root)
    result = []
    return if root.nil?

    block_given? ? yield(root) : result << root.data
    preorder(root.left)
    preorder(root.right)

    result unless block_given?
  end

  def postorder(root)
    result = []
    return if root.nil?

    postorder(root.left)
    postorder(root.right)
    block_given? ? yield(root) : result << root.data

    result unless block_given?
  end

  def height(node)
    # Why this code broke because of a simple return statement (return 0 if node.nil?)
    # return 0 if node.nil?

    # height = 0
    # left = height(node.left)
    # right = height(node.right)

    # if left > right
    #   height = left
    # else
    #   height = right
    # end

    # return height + 1
    return -1 if node.nil?

    height = 0
    left = height(node.left)
    right = height(node.right)

    if left > right
      height = left
    else
      height = right
    end

    return height + 1
  end

  def depth(node)
    depth = 0
    curr_node = root
    until curr_node.nil?
      if node.data > curr_node.data
        curr_node = curr_node.right
        depth += 1
      elsif node.data < curr_node.data
        curr_node = curr_node.left
        depth += 1
      else
        return depth
      end
    end

    -1
  end

  def is_left?(node)
    return false if node.left.nil?

    true
  end

  def is_right?(node)
    return false if node.right.nil?

    true
  end

  def mergesort(array)
    # Sort the left half
    # Sort the right half
    # merge
    return array if array.length == 1

    first = 0
    last = array.length - 1
    mid = first + (last - first) / 2

    left_array = mergesort(array[first..mid])
    right_array = mergesort(array[mid+1..last])

    return merging(left_array, right_array)
  end
 
  def merging(left_array, right_array)
    i = 0
    j = 0
    k = 0
    array = []
    while i < left_array.length && j < right_array.length
      if left_array[i] > right_array[j]
        array[k] = right_array[j]
        j += 1
        k += 1
      else
        array[k] = left_array[i]
        i += 1
        k += 1
      end
    end

    while i < left_array.length
      array[k] = left_array[i]
      i += 1
      k += 1
    end

    while j < right_array.length
      array[k] = right_array[j]
      j += 1
      k += 1
    end

    return array
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end 
end
