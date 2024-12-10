require_relative 'lib/tree'

array = [33, 45, 65]
tree = Tree.new(array)

sorted = tree.mergesort(array).uniq
p sorted
node = tree.build_tree(sorted)

tree.pretty_print

tree.insert(23)
tree.insert(7)
tree.insert(12)
tree.insert(14)
tree.insert(19)
tree.insert(23)
tree.insert(36)

tree.pretty_print
