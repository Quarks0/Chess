require_relative 'piece'

class Piece
  attr_reader :color, :board, :pos

  def initialize(color,board,pos)
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

end
