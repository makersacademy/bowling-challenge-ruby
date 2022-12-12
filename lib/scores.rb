class Scores
  def initialize 
    @frames = []
  end 

  def add(frame)
    @frames << frame
  end

  def all
    @frames
  end

  def final_score 
    score = 0 
    @frames.each_with_index do |frame, num|
      if frame.strike
end 
   