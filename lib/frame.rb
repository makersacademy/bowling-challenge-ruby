class Frame
  attr_reader :rolls, :strike, :spare

  def initialize
    @rolls = []
    @strike = false
    @spare = false
  end

  def update_roll(current_roll, pins_knocked_down)
    @rolls[current_roll - 1] = pins_knocked_down
  end
end