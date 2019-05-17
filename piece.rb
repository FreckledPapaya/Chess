
class Piece
  attr_reader :value

  def initialize #(color, board, pos)
    @value = "P"
    # @color = color
    # @board = board
    # @pos = pos
  end

  def inspect
    self.value
  end

  def valid_moves?
    #return array
    []
  end
end