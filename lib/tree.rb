class Tree
  attr_accessor :root

  def initialize(array)
    @root = build_tree(array)
  end

  private
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
end
