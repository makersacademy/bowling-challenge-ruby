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
end 
   