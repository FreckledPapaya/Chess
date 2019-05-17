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

  def populate_grid
    
  end

  def movie_piece(start_pos, end_pos)

  end


  #helper methods

  def [](num1, num2)
    @grid[num1][num2]
  end

  def valid_pos?(num1,)
  

  end

  

end