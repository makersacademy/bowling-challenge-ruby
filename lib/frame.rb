require './lib/scorecard'

class Frame

attr_reader :knocked_down_pins, :spare, :strike

  def initialize(knocked_down_pins, spare = false , strike = false)
    @knocked_down_pins = knocked_down_pins
    @strike = true if knocked_down_pins[0] == 10
    @spare = true if (knocked_down_pins.sum == 10 && knocked_down_pins[0] != 10) 
  end 

end

