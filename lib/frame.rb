require './lib/scorecard'

class Frame

attr_reader :knocked_down_pins

  def initialize(knocked_down_pins)
    @knocked_down_pins = knocked_down_pins
  end 

end
