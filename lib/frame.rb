class Frame
  attr_reader :rolls, :strike, :spare, :bonus

  def initialize
    @rolls = []
    @strike = false
    @spare = false
    @bonus = 0
  end

  def update_roll(current_roll, pins_knocked_down)
    @rolls[current_roll - 1] = pins_knocked_down
    if current_roll == 1 && pins_knocked_down == 10
      @strike = true
      @rolls[1] = 0
    end
  end

  def add_bonus(current_frame)
    if @strike == true
      @bonus = current_frame.rolls.sum
    end
  end
end