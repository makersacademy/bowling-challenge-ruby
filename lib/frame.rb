class Frame

  attr_reader :pins_standing

  def initialize
    @pins_standing = 10
    @frame_score  = { first_roll: nil, second_roll: nil}
  end


  def roll
    knocked_down = $stdin.gets.chomp.to_i
    raise "Cannot knock down more pins than are standing" if knocked_down > @pins_standing
    @pins_standing = @pins_standing - knocked_down
    knocked_down
  end

  def update_score(index, result)
    @frame_score[index] = result
  end

  def cleared?
    @pins_standing == 0
  end

  def strike?
    @frame_score[:first_roll] == 10
  end

end