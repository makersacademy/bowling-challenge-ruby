class Score
attr_reader :roll1, :roll2, :bonus
  def initialize
    @bonus_score = 0
    @bonus_score_previous = 0
  end

  def save_roll(roll1, roll2, bonus)
    @roll1 = roll1
    @roll2 = roll2
    @bonus = bonus
  end

  def calculate(roll1, roll2, bonus)
    @bonus_score_previous = roll1 if @add_bonus == true
    unless @bonus == 0 || @bonus == nil
      calculate_bonus(roll1, roll2)
    else
      @bonus_score = 0
    end
    save_roll(roll1, roll2, bonus)
    roll2 == nil ? score = roll1 : score = (roll1 + roll2)
    return score, @bonus_score, @bonus_score_previous
  end

  def calculate_frame10(roll1, roll2, roll3)
    @bonus_score_previous = roll1 if @add_bonus == true
    unless @bonus == 0 || @bonus == nil
      calculate_bonus(roll1, roll2)
    else
      @bonus_score = 0
    end
    roll3 == nil ? score = (roll1 + roll2) : score = (roll1 + roll2 + roll3)
    return score, @bonus_score, @bonus_score_previous
  end

  def calculate_bonus(roll1, roll2)
    if roll2 != nil
      calculate_bonus_2_rolls(roll1, roll2)
    else
      calculate_bonus_1_roll(roll1)
    end
  end

  def calculate_bonus_2_rolls(roll1, roll2)
    if @bonus == 1
      @bonus_score = roll1
      @add_bonus = false
    else @bonus_score = (roll1 + roll2)
      @add_bonus = false
    end
  end

  def calculate_bonus_1_roll(roll1)
    if @bonus == 1
      @bonus_score = roll1
    else
      @bonus_score = roll1
      @add_bonus = true
    end
  end
end
