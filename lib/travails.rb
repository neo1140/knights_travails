require_relative 'knight'

# Class that builds a graph and uses it to find the shortest path to target
class Travails
  def initialize(root, target)
    @root = Knight.new(root)
    @target = target
    @queue = []
    @array = []
  end

  def build_graph(node = @root)
    node.make_knights
    node.connected_knights.each do |knight|
      if knight.position == @target
        return knight
      else
        build_graph(knight)
      end
    end
  end

  def search(node = @root)
    @array << node.position
    return if node.position == @target
    node.connected_knights.each do |knight|
      search(knight)
    end
    p @array
  end
end
travail = Travails.new([1, 1], [8, 8])
travail.build_graph
travail.search
