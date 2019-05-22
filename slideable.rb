HORIZONTAL_DIRS = [[0, 1], [0, -1], [1, 0], [-1, 0]]
DIAGONAL_DIRS = [[1, 1], [1, -1], [-1, 1], [-1, -1]]


module Slideable
    def moves
        options = []

        move_dirs.each do |dir|
            pos_option = new_pos(pos, dir)
            until !valid_pos?(pos_option) 
                if piece_present?(pos_option)
                    if capture_pos?(pos_option)
                        options << pos_option
                        break
                    else
                        break
                    end
                else
                    options << pos_option
                    pos_option = new_pos(pos_option, dir)
                end
            end
        end

        options
    end

    def new_pos(start_pt, dir)
        [start_pt[0] + dir[0], start_pt[1] + dir[1]]
    end
    
    def piece_present?(end_pos)
        return false if board[*end_pos] == NullPiece
        true
    end

    def capture_pos?(end_pos)
        self.color != board[*end_pos].color
    end
end