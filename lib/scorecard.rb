class Scorecard
  attr_accessor :scores, :total
  
  def initialize
    @scores = []
  end

  def add_frame(rolls)
    if @scores.empty?
      total = rolls.sum
    else
      total = @scores.last[:score] + rolls.sum
    end
    @scores << { rolls: rolls, score: total }
  end
end