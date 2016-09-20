require 'singleton'

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

  def empty?
    false
  end

  def valid_moves?(moves)
    results = []
    moves.each do |move|
      unless @board[move].color == @color
        results << move
      end
    end
    results
  end

end
