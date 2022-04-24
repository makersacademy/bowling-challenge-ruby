class Frame

  attr_reader :pins_standing

  def initialize
    @pins_standing = 10
  end


  def roll(knocked_down)
    knocked_down_parsed = knocked_down.to_i
    raise "Cannot knock down more pins than are standing" if knocked_down_parsed > @pins_standing
    score = knocked_down_parsed
    @pins_standing = @pins_standing - score
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