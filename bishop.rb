require_relative "piece.rb"
require_relative "slideable.rb"

class Bishop < Piece
    include Slideable
    def move_dirs
        DIAGONAL_DIRS 
    end
end