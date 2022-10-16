class Round
    attr_accessor :round_pins, :strike, :spare

  def initialize
    @round_pins = []
    @strike = false
    @spare = false
  end

  def add_pins(pins_knocked)
    @round_pins << pins_knocked
    @strike = true if @round_pins[0] == 10
  end


  
end