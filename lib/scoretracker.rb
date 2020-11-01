
class ScoreTracker

  attr_reader :scores

  def initialize 
    @scores = Hash.new(0)
    @frame_num = 1
    @roll_num = 0
  end

  def add_roll(roll)
    if new_frame?
      @scores[@frame_num] = [roll.to_i]
    else
      @scores[@frame_num] << roll.to_i
    end
  end

  private

  def new_frame?
    !@scores.has_key?(@frame_num)
  end
end