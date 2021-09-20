require_relative 'board.rb'

class Knight
  def initialize(position, parent = nil)
    @position = position
    @parent = parent
  end
end
