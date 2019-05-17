require_relative "piece.rb"

class Board

  def self.empty_grid
    Array.new(8) {Array.new(8, Piece.new(nil))}
  end

  def self.populated_grid

  end

  def initialize(grid = Board.empty_grid)
    @rows = grid
    @sentinel = NullPiece.new
  end

  def movie_piece(color, start_pos, end_pos)
    moving_piece = self[start_pos]
    valid_moves = moving_piece.valid_moves
    if moving_piece.value == nil #moving_piece.is_a?(NullPiece)
      raise "There is no piece at the start position"
    elsif !valid_moves.include?(end_pos)
      raise "Your piece cannot move to this position"
    end

  end


  #helper methods

  def [](pos)
    x, y = pos
    @rows[x][y]
  end

  def []=(pos, value)
    x, y = pos
    @rows[x][y] = value
  end

  def valid_pos?(pos)
    x, y = pos
    if x >= 0 && x < 8 && y >= 0 && y < 8
      return true
    end
    false
  end

  

end