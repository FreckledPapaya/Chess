require "byebug"

HORIZONTAL_DIRS = [[0, 1], [0, -1], [1, 0], [-1, 0]]
DIAGONAL_DIRS = [[1, 1], [1, -1], [-1, 1], [-1, -1]]

module Stepable
    def moves
        options = []

        move_diffs.each do |diff|
            pos_option = new_pos(pos, diff)
            options << pos_option if valid_pos?(pos_option)
        end
        
        options.map! do |position|

            # bug - running #capture_pos? on NullPiece :( 
            if piece_present?(position)
                if capture_pos?(pos)
                    position
                else
                    []
                end
            else
                position
            end
        end

        options.select {|subarr| !subarr.empty?}
    end

    def new_pos(start_pt, diff)
        [start_pt[0] + diff[0], start_pt[1] + diff[1]]
    end

    def piece_present?(end_pos)
        return false if board[*end_pos] == NullPiece
        true
    end

    def capture_pos?(end_pos)
        self.color != board[*end_pos].color
    end
end