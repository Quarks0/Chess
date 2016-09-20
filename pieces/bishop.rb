require_relative 'piece'
require_relative 'slidingpiece'

class Bishop < Piece
  include SlidingPiece
  def initialize(color,board, pos)
    super
  end

  def value
    color == :white ? "♝" : "♗"
  end

  def move_dirs()
    return SlidingPiece::DIAGONAL
  end
end
