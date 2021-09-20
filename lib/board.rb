# Class that generates a chess board to ensure knights only make legal moves
class Board
  attr_reader :board
  def initialize
    @board = []
    8.times do
      (1..8).each do |num|
        array = []
        array << num
        @board << array
      end
    end
    @board.sort!
    num = 1
    @board.map do |space|
      num = 1 if num > 8
      space << num
      num += 1
    end
  end
end
