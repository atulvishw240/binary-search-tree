require_relative 'lib/tree'

array = [3, 2, 1]
tree = Tree.new(array)

sorted = tree.mergesort(array).uniq
p sorted
node = tree.build_tree(sorted)

tree.pretty_print
