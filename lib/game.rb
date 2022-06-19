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
    @scores.inject(:+)
  #   result_1 = @scores.flatten.map do |score|
  #     score.frame_score
  #   end
  #   result_2 = result_1.inject(:+)
  #   result_3 = result_2.inject(:+)
  #   p result_3
  end
end