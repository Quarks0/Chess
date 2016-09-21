
class Board

  attr_accessor :grid


  def initialize(grid=nil)
    @grid ||= iterate_through_board
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
    raise ArgumentError if self[startpos].move_into_check?(endpos)
    self[endpos], self[startpos] = self[startpos], self[endpos]
    self[endpos].pos = endpos unless self[endpos].empty?
    self[startpos].pos = startpos unless self[startpos].empty?
  end

  def move!(startpos, endpos)
    self[endpos], self[startpos] = self[startpos], self[endpos]
    self[endpos].pos = endpos unless self[endpos].empty?
    self[startpos].pos = startpos unless self[startpos].empty?
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

  def create_board
    back_row = [Rook, Knight, Bishop, King,Queen, Bishop,Knight,Rook]
    front_row = Array.new(8, Pawn)
    empty_row = Array.new(4) {Array.new(8, NullPiece)}

    result = []
    result << back_row
    result << front_row
    result += empty_row
    result << front_row
    result << back_row
    result
  end

  def deep_dup(arr)
      arr.map { |el| el.is_a?(Array) ? deep_dup(el) : el }
  end

  def get_deep_grid
    new_grid = deep_dup(@grid)
    dup = Board.new
    dup.grid = new_grid
    dup
  end

  def in_check?(color)
    king_pos = find_king(color)
    @grid.each_with_index do |row,row_index|
      row.each_with_index do |col,col_index|
        if self[[row_index,col_index]].color != color && self[[row_index,col_index]].color != nil
          return true if self[[row_index,col_index]].valid_moves_alt?.include?(king_pos)
        end
      end
    end
    return false
  end

  def find_king(color)
    @grid.each_with_index do |row,row_index|
      row.each_with_index do |col,col_index|
        return [row_index,col_index] if self[[row_index,col_index]].is_a?(King) && self[[row_index,col_index]].color == color
      end
    end
  end

  def checkmate?(color)
    if in_check?(color)
      @grid.each_with_index do |row,row_index|
        row.each_with_index do |piece,col_index|
          if piece.color == color
            return false if !piece.valid_moves?.empty?
          end
        end
      end
      return true
    end
    false
  end

  def iterate_through_board
    new_board = create_board
    new_board.map!.with_index do |row, row_index|
      row.map.with_index do |piece, col_index|
        color = check_color(row_index)
        if piece != NullPiece
          piece.new(color, self, [row_index,col_index])
        else
          piece.instance
        end
      end
    end
    new_board
  end

  def check_color(row_index)
    if row_index >= 6
      return :black
    end
    return :white
  end




end
