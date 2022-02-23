class Scoreboard
  def initialize(rolls)
    @rolls = rolls
  end

  def score
    index = 0
    score = 0
    10.times do
      if strike?(index)
        score += 10 + strike_bonus_points(index)
      elsif spare?(index)
        score += 10 + spare_bonus_points(index)
      else
        score += regular_points(index)
      end
      strike?(index) ? index += 1 : index += 2
    end
    score
  end

  def strike?(index)
    true if @rolls[index] == 10
  end

  def spare?(index)
    true if @rolls[index] + @rolls[index + 1] == 10
  end

  def strike_bonus_points(index)
    @rolls[index + 1] + @rolls[index + 2]
  end

  def spare_bonus_points(index)
    @rolls[index + 2]
  end

  def regular_points(index)
    @rolls[index] + @rolls[index + 1]
  end

end
