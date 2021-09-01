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
    complete_frame if frame_complete?
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

  def add_strike_bonus
    strike_bonus = @current_frame.roll_1_score + @current_frame.roll_2_score
    @game.last.add_bonus_score(strike_bonus)
  end

  def add_spare_bonus
    spare_bonus = @current_frame.roll_1_score
    @game.last.add_bonus_score(spare_bonus)
  end

  def strike_bonus?
    return true if is_not_first_frame? && @game.last.roll_1_score == 10
  end

  def spare_bonus?
    return true if is_not_first_frame? && @game.last.frame_total == 10
  end

  def is_not_first_frame?
    @game == [] ? false : true
  end

  def complete_frame(frame = Frame.new)
    update_frame_total
    @game << @current_frame
    @current_frame = frame
  end

  def update_frame_total
    add_strike_bonus if strike_bonus?
    add_spare_bonus if spare_bonus?
    @current_frame.calc_frame_total && @current_frame.set_frame_total
    @game.last.calc_frame_total && @game.last.set_frame_total if is_not_first_frame?
    
  end

  def score_total
    score = 0
    @game.each { |frame| score += frame.frame_total }
    score
  end

end

my_game = Game.new
my_game.roll(1)
my_game.roll(4)

# puts my_game.score_total

my_game.roll(4)
my_game.roll(5)
# puts my_game.score_total

my_game.roll(6)
my_game.roll(4)
# puts my_game.score_total
# puts my_game.spare_bonus?

my_game.roll(5)
my_game.roll(5)
# puts my_game.score_total
# puts my_game.spare_bonus?

my_game.roll(10)

my_game.roll(0)
my_game.roll(1)

# puts my_game.score_total


# puts my_game.score_total
# puts "----"
# my_game.game.each { |frame| puts frame.bonus_score }
print my_game.score_total
