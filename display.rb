require 'colorize'
require_relative 'cursor'
require_relative 'board'
require_relative 'piece'

class Display
    attr_reader :board

    def initialize(board)
      @board = board
      @cursor = Cursor.new([0,0],board)
    end

    def render
      system("clear")
      @board.grid.each_with_index do |row,y|
        temp_row = ""
        row.each_with_index do |col,x|
          pos = [x,y]

          if [x,y] == @cursor.cursor_pos
            temp_row +=  " #{@board[[x, y]].value.red}"
          else
            temp_row += " #{@board[[x, y]].value}"
          end

        end
        puts temp_row
      end
    end

    def make_move
      while 1 < 2
      render
      @cursor.get_input
      end
    end
end

if __FILE__ == $PROGRAM_NAME
  d = Display.new(Board.new)
  d.make_move
end
