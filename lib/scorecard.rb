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
      if @rolls[roll_index] == 10
        result += @rolls[roll_index] + @rolls[roll_index + 1] + @rolls[roll_index + 2]
        roll_index += 1
      elsif spare?(roll_index)
        result += spare_score(roll_index)
        roll_index +=2
      else
        result += frame_score(roll_index)
        roll_index +=2
      end
    end
    result 
  end

  private

  def frame_score(roll_index)
    @rolls[roll_index] + @rolls[roll_index + 1]
  end

  def spare?(roll_index)
    frame_score(roll_index) == 10 
    # may need to rethink this to account for strike logic to be implemented
  end

  def spare_score(roll_index)
    frame_score(roll_index) + @rolls[roll_index + 2]
    # may need to rethink this to account for strike logic to be implemented
    #although that should rely on roll(pins) == 10, not frame_score
  end

end
