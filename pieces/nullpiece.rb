require_relative 'piece'
require 'singleton'

class NullPiece < Piece
  include Singleton
  def initialize(color,board, pos)
    super
  end
end
