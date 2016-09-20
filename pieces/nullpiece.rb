require 'singleton'

class NullPiece
  include Singleton

  def empty?
    true
  end

  def value
    "_"
  end
end
