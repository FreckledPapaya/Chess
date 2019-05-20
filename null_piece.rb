require "singleton"

class NullPiece < Piece
  attr_reader :value
  
  include Singleton
  def initialize
    @value = nil
  end
  
end