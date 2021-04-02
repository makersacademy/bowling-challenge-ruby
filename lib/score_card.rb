class ScoreCard

  attr_reader :frame_count

  def initialize
    @frame_count = 1
  end

  def next_frame
    @frame_count += 1 unless @frame_count >= 10
  end 
end 