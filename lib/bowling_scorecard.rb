class BowlingScorecard

  attr_reader :rolls
  
  def initialize
    @rolls = []
    @total_score = 0
  end

  def add_knocked_pins(pins)
    raise "This is a 10 pin bowling game!" if too_many_pins?(pins)
    @rolls << pins
    @total_score += pins
    reset_frame
  
  end

  def total_score
    @total_score
  end

  private

  def reset_frame
    @rolls = [] if @rolls.sum == 10
    @rolls = [] if @rolls.count == 2
    
  end

  def too_many_pins?(pins)
    (@rolls.sum + pins) > 10
  end
end
