
class Piece
  attr_reader :value

  def initialize(value, color)
    @value = value
    @color = color
  end

  def inspect
    self.value
  end
end