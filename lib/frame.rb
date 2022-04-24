class Frame

  attr_reader :pins_standing

  def initialize
    @pins_standing = 10
  end


  def roll(standing_pins, knocked_down)
    raise "Cannot knock down more pins than are standing" if knocked_down > standing_pins
    score = knocked_down.to_i
    @pins_standing = standing_pins - score
    { remaining_pins: @pins_standing, score: score }
  end

  def cleared?
    if @pins_standing == 0
      true
    else
      false
    end
  end

end