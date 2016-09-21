require_relative 'piece'
require_relative 'steppingpiece'

class Knight < Piece
  include SteppingPiece

  def initialize(color,board, pos)
    super
  end

  def value
    color == :white ? "♞" : "♘"
  end

  def move_diffs()
    return SteppingPiece::KNIGHT
  end
end
