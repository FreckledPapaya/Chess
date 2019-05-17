require_relative "piece.rb"

class Board

  def self.empty_grid
    Array.new(8) {Array.new(8, NullPiece.new)}
  end

  def self.populated_grid
    rows = Array.new(8) {Array.new(8)}
    white = Array.new(8, Piece.new) #back pieces
    black = Array.new(8, Piece.new)

    rows.each_with_index do |row, i|
      if i == 0
        rows[i] = white
      elsif i == 1
        8.times {rows[i] << Piece.new} #white pawns
      elsif i == 6
        8.times {rows[i] << Piece.new} #black pawns
      elsif i == 7
        rows[i] = black
      else
        8.times {rows[i] << NullPiece.new}
      end
    end

  def initialize(rows = Board.empty_grid)
    @rows = rows
    @sentinel = NullPiece.new
  end

  def movie_piece(color, start_pos, end_pos)
    moving_piece = self[start_pos]
    valid_moves = moving_piece.valid_moves

    if moving_piece.is_a?(NullPiece)
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