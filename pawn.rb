require_relative "piece.rb"

class Pawn < Piece
  def initialize
    super Piece
    @moved = false
  end
  
end