require 'byebug'
require_relative 'piece'

class Pawn < Piece
  def initialize(color,board, pos)
    super
  end

  def value
    color == :white ? "♟" : "♙"
  end

  def moves()
    result = []
    x, y = @pos
    dx, dy = foward_dir
    x += dx
    y += dy
    new_pos = [x,y]

    if @board.in_bounds(new_pos) && @board[new_pos].empty?
      result << new_pos
      x += dx
      if at_start_row? && @board[[x,y]].empty?
        result << [x,y]
      end
    end

    result += side_attacks

    return result
  end

  def at_start_row?
    x,y = @pos
    if @color == :white && x == 1
      return true
    elsif @color == :black && x == 6
      return true
    end
    false
  end

  def foward_dir
    if @color == :white
      return [1,0]
    else
      return [-1,0]
    end
  end

  def foward_steps

  end

  def side_attacks
    result = []
    if @color == :white
      attacks = [[1,1], [1,-1]]
    else
      attacks = [[-1,1], [-1,-1]]
    end

    attacks.each do |attack|
      x, y = @pos
      d_x, d_y = attack
      x += d_x
      y += d_y
      result << [x,y] unless !@board.in_bounds([x,y]) || @board[[x,y]].empty?  
    end

    result
  end
end
