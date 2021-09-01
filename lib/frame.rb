class Frame

  attr_reader :no_of_rolls, :frame_total
  attr_accessor :roll_1_score, :roll_2_score, :bonus_score

  def initialize
    @no_of_rolls = 0
    @roll_1_score = 0
    @roll_2_score = 0
    @bonus_score = 0
    @frame_total = 0
  end

  def add_roll
    @no_of_rolls += 1
  end

  def add_roll_1_score(score)
    @roll_1_score = score
  end

  def add_roll_2_score(score)
    @roll_2_score = score
  end

  def add_bonus_score(bonus)
    @bonus_score = bonus
    
  end

  def calc_frame_total
    @roll_1_score + @roll_2_score + @bonus_score
  end

  def set_frame_total
    @frame_total = calc_frame_total
  end

end