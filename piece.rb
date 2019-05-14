
class Piece
  attr_reader :name

  def initialize
    @name = "P"
  end

  def inspect
    self.name
  end
end