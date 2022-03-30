class Frame
  attr_reader :rolls, :strike, :spare, :bonus

  NOT_REQUIRED = 'not required'

  def initialize
    @rolls = []
    @strike = false
    @spare = false
    @bonus = []
  end

  def update_roll(current_roll, pins_knocked_down)
    @rolls[current_roll - 1] = pins_knocked_down
    @strike = true if current_roll == 1 && pins_knocked_down == 10
    @spare = true if current_roll == 2 && @rolls.sum == 10
  end

  def add_bonus(current_frame, prev_frame1 = NOT_REQUIRED)
    if @strike == true
      if prev_frame1 == NOT_REQUIRED && current_frame.strike == false
        @bonus << current_frame.rolls[0]
        @bonus << current_frame.rolls[1]
      elsif prev_frame1.instance_of? Frame
        @bonus << prev_frame1.rolls[0]
        @bonus << current_frame.rolls[0]
      end
    elsif @spare == true
      @bonus << current_frame.rolls[0]
    end
  end

  def final_round_bonus(pins_knocked_down)
    @bonus << pins_knocked_down if @strike == true && @bonus.length < 2
    @bonus << pins_knocked_down if @spare == true && @bonus.length < 1 
  end
end