class ScoreCard

  def initialize
    @completed_frames = []
  end 

  def total
    @score = []

    @completed_frames.each do |frame|
      @score << frame
    end 
    return @score.sum # returns an integer of the total score from each frame that has been added
  end 

  def add(frame) 
    @completed_frames << frame
    # frame is a string
    # takes one agument - and instance of Frame 
    # adds the score of frame to a scorecard 
    # returns nothing 
  end 

end 