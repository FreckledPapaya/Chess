require "singleton"
require_relative "piece.rb"

class NullPiece < Piece
  include Singleton

  def initialize
    
  end

  def symbol
    :_
  end

  def moves
    []
  end
  
end