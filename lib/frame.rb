require './lib/scorecard'

class Frame

attr_reader :knocked_down_pins, :spare, :strike

  def initialize(knocked_down_pins, spare, strike)
    @knocked_down_pins = knocked_down_pins
    @spare = spare 
    @stirke = strike
  end 

end
