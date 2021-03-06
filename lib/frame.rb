class Frame

  attr_reader :score

  def initialize(number)
    @frame_number = 0
    @score = []
  end

  def add_roll(pins)
    score << pins
  end

  def strike?
    score.include?(10) 
  end



end