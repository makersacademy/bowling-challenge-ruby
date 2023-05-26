require 'frame'

class ScoreCard
  attr_reader :frames

  def initialize
    @frames = []
    @game_score = 0
  end

  def add_frame
    fail "A game may only consist of 10 frames" if @frames.length == 10

    frame = Frame.new
    frame.frame_number = @frames.length + 1

    @frames << frame
  end

  def roll_current_frame(pins)
    @frames[0].add_roll(pins)

    @frames[0].complete = true if @frames[0].rolls.length == 2 || @frames[0].rolls[0] == 10
  end

  def calculate_game_score
    return @game_score
  end


end
