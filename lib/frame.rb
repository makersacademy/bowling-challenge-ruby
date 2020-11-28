class Frame
  attr_reader :total_score

  def initialize
    @rolls = []
    @total_score = 0
  end

  def current_roll_number
    @rolls.length+1
  end

  def pins_knocked
    @rolls.sum
  end

  def input_roll_score(pins)
    @rolls << pins
  end

  def strike?
    return true if @rolls[0] == 10
    return false
  end

  def spare?
    return false if strike?
    return true if @rolls.sum == 10
    return false
  end

  def points_for_strike
    @rolls[0..1].sum
  end

  def points_for_spare
    @rolls[0]
  end

  def add_score(amount)
    @total_score += amount
  end

end
