class Frame
  def initialize(number)
    @number = number
    @rolls = []
    @bonus = 0
    @score = 0
    @total_score = 0
  end

  def add_roll(pins)
    rolls << pins
  end

  def add_bonus(bonus)
    @bonus += bonus
  end

  def strike?
    rolls.sum == 10 && rolls.length == 1
  end

  def spare?
    rolls.sum == 10 && rolls.length == 2
  end

  def complete?
    if number == 9
      rolls.length == 3
    else
      strike? || rolls.length == 2
    end
  end

  def first_roll_score
    rolls[0]
  end

  def second_roll_score
    rolls[1]
  end

  def total_score(prior_score)
    @total_score = score + prior_score
  end

  private

  attr_reader :rolls, :number, :bonus

  def score
    rolls.sum + @bonus
  end
end
