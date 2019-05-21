require "singleton"
require_relative "piece.rb"

class NullPiece
  attr_reader :value
  
  include Singleton

  def initialize
    @value = nil
  end

  def moves
    []
  end
  
end