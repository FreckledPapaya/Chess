
class Piece
  attr_reader :value

  def initialize(color, board, pos)
    @value = nil
    @color = color
    @board = board
    @pos = pos
  end

  def inspect
    self.value
  end
end