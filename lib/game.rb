require_relative 'frame'

class Game

  attr_reader :no_of_frames_completed, :current_frame, :game

  def initialize(frame = Frame.new)
    @no_of_frames_completed = 0
    @current_frame = frame
    @game = []
  end

  def roll(score)
    update_score(score)
    @current_frame.add_roll
    return complete_frame if frame_complete?
  end
  
  def check_roll
    return @current_frame.no_of_rolls 
  end

  def update_score(score)
    check_roll == 0 ? @current_frame.add_roll_1_score(score) : @current_frame.add_roll_2_score(score)
  end

  def frame_complete?
    return true if  @current_frame.no_of_rolls == 2
  end

  def complete_frame(frame = Frame.new)
    update_frame_total
    @game << @current_frame
    @current_frame = frame
  end

  def update_frame_total
    @current_frame.calc_frame_total
    @current_frame.set_frame_total
  end

end

my_game = Game.new
my_game.roll(9)
my_game.roll(9)
my_game.roll(9)
my_game.roll(9)
print my_game.game

