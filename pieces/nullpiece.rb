require 'singleton'

class NullPiece
  include Singleton

  def empty?
    true
  end

  def color
    return nil
  end

  def value
    "_"
  end
end
