class Frame
  attr_reader :pinfall, :scorecard

  def initialize
    @pinfall = { roll1: nil, roll2: nil }
    @scorecard = []
  end

  def first_roll(pins)
    @pinfall[:roll1] = pins
    pins == 10 ? strike : (return 'Player to roll again')
  end

  def second_roll(pins)
    @pinfall[:roll2] = pins
    save_to_scorecard 
    total = pins + @scorecard.last[:roll1]
    total == 10 ? (return "SPARE!") : (return "You knocked over #{total} pins")
  end

  private
  
  def save_to_scorecard
    @scorecard << @pinfall
    @pinfall = { roll1: nil, roll2: nil }
  end

  def strike
    save_to_scorecard
    return 'STRIKE! End of frame' 
  end

end
