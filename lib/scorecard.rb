# frozen_string_literal: trues
class Scorecard
  attr_reader :frames, :total_score, :bonus_score

  MAX_FRAMES = 10
  MAX_PINS = 10
  THREE_STRIKES = 30
  FINAL_FRAME = 9

  def initialize
    @frames = []
    @total_score = 0
    @bonus_score = 0
  end

  def turn(ball1, ball2=0, ball3=0)
    unless game_over?

      if final_frame?
        raise InvalidScoreError if final_frame_score_invalid?(ball1, ball2, ball3)
        @frames << [ball1, ball2, ball3]

      else
        raise InvalidScoreError if score_invalid?(ball1, ball2)
        if ball1 == MAX_PINS
          @frames << [ball1]
        else
          @frames << [ball1, ball2]
        end
        
      end
      calculate_score
    end
  end


  def calculate_score
    if first_frame? || final_frame?
      @total_score += current_frame.sum 
    else
      check_for_bonus 
      @total_score += current_frame.sum + @bonus_score
      @bonus_score = 0
    end
  end

  private

  def check_for_bonus 
    # consecutive-strike
    if current_frame[0] == MAX_PINS && previous_frame[0] == MAX_PINS 
      @bonus_score += current_frame.sum + previous_frame.sum
    # strike
    elsif previous_frame[0] == MAX_PINS 
      @bonus_score += current_frame.sum 
    #spare
    elsif previous_frame.sum == MAX_PINS 
      @bonus_score += current_frame[0]
    end
  end


  def score_invalid?(ball1, ball2)
    ball1 + ball2 > MAX_PINS || (ball1 + ball2).negative?
  end

  def final_frame_score_invalid?(ball1, ball2, ball3)
    (ball1 + ball2 + ball3) > THREE_STRIKES || (ball1 + ball2 + ball3).negative? || ball3.positive? && (ball1 + ball2) < MAX_PINS
  end

  def current_frame
    @frames[-1]
  end

  def previous_frame
    @frames[-2]
  end

  def first_frame?
    @frames.length <= 1
  end

  def final_frame?
    @frames.length == FINAL_FRAME
  end

  def game_over?
    @frames.length == MAX_FRAMES
  end
end

class InvalidScoreError < StandardError
end
