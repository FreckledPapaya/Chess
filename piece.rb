require_relative "board.rb"

class Piece
  attr_reader :value, :color, :board
  attr_accessor :pos

  def initialize(color, board)
    @color = color
    @board = board
    @pos = [0,0] #change to pos
  end

  def symbol
    :P
  end

  def inspect
    self.symbol
  end

  def valid_moves?
    #return array
    []
  end

  def valid_pos?(pos)
    board.valid_pos?(pos)
  end
end