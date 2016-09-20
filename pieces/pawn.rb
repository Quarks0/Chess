require_relative 'piece'

class Pawn < Piece
  def initialize(color,board, pos)
    super
  end

  def value
    color == :white ? "♟" : "♙"
  end
  
  def moves()

  end
end
