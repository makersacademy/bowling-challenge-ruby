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
    # add_bonus_score(score) if strike_bonus_score?
  end
  
  def check_roll
    return @current_frame.no_of_rolls 
  end

  def update_score(score)
    check_roll == 0 ? @current_frame.add_roll_1_score(score) : @current_frame.add_roll_2_score(score)
  end

  def strike?
    return true if @current_frame.roll_1_score == 10
  end

  def frame_complete?
    return true if strike?
    return true if  @current_frame.no_of_rolls == 2
  end

  def strike_bonus_score?
    return true if @game.last.roll_1_score == 10
  end

  # def add_bonus_score(score)
  #   bonus = roll_1_score + roll_2_score
  #   @current_frame.add_bonus_score(bonus)
  # end

  def spare_bonus_score?
    return true if @game.last.frame_total == 10
  end

  def is_first_frame?
    @games.length < 1 ? true : false
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
# my_game.roll(9)
# my_game.roll(9)
my_game.roll(10)
my_game.roll(9)
my_game.roll(9)
print my_game.game

