class Scorecard

  def initialize
    @frames = []
    @total
  end

  def get_score(frame)
    frame.base_score
  end

end
