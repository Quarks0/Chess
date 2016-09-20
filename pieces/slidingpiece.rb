
module SlidingPiece
  STRAIGHT = [
    [1,0],
    [-1,0],
    [0,1],
    [0,-1]
  ]

  DIAGONAL = [
    [1,1],
    [1,-1],
    [-1,-1],
    [-1,1]
  ]

  def moves()
    result = []
    new_pos = @pos
    move_dirs.each do |direction|
      x, y = @pos
      dx, dy = direction
      x += dx
      y += dy
      new_pos = [x,y]
      while @board.in_bounds(new_pos)
          result << new_pos
          x += dx
          y += dy
          break unless @board[new_pos].empty?
          new_pos = [x,y]
      end
    end
    return result
  end

  def move_dirs()
  end
end
