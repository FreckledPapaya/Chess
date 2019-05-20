require_relative "piece.rb"
require_relative "null_piece.rb"

class Board
  attr_reader :rows

  def self.empty_grid
    Array.new(8) {Array.new(8, NullPiece)}
  end

  def self.populate
    rows = Array.new(8) {Array.new}
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
        8.times {rows[i] << NullPiece}
      end
    end
  end

  def initialize(rows = Board.empty_grid)
    @rows = rows
    @sentinel = NullPiece
  end

  def move_piece(color, start_pos, end_pos)
    moving_piece = self[start_pos]
    # valid_moves = moving_piece.valid_moves

    if !valid_pos?(start_pos) || !valid_pos?(end_pos)
      raise "Invalid position; choose coordinates between 0 and 7"
    elsif moving_piece.is_a?(NullPiece)
      raise "There is no piece at the start position"
    # elsif !valid_moves.include?(end_pos)
    #   raise "Your piece cannot move to this position"
    end

    self[start_pos] = @sentinel
    self[end_pos] = moving_piece
    return true
  end


  #helper methods

  def [](x, y)
    # x, y = pos
    @rows[x][y]
  end

  def []=(x, y, value)
    # x, y = pos
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