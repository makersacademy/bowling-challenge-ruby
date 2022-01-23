# frozen_string_literal: true

require_relative 'frame'

### check iphone for method

class Scorecard
  attr_reader :frames, :total_score, :bonus_score

  MAX_FRAMES = 10
  MAX_PINS = 10
  THREE_STRIKES = 30

  def initialize
    @frames = []
    @total_score = 0
    @bonus_score = 0
  end

  def add_frame(roll1, roll2, roll3 = 0)
    if @frames.size < 9
      raise InvalidScoreError if score_invalid?(roll1, roll2)
      frame = Frame.new(roll1: roll1, roll2: roll2)

      @frames << {'roll1' => frame.roll1, 'roll2' => frame.roll2}
    else
      unless game_over?
        raise InvalidScoreError if final_frame_score_invalid?(roll1, roll2, roll3)
        @frames << { 'frame 10' => { 'roll1' => roll1,
                                     'roll2' => roll2, 'roll3' => roll3 } }
      end
    end
  end

  private

  def score_invalid?(roll1, roll2)
    roll1 + roll2 > MAX_PINS || (roll1 + roll2).negative?
  end

  def final_frame_score_invalid?(roll1, roll2, roll3)
    roll1 + roll2 + roll3 > THREE_STRIKES || (roll1 + roll2 + roll3).negative? || roll3.positive? && (roll1 + roll2) < MAX_PINS
  end

  def game_over?
    @frames.length == MAX_FRAMES
  end


end

class InvalidScoreError < StandardError
end

x = Scorecard.new
9.times do
  x.add_frame(3, 2)
end
x.add_frame(10, 0, 10)
puts x.frames 