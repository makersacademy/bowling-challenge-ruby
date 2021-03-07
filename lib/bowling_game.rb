require_relative 'frame'

class BowlingGame

TOTAL_PINS = 10
MAX_NUMBER_OF_ROLLS = 21

attr_reader :number_of_rolls

  def initialize
    @total_score = 0
    @number_of_rolls = 0
    @rolls = []
  end

  def roll(pins, frame = Frame.new)
    fail "Invalid score, please try again." if pins > TOTAL_PINS
      if pins == 10
        @frame = frame
        @frame.add_to_frame(10)
        @frame.add_to_frame(0)
        @rolls << frame
        @number_of_rolls += 2
      elsif @number_of_rolls.even?
        @frame = frame
        @frame.add_to_frame(pins)
        @number_of_rolls += 1
      else
        @frame.add_to_frame(pins)
        @rolls << @frame
        @number_of_rolls += 1
      end
  end

  def score
    @rolls.each_with_index do |frame, index|
      if frame.strike?
        @total_score += frame.total + @rolls[index + 1].total
      elsif frame.spare?
        @total_score += frame.total + @rolls[index + 1].first_roll
      else
        @total_score += frame.total
      end
    end
    @total_score
  end

  def game_over?
    self.number_of_rolls > MAX_NUMBER_OF_ROLLS
  end
end

#will create a private method that calculates the scores
