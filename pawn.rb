require_relative "piece.rb"

class Pawn < Piece
  attr_accessor :moved

  def initialize(color, board)
    super
    @moved = false
    #update @moved to true when placing a pawn
  end

  def moves
    options = []
    case color
    when :B
      move_dirs.each do |dir|
        x, y = dir
        options << [pos[0] + x, pos[1]]
      end
    when :W
      move_dirs.each do |dir|
        x, y = dir
        options << [pos[0] - x, pos[1]]
      end
    end
    options.select{|position| valid_pos?(position)}
  end

  def move_dirs
    case @moved
    when false
      return [[1, 0], [2, 0]]
    when true
      return [[1, 0]]
    end
  end
  
  
end