require_relative "piece.rb"
# require_relative "null_piece.rb"
require "byebug"

class Board
  attr_reader :rows

  def self.empty_grid
    Array.new(8) {Array.new(8, NullPiece)}
  end
  
  def initialize
    @rows = populate
    @sentinel = NullPiece
  end
  
  def populate
    rows = Array.new(8) {Array.new}
    white = Array.new(8, Piece.new(:W, self)) #back pieces
    black = Array.new(8, Piece.new(:B, self))

    rows.each_with_index do |row, i|
      if i == 0
        rows[i] = white
      elsif i == 1
        8.times {rows[i] << Piece.new(:W, self)} #white pawns
      elsif i == 6
        8.times {rows[i] << Piece.new(:B, self)} #black pawns
      elsif i == 7
        rows[i] = black
      else
        8.times {rows[i] << NullPiece}
      end
    end
    @rows = rows

    update_positions

    rows
  end

  def update_positions 
    rows.each_with_index do |subarr, row|
      subarr.each_with_index do |piece, col|
        next if piece == NullPiece
        piece.pos = [row, col]
      end
    end
    true
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