require_relative 'board.rb'

# class for generating knight objects for a graph
class Knight
  attr_reader :moves
  def initialize(position, parent = nil)
    @position = position
    @parent = parent
    @board = Board.new
    @connected_knights = []
    @moves = []
    moves
  end

  def moves
    move_one
    move_two
    move_three
    move_four
    move_five
    move_six
    move_seven
    move_eight
  end

  def move_one
    move_one = @position
    move_one[0] += 1
    move_one[1] += 2
    p move_one
    @moves << move_one if @board.board.include?(move_one)
  end

  def move_two
    move_two = @position
    move_two[0] += 2
    move_two[1] += 1
    @moves << move_two if @board.board.include?(move_two)
  end

  def move_three
    move_three = @position
    move_three[0] -= 1
    move_three[1] += 2
    @moves << move_three if @board.board.include?(move_three)
  end

  def move_four
    move_four = @position
    move_four[0] += 1
    move_four[1] -= 2
    @moves << move_four if @board.board.include?(move_four)
  end

  def move_five
    move_five = @position
    move_five[0] -= 2
    move_five[1] -= 1
    @moves << move_five if @board.board.include?(move_five)
  end

  def move_six
    move_six = @position
    move_six[0] -= 1
    move_six[1] -= 2
    @moves << move_six if @board.board.include?(move_six)
  end

  def move_seven
    move_seven = @position
    move_seven[0] -= 2
    move_seven[1] += 1
    @moves << move_seven if @board.board.include?(move_seven)
  end

  def move_eight
    move_eight = @position
    move_eight[0] += 2
    move_eight[1] -= 1
    @moves << move_eight if @board.board.include?(move_eight)
  end
end

knight = Knight.new([3,3])
p knight.moves
