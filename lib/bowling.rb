class Bowling
  def initialize
    @rolls = []
  end

  def roll(pin)
    @rolls << pin
  end

  def score
    total_score = 0
    rolls_index = 0

    10.times do
      if strike? rolls_index
        frame_score = 10 + @rolls[rolls_index + 1] + @rolls[rolls_index + 2]
        total_score += frame_score
        rolls_index += 1
      elsif spare? rolls_index
        frame_score = 10 + @rolls[rolls_index + 2]
        total_score += frame_score
        rolls_index += 2
      else
        frame_score = @rolls[rolls_index] + @rolls[rolls_index + 1]
        total_score += frame_score
        rolls_index += 2
      end
    end
    total_score
  end

  def strike?(rolls_index)
    @rolls[rolls_index] == 10
  end

  def spare?(rolls_index)
    @rolls[rolls_index] + @rolls[rolls_index + 1] == 10
  end
end
