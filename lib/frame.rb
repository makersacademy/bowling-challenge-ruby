class Frame

  attr_reader :pins_standing

  def initialize
    @pins_standing = 10
  end


  def roll
    knocked_down = $stdin.gets.chomp.to_i
    raise "Cannot knock down more pins than are standing" if knocked_down > @pins_standing
    score = knocked_down
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