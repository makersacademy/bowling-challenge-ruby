class Frame

  attr_reader :number, :rolls

  def initialize(num)
    @number = num
    @rolls = []
  end

  def add_roll(pins)
    raise "This frame is completed" if completed?

    rolls << pins
  end

  def completed?
    if number < 10
      rolls.length == 2 || rolls[0] == 10

    elsif rolls[0, 2].sum < 10
      rolls.length == 2
    else
      rolls.length == 3
    end
  end

  def owed_rolls
    strike? ? 2 : spare? ? 1 : 0
  end

  private #---------------------------------------

  def strike?
    rolls[0] == 10
  end

  def spare?
    rolls.sum == 10
  end

end
