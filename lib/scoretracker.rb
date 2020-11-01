
class ScoreTracker

  attr_reader :scores

  def initialize 
    @scores = Hash.new(0)
    @frame_num = 1
    @roll_num = 0
  end

  def add_roll(num)
    @scores[@frame_num] = [num.to_i]
  end
end