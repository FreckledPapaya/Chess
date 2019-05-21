require_relative "piece.rb"
require_relative "stepable.rb"

class King < Piece
    include Stepable

    def move_diffs
        [[0, 1], [0, -1], [1, 0], [-1, 0]]
    end
end