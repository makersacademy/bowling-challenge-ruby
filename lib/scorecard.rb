class Scorecard

  attr_accessor :rolls

  def initialize
    @rolls = []
  end

  def roll(pins)
   raise 'Error: only 10 pins per frame' if pins > 10
    @rolls << pins
  end

  def score
    result = 0
    roll_index = 0
    frame = 1

    10.times do
      if strike?(roll_index)
        result += strike_score(roll_index)
        roll_index += 1
      elsif spare?(roll_index)
        result += spare_score(roll_index)
        roll_index +=2
      else
        result += frame_score(roll_index)
        roll_index +=2
      end
      frame += 1
    end
    # gameover?(frame)
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

  def strike?(roll_index)
    @rolls[roll_index] == 10
  end

  def strike_score(roll_index)
    @rolls[roll_index] + @rolls[roll_index + 1] + @rolls[roll_index + 2]
  end

  # def gameover?(frame)
  #   return 0 if frame > 10
  # end

end
