# frozen_string_literal: trues

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

  def turn(ball1, ball2=0, ball3=0)
    
    if @frames.size < MAX_FRAMES

      raise InvalidScoreError if score_invalid?(ball1, ball2)

      if ball1 == MAX_PINS
        @frames << [ball1]
      else
        @frames << [ball1, ball2]
      end

    end
  end

 

  private

  def score_invalid?(ball1, ball2)
    ball1 + ball2 > MAX_PINS || (ball1 + ball2).negative?
  end

  def final_frame_score_invalid?(roll1, roll2, roll3)
    (roll1 + roll2 + roll3) > THREE_STRIKES || (roll1 + roll2 + roll3).negative? || roll3.positive? && (roll1 + roll2) < MAX_PINS
  end

  def current_frame
    @frames[-1]
  end

  def previous_frame
    @frames[-2]
  end

  def check_for_spare_bonus
    if (previous_frame['roll1'] + previous_frame['roll2']) == MAX_PINS && previous_frame['roll1'] < MAX_PINS
      @bonus_score += current_frame['roll1']
    end
  end

  def check_for_strike_bonus
    if previous_frame['roll1'] == MAX_PINS 
      @bonus_score += (current_frame['roll1'] + current_frame['roll2'])
    end
  end

  def first_frame?
    @frames.length <= 1
  end

  def final_frame?
    @frames.length == MAX_FRAMES
  end

end

class InvalidScoreError < StandardError
end
