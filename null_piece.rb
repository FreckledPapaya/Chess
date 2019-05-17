class NullPiece < Piece

  def initialize
    @value = "nil"
  end

  def inspect
    self.value
  end
end