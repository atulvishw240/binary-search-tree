require_relative 'lib/tree'
require_relative 'lib/node'

# Create array of random numbers
array = Array.new(15) { rand(1..100) }
p array.sort.uniq

# Create Tree
tree = Tree.new(array)

tree.pretty_print

# Inorder, Preorder & Postorder traversal
tree.inorder(tree.root) do |node|
  print "#{node.data} "
end

puts ""

tree.preorder(tree.root) do |node|
  print "#{node.data} "
end

puts ""

tree.postorder(tree.root) do |node|
  print "#{node.data} "
end

puts ""

# Unbalance the tree
tree.insert(120)
tree.insert(150)
tree.insert(180)
tree.insert(200)

# Print tree and check if it's balanced
tree.pretty_print
puts tree.balanced?

# Rebalance the tree
tree.rebalance
puts tree.balanced?
tree.pretty_print

# Inorder, Preorder & Postorder traversal
tree.inorder(tree.root) do |node|
  print "#{node.data} "
end

puts ""

tree.preorder(tree.root) do |node|
  print "#{node.data} "
end

puts ""

tree.postorder(tree.root) do |node|
  print "#{node.data} "
end

puts ""
