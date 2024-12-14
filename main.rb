require_relative 'lib/tree'

array = [4, 15, 35]
tree = Tree.new(array)

sorted = tree.mergesort(array).uniq
p sorted
node = tree.build_tree(sorted)

tree.pretty_print

tree.insert(30)
tree.insert(40)
tree.insert(2)
tree.insert(8)

tree.pretty_print

tree.delete(2)
tree.delete(30)

tree.pretty_print

level_order { |node| puts node }
tree.level_order(&my_block)
