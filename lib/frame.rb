class Frame
  attr_reader :rolls, :strike, :spare, :bonus

  def initialize
    @rolls = []
    @strike = false
    @spare = false
    @bonus = []
  end

  def update_roll(current_roll, pins_knocked_down)
    @rolls[current_roll - 1] = pins_knocked_down
    if current_roll == 1 && pins_knocked_down == 10
      @strike = true
      @rolls[1] = 0
    end
  end

  def add_bonus(current_frame, prev_frame1 = 'not entered')
    if @strike == true
      if prev_frame1 == 'not entered' && current_frame.strike == false
        @bonus << current_frame.rolls[0]
        @bonus << current_frame.rolls[1]
      elsif prev_frame1.instance_of? Frame
        @bonus << prev_frame1.rolls[0]
        @bonus << current_frame.rolls[0]
      end
    end
  end
end