class Frame

  attr_reader :pins_standing

  def initialize
    @pins_standing = 10
  end


  def roll
    knocked_down = $stdin.gets.chomp.to_i
    raise "Cannot knock down more pins than are standing" if knocked_down > @pins_standing
    @pins_standing = @pins_standing - knocked_down
    knocked_down
  end

  def cleared?
    @pins_standing == 0
  end

end