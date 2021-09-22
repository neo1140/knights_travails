require_relative 'board'
# class for generating knight objects for a graph
class Knight
  attr_reader :moves, :parent, :connected_knights, :position
  @@knight_positions = []

  def initialize(position, parent = nil)
    @position = position
    @parent = parent
    @board = Board.new
    @connected_knights = []
    @moves = []
    moves_gen
    @knight_history = []
    @@knight_positions.each { |knight| @knight_history << knight }
  end

  def self.knight_positions
    @@knight_positions
  end

  # adding all the legal moves to the moves array
  def moves_gen
    move_one
    move_two
    move_three
    move_four
    move_five
    move_six
    move_seven
    move_eight
  end

  # adding all logic to determine which moves are legal
  def move_one
    move_one = []
    move_one << @position[0]
    move_one << @position[1]
    move_one[0] += 1
    move_one[1] += 2
    @moves << move_one if @board.board.include?(move_one)
  end

  def move_two
    move_two = []
    move_two << @position[0]
    move_two << @position[1]
    move_two[0] += 2
    move_two[1] += 1
    @moves << move_two if @board.board.include?(move_two)
  end

  def move_three
    move_three = []
    move_three << @position[0]
    move_three << @position[1]
    move_three[0] -= 1
    move_three[1] += 2
    @moves << move_three if @board.board.include?(move_three)
  end

  def move_four
    move_four = []
    move_four << @position[0]
    move_four << @position[1]
    move_four[0] += 1
    move_four[1] -= 2
    @moves << move_four if @board.board.include?(move_four)
  end

  def move_five
    move_five = []
    move_five << @position[0]
    move_five << @position[1]
    move_five[0] -= 2
    move_five[1] -= 1
    @moves << move_five if @board.board.include?(move_five)
  end

  def move_six
    move_six = []
    move_six << @position[0]
    move_six << @position[1]
    move_six[0] -= 1
    move_six[1] -= 2
    @moves << move_six if @board.board.include?(move_six)
  end

  def move_seven
    move_seven = []
    move_seven << @position[0]
    move_seven << @position[1]
    move_seven[0] -= 2
    move_seven[1] += 1
    @moves << move_seven if @board.board.include?(move_seven)
  end

  def move_eight
    move_eight = []
    move_eight << @position[0]
    move_eight << @position[1]
    move_eight[0] += 2
    move_eight[1] -= 1
    @moves << move_eight if @board.board.include?(move_eight)
  end

  # Uses legal moves to create new knight objects
  def make_knights(target)
    @moves.each do |move|
      break if @knight_history.include?(target) || @knight_history.include?(move)

      knight = Knight.new(move, self)
      @connected_knights << knight unless knight.nil?
      @@knight_positions << knight.position unless knight.nil?
    end
  end
end
