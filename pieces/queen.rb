
class Queen < Piece
  include SlidingPiece

  def initialize(color,board, pos)
    super
  end

  def value
    color == :white ? "♛" : "♕"
  end

  def move_dirs()
    return SlidingPiece::DIAGONAL+SlidingPiece::STRAIGHT
  end
end
