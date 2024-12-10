class Node
  include Comparable

  attr_accessor :data

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end

  def <=>(node)
    data <=> node.data
  end
end