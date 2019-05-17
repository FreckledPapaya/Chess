require_relative "piece.rb"

class Board

  def self.empty_grid
    Array.new(8) {Array.new(8, Piece.new(nil))}
  end

  def self.populated_grid

  end

  def initialize(grid = Board.empty_grid)
    @grid = grid
  end

  def movie_piece(color, start_pos, end_pos)
    if self[start_pos].value == nil
      raise "There is no piece at the start position"
    elsif #the piece cannot move to end_pos
      raise "Your piece cannot move to this position"
    end

  end


  #helper methods

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, value)
    x, y = pos
    @grid[x][y] = value
  end

  def valid_pos?(pos)
    x, y = pos
    if x >= 0 && x < 8 && y >= 0 && y < 8
      return true
    end
    false
  end

  

end