require 'matrix'
# Class that generates a chessboard
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

# Class that contains a knights position, and the legal moves that knight can make
class Knight
  attr_reader :position, :legal_moves
  def initialize(position = [1,1])
    @position = position
    @moves = [[1, 2], [1, -2], [-1, 2], [-1, -2],
              [2, 1], [2, -1], [-2, 1], [-2, -1]]
    @board = Board.new.board
    @legal_moves = gen_moves
    @connected_knights = []
  end

# Generates list of legal moves
  def gen_moves
    array = []
    @moves.each do |move|
      if @board.include?((Vector[*move] + Vector[*@position]).to_a)
      array << (Vector[*move] + Vector[*@position]).to_a
      end
    end
    array
  end

  # Generates new knights based on legal moves
  def more_knights
    @legal_moves.each do |move|
      knight = Knight.new(move)
      @connected_knights << knight
    end
  end
end

knight = Knight.new
