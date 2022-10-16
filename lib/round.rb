class Round
    attr_accessor :round_pins, :strike, :spare

  def initialize
    @round_pins = []
    @strike = false
    @spare = false
    @counter = 1
  end

  def add_pins(pins_knocked)
    @round_pins << pins_knocked
    @strike = true if @round_pins[0] == 10
    if @counter == 2
      if (@round_pins[0] + @round_pins[1]) == 10
        @spare = true 
      end
      @counter = 0
    end
    @counter += 1
  end
end