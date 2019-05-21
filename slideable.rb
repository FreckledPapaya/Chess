module Stepable
    def moves
        options = []

        move_diffs.each do |diff|
            options << [pos[0] + diff[0], pos[1] + diff[1]]
        end
        options
    end
end