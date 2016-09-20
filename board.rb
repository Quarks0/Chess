Dir["/Users/appacademy/Desktop/Chess/pieces/*.rb"].each {|file| require file}

class Board



  attr_reader :grid


  def initialize
    @grid = iterate_through_board
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
    back_row = [Rook, Knight, Bishop, King,Queen, Bishop,Knight,Rook]
    front_row = Array.new(8, Pawn)
    empty_row = Array.new(4) {Array.new(8, NullPiece)}

    result = []
    result << back_row
    result << front_row
    result += empty_row
    result << front_row
    result << back_row.reverse
    result
  end

  def iterate_through_board
    new_board = create_board
    new_board.map!.with_index do |row, row_index|
      row.map.with_index do |piece, col_index|
        color = check_color(row_index)
        piece.new(color, self, [row_index, col_index])
      end
    end
    new_board
  end

  def check_color(row_index)
    if row_index >= 2 && row_index < 6
      return nil
    elsif row_index >= 6
      return :black
    end
    return :white
  end



end
