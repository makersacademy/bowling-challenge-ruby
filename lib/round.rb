class Round
    attr_accessor :round_pins

  def initialize
    @round_pins = []
  end

  def add_pins(pins_knocked)
    @round_pins << pins_knocked
  end


  
end