class ScoreCard

  def initialize
    @completed_frames = []
  end 

  def total
    @score = []

    @completed_frames.each do |frame|
      p "this is frame: #{frame}"
      
      @score << frame.sum
    end 
    return @score.sum # returns an integer of the total score from each frame that has been added
  end 

  def add(frame) #frame is an instance of Frame
    @completed_frames << frame
    p "this is the @completed_frame : #{@completed_frames}"
    # adds the frame to the completed frames array
    # returns nothing 
  end 

end 