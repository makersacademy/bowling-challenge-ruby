class ScoreCard

  attr_reader :frame_count, :roll_count

  def initialize
    @frame_count = 1
    @roll_count = 1
  end

  def next_frame
    @frame_count += 1 unless @frame_count >= 10
  end 

  def next_roll 
    @roll_count >= 2 ? @roll_count -= 1 : @roll_count += 1 
    next_frame if @roll_count == 1
  end 
end 