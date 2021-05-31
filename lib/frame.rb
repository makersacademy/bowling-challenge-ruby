class Frame
  FRAME_PINS = 10

  def initialize
    @rolls = []
  end

  def roll(pinfall)
    @rolls << pinfall
  end

  def pinfall
    @rolls.reduce(:+)
  end

  def strike?
    @rolls.first == FRAME_PINS
  end

  def spare?
    return false if @rolls.length < 2

    @rolls[0] + @rolls[1] == FRAME_PINS && !strike?
  end
end
