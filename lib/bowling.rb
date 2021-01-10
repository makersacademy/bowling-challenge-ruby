class Bowling

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
      if strike?(roll_index)
        result += strike_score(roll_index)
        roll_index += 1
      elsif spare?(roll_index)
        result += spare_score(roll_index)
        roll_index += 2
      else
        result += frame_score(roll_index)
        roll_index += 2
      end
    end
    result
  end

private 

def strike?(roll_index)
  @rolls[roll_index].to_i == 10
end

def strike_score(roll_index)
  @rolls[roll_index].to_i + @rolls[roll_index + 1].to_i + @rolls[roll_index + 2].to_i
end

def spare?(roll_index)
  @rolls[roll_index].to_i + @rolls[roll_index + 1].to_i == 10
end

def spare_score(roll_index)
  @rolls[roll_index].to_i + @rolls[roll_index + 1].to_i + @rolls[roll_index + 2].to_i
end

def frame_score(roll_index)
  @rolls[roll_index].to_i + @rolls[roll_index + 1].to_i
end


end
