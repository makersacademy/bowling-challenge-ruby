class BowlingGame 

  def initialize
    @rolls = []
    @roll_count = 0
  end

  def roll(pins)
    raise "Game Over!" if game_over?
    @rolls << pins
    if pins == 10 
      @roll_count += 2
    else 
      @roll_count += 1
    end
  end

  def score
    result = 0
    if strike?
      result += 10 + (@rolls[1] + @rolls[2]) * 2
    elsif spare?
      result += 10 + @rolls[2] * 2 
    else
      result = @rolls.sum
    end
    result
  end 

  def spare?
    @rolls[0] + @rolls[1] == 10
  end

  def strike? 
    @rolls[0] == 10
  end

  def game_over?
    @rolls.length >= 20 
  end

  def roll_count 
    @roll_count
  end
end

