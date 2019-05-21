module Slideable
    def moves
        options = []

        move_dirs.each do |dir|
            pos_option = pos
            until !valid_pos?(pos_option)
                pos_option = [pos_option[0] + dir[0], pos_option[1] + dir[1]]
                options << pos_option
            end
        end
        options
    end
end