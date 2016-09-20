require 'singleton'
require_relative 'board'

class Piece
  attr_reader :color, :board, :pos

  def initialize(color,board=Board.new,pos)
    @color = color
    @board = board
    @pos = pos
  end

  def value
    "_"
  end

  def empty?(pos)
    @board[pos].is_a?(NullPiece)
  end

  def moves()
  end
end

module SlidingPiece

  def initialize
    super
  end

  def moves()
    result = []
    new_pos = @pos
    move_dirs.each do |direction|
      x, y = @pos
      dx, dy = direction
      x += dx
      y += dy
      new_pos = [x,y]
      while @board.in_bounds(new_pos) && @board[new_pos].empty?
        result << new_pos
        x += dx
        y += dy
        new_pos = [x,y]
      end
    end
    return result
  end

  def move_dirs()
  end
end

class SteppingPiece < Piece
  def initialize
    super
  end
end

class NullPiece < Piece
  def initialize
    super
  end
end

class Bishop < SlidingPiece
  def initialize
    super
  end

  def value
     "b"
  end

  def move_dirs()

  end
end

class King < Piece
  def initialize
    super
  end

  def value
   "K"
  end
end

class Knight < Piece


  def value
   "Kn"
  end
end

class Pawn < Piece


  def value
   "P"
  end
  def moves()

  end
end

class Queen < Piece

  def value
   "Q"
  end

  def move_dirs()

  end
end

class Rook < Piece
  include SlidingPiece

  def value
   "R"
  end

  def move_dirs()
    return [[1,0],[-1,0],[0,1],[0,-1]]
  end
end
