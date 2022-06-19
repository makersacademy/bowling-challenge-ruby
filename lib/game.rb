class Game
  def initialize
    @scores = []
  end

  def add(frame) # frame is an instance of Frame
    @scores << frame
  end

  def score_card
    @scores
  end
  
  def sum_total 
    # sums the total of @scores
    # Returns total
  end
end