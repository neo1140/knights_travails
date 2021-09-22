require_relative 'knight'

# Class that builds a graph and uses it to find the shortest path to target
class Travails
  def initialize(root, target)
    @root = Knight.new(root)
    @target = target
    @target_node = nil
    @sequence = []
  end

  def build_graph(node = @root)
    node.make_knights(@target)
    if node.connected_knights.empty?
      return
    else
      node.connected_knights.each do |knight|
          build_graph(knight)
        end
    end
  end

  def search(node = @root)
    if node.position == @target
      @target_node = node
      return
    else
      node.connected_knights.each { |knight| search(knight) }
    end
  end

  def move_sequence(node = @target_node)
    @sequence.unshift(node.position)
    if node.parent == nil
      puts "The move sequence is #{@sequence}"
      return
    else
      move_sequence(node.parent)
    end
  end
end
travail = Travails.new([1, 1], [8, 8])
travail.build_graph
travail.search
travail.move_sequence
