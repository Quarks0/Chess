require_relative 'piece'
require_relative 'steppingpiece'

class King < Piece
  include SteppingPiece
  def initialize(color,board, pos)
    super
  end

  def value
    color == :white ? "♚" : "♔"
  end

  def move_diffs
    return SteppingPiece::STRAIGHT+SteppingPiece::DIAGONAL
  end
end
