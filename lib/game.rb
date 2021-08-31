require_relative 'frame'

class Game

  attr_reader :no_of_frames_completed, :current_frame, :game

  def initialize(frame = Frame.new)
    @no_of_frames_completed = 0
    @current_frame = frame
    @game = []
  end



  def check_roll
    return @current_frame.no_of_rolls 
  end

  def add_roll_1_score(score)
    @current_frame.roll_1_score + score
  end

end

