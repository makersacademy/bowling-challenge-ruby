class Frame

  attr_reader :frame_total, :rolls
  attr_accessor :bonus_score

  def initialize
    @rolls = []
    @bonus_score = 0
    @frame_total = 0
  end

  def add_score(score)
    @rolls << score
  end

  def add_bonus_score(bonus)
    @bonus_score = bonus
  end

  def calc_frame_total
    @rolls.sum + @bonus_score
  end

  def set_frame_total
    @frame_total = calc_frame_total
  end

end