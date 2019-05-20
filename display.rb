require "colorize"
require_relative "cursor.rb"

class Display
    attr_reader :board

    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0], board)
    end

    def render
        puts "  #{(0..7).to_a.join(" ")}"
        board.rows.each_with_index do |row, i|
            this_row = []
            row.each do |piece|
                if piece == NullPiece
                    this_row << "_"
                else
                    this_row << piece.value
                end
            end
            puts "#{i} #{this_row.join(" ")}"
        end
    end
end