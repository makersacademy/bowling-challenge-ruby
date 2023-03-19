class Frame
  attr_reader :rolls

  def initialize
    @rolls = []
  end

  def add_roll(pins)
    @rolls << pins
  end

  def score
    @rolls.sum
  end

  def strike?
    @rolls.first == 10
  end

  def spare?
    @rolls.sum == 10 && @rolls.first != 10
  end

  def strike_bonus(roll_index)
    if @rolls.length > roll_index + 2
      @rolls[roll_index + 1] + @rolls[roll_index + 2]
    else
      0
    end
  end

  def spare_bonus(roll_index)
    if @rolls.length > roll_index + 1
      @rolls[roll_index + 1]
    else
      0
    end
  end

  def complete?
    @rolls.length == 2 || strike?
  end

end
