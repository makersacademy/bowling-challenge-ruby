require './lib/frame'

class ScoreCard

  def initialize
    @frames = Frame.create
    # An array starts at 0 so for frames 1 - 10 of the game the corresponding values in the array are 0 - 9
    @current_frame = 0
  end

   def frame_number
    @current_frame
  end

  def roll(pin_count)
    @frames[@current_frame].roll(pin_count)
  end

  def score
    # See details in frame score method on link to how reduce works 
    # The first part is a shorthand for @frames.map(&:score.to_proc).join(' ') and converting it so it can process the string
    @frames.map(&:score).reduce(&:+)
  end

end
