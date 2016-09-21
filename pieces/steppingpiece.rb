module SteppingPiece
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

  KNIGHT = [
    [2,-1],
    [2,1],
    [-2,-1],
    [-2,1],
    [1,-2],
    [1,2],
    [-1,-2],
    [-1,2]
  ]

  def moves()
    result = []
    new_pos = @pos
    move_diffs.each do |direction|
      x, y = @pos
      dx, dy = direction
      x += dx
      y += dy
      new_pos = [x,y]
      if @board.in_bounds(new_pos)
        result << new_pos
      end
    end
    return result
  end

  def move_diffs()
  end
end
