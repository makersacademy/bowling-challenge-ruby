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

  def raw_score
    rolls.sum
  end

end
