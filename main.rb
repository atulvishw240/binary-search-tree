require_relative 'lib/tree'

array = [4, 15, 35]
tree = Tree.new(array)

tree.pretty_print

tree.insert(40)
tree.insert(50)
tree.insert(60)
tree.insert(70)
tree.insert(80)

tree.pretty_print
puts tree.height(tree.root)

node = Node.new(100)
p tree.depth(node)
