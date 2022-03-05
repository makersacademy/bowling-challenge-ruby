require './lib/frame'

class ScoreCard
  # An array starts at 0 so for frames 1 - 10 of the game the corresponding values in the array are 0 - 9
  # Current_frame has to start at 1 so that a check of current_frame - 1 (for previous frame) and strikes works for first frame
  def initialize
    @frames = Frame.create
    @current_frame = 1
  end

  def frame_number
    @current_frame
  end

  def roll(pin_count)
    # Drop out if the game is over (last frame which is ninth of the array)
    return if @frames[9].bowled?

    @frames[@current_frame - 1].roll(pin_count)
    @current_frame += 1 if @frames[@current_frame - 1].bowled?
  end

  # See details in frame score method on link to how reduce works
  # The first part is a shorthand for @frames.map(&:score.to_proc).join(' ') and converting it so it can process the string
  def score
    @frames.map(&:score).reduce(&:+)
  end
end
