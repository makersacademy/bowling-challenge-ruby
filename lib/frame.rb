class Frame
  attr_reader :rolls, :strike, :spare

  def initialize
    @rolls = []
    @strike = false
    @spare = false
  end

  def update_roll(current_roll, pins_knocked_down)
    @rolls[current_roll - 1] = pins_knocked_down
    if current_roll == 1 && pins_knocked_down == 10
      @strike = true
      @rolls[1] = 0
    end
  end
end