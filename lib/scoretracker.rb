
class ScoreTracker

  attr_reader :scores, :roll_num, :frame_num

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
      update_frame
    end
    update_roll
  end

  private

  def update_frame
    @frame_num += 1
  end

  def update_roll
    @roll_num += 1
  end

  def new_frame?
    !@scores.has_key?(@frame_num)
  end
end