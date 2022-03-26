class FinalFrame
  attr_reader :rolls

  def initialize
    @rolls = []
  end

  def ended?
    return false unless made_two_moves?
    return true if pins_are_less_than_10
  end

  def add(roll = Roll.new(pins))
    @rolls << roll
  end

  def score
    if strike?
      10
    else
      roll_points(1) + roll_points(2)
    end
  end

  def bonus_score
    if strike?
      roll_points(2) + roll_points(3)
    elsif spare?
      roll_points(3)
    else
      0
    end   
  end

  def spare?
    strike? ? false : roll_points(1) + roll_points(2) == 10
  end

  def strike?
    no_moves_made? ? false : roll_points(1) == 10
  end

  def roll_points(turn)
    @rolls[turn - 1].pins
  end

  private

  def no_moves_made?
    @rolls.empty?
  end

  def made_two_moves?
    @rolls.length == 2
  end

  def pins_are_less_than_10
    roll_points(1) + roll_points(2) < 10
  end

  def made_three_moves?
    @rolls.length == 3
  end

end
