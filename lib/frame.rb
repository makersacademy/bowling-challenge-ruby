class Frame
  attr_reader :number, :rolls, :bonus

  def initialize(number)
    @number = number
    @rolls = []
    @bonus = 0
  end

  def add_roll(pins)
    @rolls << pins
  end

  def add_bonus(bonus)
    @bonus += bonus
  end
end
