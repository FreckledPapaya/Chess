require "colorize"
require_relative "cursor.rb"
require_relative "board.rb"

class Display
    attr_reader :board, :cursor

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

    #THIS COLORIZE BIT STILL NEED FIXING
            if cursor.cursor_pos[0] == row
                col = cursor.cursor_pos[1]
                puts "#{i} #{this_row[0...col].join(" ")} " + "#{this_row[col]}".red + " #{this_row[col+1..-1].join(" ")}"
            else
                puts "#{i} #{this_row.join(" ")}"
            end
        end
        true
    end
end

b = Board.new(Board.populate)
d = Display.new(b)