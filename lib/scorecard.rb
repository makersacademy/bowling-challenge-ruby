class Scorecard

  attr_accessor :rolls

  def initialize
    @rolls = []
  end

  def roll(pins)
    @rolls << pins
  end

  def score
    result = 0
    roll_index = 0
    10.times do
      if spare?(roll_index)
        result += spare_score(roll_index)
      else
        result += frame_score(roll_index)
      end
      roll_index +=2
    end
    result 
  end

  private

  def frame_score(roll_index)
    @rolls[roll_index] + @rolls[roll_index + 1]
  end

  def spare?(roll_index)
    frame_score(roll_index) == 10
  end

  def spare_score(roll_index)
    frame_score(roll_index) + @rolls[roll_index + 2]
  end

end
