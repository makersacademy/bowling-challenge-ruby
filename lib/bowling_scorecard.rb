require_relative 'frame'

class BowlingScorecard

  attr_reader :name, :frames, :current_game

  def initialize(name)
    @name = name
    @frames = []
  end

  def self.start_bowling(name)
    @current_game = BowlingScorecard.new(name)
    @current_game.frames << Frame.new
  end
end