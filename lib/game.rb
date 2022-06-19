class Game

  attr_reader :current_frame
  
  def initialize
    @scores = []
    @current_frame = 1
  end

  def add(frame) # frame is an instance of Frame
    @scores << frame
    @current_frame += 1
  end

  def score_card
    @scores
  end
  
  def sum_total 
    score_card.inject(:+)
  end
end