class Pins
  attr_reader :total
  
  def roll_1
    p 'enter first roll'
    gets.chomp.to_i
  end

  def roll_2
    p 'enter second roll'
    gets.chomp.to_i
  end

  def frame_total
    @total = roll_1 + roll_2
  end

end