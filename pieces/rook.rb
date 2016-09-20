

class Rook < Piece
  include SlidingPiece

  def initialize(color,board, pos)
    super
  end

  def value
   color == :white ? "♜" : "♖"
  end

  def move_dirs()
    return SlidingPiece::STRAIGHT
  end
end
