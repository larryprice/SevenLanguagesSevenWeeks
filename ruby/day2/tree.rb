#! /usr/bin/ruby

class Tree
  attr_accessor :children, :node_name

  def initialize(name, children=[])
    @children = children
    @node_name = name
  end

  def visit_all(&block)
    visit(&block)
    children.each { |c| c.visit_all(&block) }
  end

  def visit(&block)
    block.call self
  end
end

class Tree2 < Tree
  def initialize(data = {})
    @node_name = data.keys.first
    @children = data[@node_name]
  end

  def visit_all(&block)
    visit(&block)
    children.each { |k, v| Tree2.new(k => v).visit_all(&block) }
  end
end

# ruby_tree = Tree.new( "Ruby", [Tree.new("Reia"),
#                                Tree.new("MacRuby")])

ruby_tree = Tree2.new({'grandpa' => {'dad' => {'child 1' => {}, 'child2' => {}},
                        'uncle' => {'child 3' => {}, 'child 4' => {}}}})

puts "Visiting a node"
ruby_tree.visit { |node| puts node.node_name }
puts

puts "Visiting entire tree"
ruby_tree.visit_all { |node| puts node.node_name }
puts
