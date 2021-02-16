class Frame
  attr_reader :throws
  attr_accessor :spare, :strike, :total_score

  def initialize
    @throws = []
    @total_score = 0
    @strike = false
    @spare = false
  end

  def add_roll_score(pins)
    @throws << pins
  end

  def mark_as_strike?
    @strike = true if @throws[0] == 10
    @strike
  end

  def mark_as_spare?
    @spare = true if @throws.sum == 10 && mark_as_strike? == false
    @spare
  end

  def set_total_score
    @total_score = @throws.sum
  end
end
