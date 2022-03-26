require_relative 'frame'

class ScoreCard
  attr_reader :total_score, :frame

  def initialize
    @total_score = (1..10).map { |x| [x, ''] }.to_h
    @frame = Frame.new
  end

  def frame_score
    if @frame.strike? || @frame.spare?
      @total_score[@frame.current_frame] = 'pending'
    else
      @total_score[@frame.current_frame] = @frame.frames[@frame.current_frame - 1].sum
    end
  end
end
