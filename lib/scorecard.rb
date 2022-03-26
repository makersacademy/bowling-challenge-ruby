require_relative 'frame'

class ScoreCard
  attr_reader :total_score, :frame

  def initialize
    @total_score = (1..10).map { |x| [x, []] }.to_h
    @frame = Frame.new
  end

  def frame_score
    @total_score[1] = @frame.frames[1].sum
  end
end
