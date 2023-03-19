class ScoreCard

  def initialize
    total_score = [:frame_one, :frame_two, :frame_three, :frame_four, :frame_five, :frame_six, :frame_seven, :frame_eight, :frame_nine, :frame_ten]
  end 

  def total
    return 4 # returns an integer of the total score from each frame that has been added
  end 

  def add(frame) 
    
    # frame is a string
    # takes one agument - and instance of Frame 
    # adds the score of frame to a scorecard 
    # returns nothing 
  end 

end 