require_relative "piece.rb"
require_relative "stepable.rb"

class King < Piece
    include Stepable

    def move_diffs
       HORIZONTAL_DIRS + DIAGONAL_DIRS
    end
end