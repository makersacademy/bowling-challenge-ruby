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

      calculate_score(roll1, roll2)

    else
      unless final_frame?
        raise InvalidScoreError if final_frame_score_invalid?(roll1, roll2, roll3)
        @frames << { 'roll1' => roll1, 'roll2' => roll2, 'roll3' => roll3 }

        calculate_score(roll1, roll2, roll3)
      end
      
    end
  end

  def calculate_score(roll1, roll2, roll3=0)
    if first_frame?
      @total_score += (roll1 + roll2)
    else 
      check_for_strike_bonus
      check_for_spare_bonus
      
      @total_score += (roll1 + roll2) + @bonus_score
      p "bonus score #{bonus_score}" 
      @bonus_score = 0 

      if final_frame? && roll1 + roll2 == 10  
        @total_score += roll3 
      end
    end
  end

  private

  def score_invalid?(roll1, roll2)
    roll1 + roll2 > MAX_PINS || (roll1 + roll2).negative?
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

x = Scorecard.new

9.times do 
  x.add_frame(10, 0)
  puts x.total_score
end

x.add_frame(10, 10, 10)
puts x.total_score


# puts x.total_score

# x.add_frame(1, 4)
# print x.frames[-1]
# x.add_frame(4, 5)
# print x.frames[-1]
# x.add_frame(6, 4)
# print x.frames[-1]
# x.add_frame(5, 5)
# print x.frames[-1]
# x.add_frame(10, 0)
# print x.frames[-1]
# x.add_frame(0, 1)
# print x.frames[-1]
# x.add_frame(7, 3)
# print x.frames[-1]
# x.add_frame(6, 4)
# print x.frames[-1]
# x.add_frame(10, 0)
# print x.frames[-1]
# x.add_frame(2, 8, 6)
# print x.frames[-1]
# puts x.total_score




