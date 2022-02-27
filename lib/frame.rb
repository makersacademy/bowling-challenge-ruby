class Frame

  attr_accessor :current_frame, :frame_total

  def initialize
    @current_frame = 1
    @frame_total = 0
  end

  def score(throw_1, throw_2 = 0)
    @frame_total = throw_1 + throw_2
    if @frame_total <= 10
      @frame_total
    else 
      raise "Score recorded for round is too high"
    end
  end

  def legal_score?
    false
  end

end