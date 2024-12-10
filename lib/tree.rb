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

    return root
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
