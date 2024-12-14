require_relative 'lib/tree'

# Create array of random numbers
array = Array.new(15) { rand(1..100) }
p array

# Create Tree
tree = Tree.new(array)
puts tree.balanced?

