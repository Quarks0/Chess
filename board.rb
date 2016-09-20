require_relative "piece"

class Board


  attr_reader :grid

  def initialize
    BACK_ROW = [Rook.new(:b,self,[0,0]), Knight.new(:b,self,[1,0]), Bishop.new, King.new,Queen.new, Bishop.new,Knight.new,Rook.new]
    FRONT_ROW = Array.new(8, Pawn.new)
    EMPTY_ROWS = Array.new(4) {Array.new(8, Piece.new)}
    @grid = create_board
  end

  def [](pos)
    x,y = pos
    return @grid[x][y]
  end

  def []=(pos, val)
    x,y = pos
    @grid[x][y] = val
  end

  def move(startpos, endpos)
    raise ArgumentError if self[startpos].is_a?(NullPiece)
    self[endpos], self[startpos] = self[startpos], self[endpos]
  end

  #TODO: Board#in_bounds Method for cursor
  def in_bounds(pos)
    x,y = pos
    if x >= @grid.length || x < 0
      return false
    elsif y >= @grid.length || y < 0
      return false
    end
    return true
  end

  private

  def create_board
    result = []
    result << BACK_ROW
    result << FRONT_ROW
    result += EMPTY_ROWS
    result << FRONT_ROW
    result << BACK_ROW.reverse
    result
  end



end
