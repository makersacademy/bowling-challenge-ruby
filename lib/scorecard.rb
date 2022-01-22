require_relative 'frame'

class Scorecard

  attr_reader :frames

  def initialize
    @frames = []
  end

  def add_frame(roll1, roll2)
    raise InvalidScoreError if score_invalid?(roll1, roll2)

    frame = Frame.new(roll1: roll1, roll2: roll2)

    @frames << { "frame #{@frames.size + 1}" => {
     "roll1" => frame.roll1, "roll2" => frame.roll2}} unless game_over?
  end

  private

  def score_invalid?(roll1, roll2)
    roll1 + roll2 > 10 || roll1 + roll2 < 0
  end

  def game_over?
    @frames.length == 10
  end

end

class InvalidScoreError < StandardError
end
