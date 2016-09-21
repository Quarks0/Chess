
class Piece
  attr_accessor :color, :board, :pos

  def initialize(color,board,pos)
    @color = color
    @board = board
    @pos = pos
  end

  # def []=


  def value
    "_"
  end

  def empty?
    false
  end

  def valid_moves?()
    moveset = self.moves
    results = []
    moveset.each do |move|
      unless @board[move].color == @color || move_into_check?(move)
        results << move
      end
    end
    results
  end

  def valid_moves_alt?()    
      moveset = self.moves
      results = []
      moveset.each do |move|
        unless @board[move].color == @color
          results << move
        end
      end
      results
  end

  def move_into_check?(new_pos)
    temp_board = @board.get_deep_grid
    temp_board.move!(@pos, new_pos)
    return temp_board.in_check?(@color)
  end

  def moves
  end
end
