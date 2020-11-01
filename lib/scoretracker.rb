
class ScoreTracker

  attr_reader :scores, :frame_num, :totals

  def initialize 
    @scores = Hash.new(0)
    @totals = Hash.new(0)
    @frame_num = 1
  end

  def add_roll(roll)
    if new_frame?
      @scores[@frame_num] = [roll.to_i]
      update_frame if strike?(roll)
    else
      @scores[@frame_num] << roll.to_i
      update_frame
    end
  end

  def update_frame
    @frame_num += 1 unless last_frame?
  end

  private

  def strike?(roll)
    roll == '10'
  end

  def last_frame?
    @frame_num == 10
  end

  def new_frame?
    !@scores.has_key?(@frame_num)
  end
end