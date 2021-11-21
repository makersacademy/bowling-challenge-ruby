# score class
class Score
  attr_reader :frame_total, :running_total

  def initialize
    @frame_total = []
    @running_total = []
  end

  def frame_total
    @frame_total << @t1p
    @frame_total << @t2p
    @frame_total.sum
  end

  def strike_score
    @frame_total = 10 + @st1 + @st2
  end
end
