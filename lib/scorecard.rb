class Scorecard
  attr_accessor :scores, :total
  
  def initialize
    @scores = []
    @total = 0
  end

  def add_frame(scores)
    @scores << scores
  end
end