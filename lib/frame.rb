class Frame
  # attr_accessor :roll1, :roll2
  def initialize(roll1, roll2)
    @roll1 = roll1
    @roll2 = roll2
    @frame = []
  end

  def roll1
    @roll1
  end

  def roll2
    @roll2
  end

  def add_rolls
    @frame << roll1 << roll2
  end

  def frame_arr
    @frame
  end
  
  def sum_rolls
    raw_score = 0
    frame_arr.each do |roll|
      raw_score += roll
    end
    raw_score
  end

  def is_spare?
    (roll1 < 10) && (roll1 + roll2 == 10) ? true : false
  end

  def is_strike?
    roll1 == 10 ? true : false
  end
end