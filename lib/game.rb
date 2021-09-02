require_relative 'frame'
class Game

  attr_reader :no_of_frames_completed, :current_frame, :game

  def initialize(frame = Frame.new)
    @no_of_frames_completed = 0
    @current_frame = frame
    @game = []
  end

  def roll(score)
    @current_frame.add_score(score)
    complete_frame if frame_complete?
  end
  
  def frame_complete?
    return true if strike?
    return true if  @current_frame.rolls.length == 2
  end

  def add_strike_bonus
    strike_bonus = @current_frame.rolls.sum
    @game.last.add_bonus_score(strike_bonus)
  end

  def add_spare_bonus
    spare_bonus = @current_frame.rolls.first
    @game.last.add_bonus_score(spare_bonus)
  end

  def strike?
    return true if is_not_first_frame? && @game.last.rolls.first == 10
  end

  def spare?
    return true if is_not_first_frame? && @game.last.rolls.sum == 10 && !strike?
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
    add_strike_bonus if strike?
    add_spare_bonus if spare?
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
