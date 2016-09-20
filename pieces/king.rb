require_relative 'piece'

class King < Piece
  #include SteppingPiece
  def initialize(color,board, pos)
    super
  end

  def value
    color == :white ? "♚" : "♔"
  end
end
