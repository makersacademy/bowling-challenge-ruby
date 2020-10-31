class Frame
  attr_reader :rolls

  def initialize(rolls: [], bonus_rolls: [], number:)
    @rolls = rolls
    @bonus_rolls = bonus_rolls
    @number = number
  end

  def roll(n)
    if @rolls.length < 2
      @rolls.push(n)
    else
      @bonus_rolls.push(n)
    end
  end

  def pins
    @rolls.sum
  end

  def strike?
    @rolls.first == 10
  end

  def spare?
    pins == 10 && !strike?
  end

  def next_roll_1(next_frame_1 = nil)
    if @number == 10
      @bonus_rolls[0]
    else
      next_frame_1.rolls[0]
    end
  end
end
