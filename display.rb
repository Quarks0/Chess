require 'colorize'
require_relative 'manifest.rb'
require 'byebug'


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

          if [x,y] == @cursor.selected_pos
            temp_row += " #{@board[[x, y]].value.blue}"
          end

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
  #debugger
  d.board.move([1,3],[2,3])
  d.board.move([0,4],[6,2])
  d.board.move([0,2],[3,5])
  d.render
  p d.board.in_check?(:black)
  p d.board.in_check?(:white)
  p d.board.checkmate?(:black)
end
