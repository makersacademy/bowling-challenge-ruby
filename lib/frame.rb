class Frame
  attr_reader :scorecard, :bonus

  def initialize
    @pinfall = { roll1: nil, roll2: nil }
    @scorecard = []
    @bonus = nil
  end

  def first_roll(pins)
    @pinfall[:roll1] = pins
    pins == 10 ? strike : (return 'Player to roll again')
  end

  def second_roll(pins)
    @pinfall[:roll2] = pins
    total = @pinfall[:roll1] + @pinfall[:roll2]
    total == 10 ? spare : save_to_scorecard 
  end

  def bonus_roll(pins)
    if @scorecard[-1][:bonus_points].nil?
      @scorecard[-1][:bonus_points] = pins 
    else
      @scorecard[-1][:bonus_points] += pins 
    end
  end

  private
  
  def save_to_scorecard
    if @bonus.nil?
      @scorecard << @pinfall
    elsif @bonus == "strike bonus" 
      strike_bonus 
    elsif @bonus == "spare bonus" 
      spare_bonus
    end
    @pinfall = { roll1: nil, roll2: nil }
  end

  def strike
    save_to_scorecard
    @bonus = "strike bonus"  
    return 'STRIKE! End of frame' 
  end

  def strike_bonus
    @bonus = nil
    if @pinfall[:roll2].nil?
      bonus_points = @pinfall[:roll1]
    else
      bonus_points = @pinfall[:roll1] + @pinfall[:roll2]
    end
    @scorecard[-1][:bonus_points] = bonus_points
    @scorecard << @pinfall
  end

  def spare
    save_to_scorecard
    @bonus = "spare bonus" 
    return "SPARE!"
  end

  def spare_bonus
    @bonus = nil
    bonus_points = @pinfall[:roll1]
    @scorecard[-1][:bonus_points] = bonus_points
    @scorecard << @pinfall
  end
end
