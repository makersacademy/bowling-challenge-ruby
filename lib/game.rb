require_relative 'frame'
class Game

  attr_reader :no_of_frames_completed, :current_frame, :game

  def initialize(frame_class = Frame)
    @no_of_frames_completed = 0
    @frame_class = frame_class
    @current_frame = @frame_class.new
    @game = []
  end

  def roll(score)
    @current_frame.add_score(score)
    complete_frame if frame_complete?
    print "GAME OVER! You're score is: #{score_total}" if @game.length == 10
  end

  def score_total
    score = 0
    @game.each { |frame| score += frame.frame_total }
    score
  end

  private

  def update_frame_total
    add_strike_bonus if strike?
    add_spare_bonus if spare?
    @current_frame.calc_frame_total && @current_frame.set_frame_total
    @game.last.calc_frame_total && @game.last.set_frame_total if is_not_first_frame?
    @game[-2].calc_frame_total && @game[-2].set_frame_total if @game.length > 1 
  end

  def is_not_first_frame?
    @game == [] ? false : true
  end

  def complete_frame
    update_frame_total
    @game << @current_frame
    @current_frame = @frame_class.new
  end

  def frame_complete?
    return true if  @current_frame.rolls.length == 3
    return false if incomplete_frame?
    return true if @current_frame.rolls.first == 10
    return true if  @current_frame.rolls.length == 2
  end

  def incomplete_frame?
    return true if @current_frame.rolls.first == 10 && @game.length == 9
    return true if @current_frame.rolls.first + @current_frame.rolls.last == 10 && @game.length == 9
  end

  def double_strike?
    @game.length > 1 && @game.last.rolls.first == 10 && @game[-2].rolls.first == 10
  end

  def strike?
    return true if is_not_first_frame? && @game.last.rolls.first == 10
  end

  def spare?
    return true if is_not_first_frame? && @game.last.rolls.sum == 10 && !strike?
  end

  def add_strike_bonus
    if double_strike?
      additional_bonus = @current_frame.rolls.first
      @game[-2].add_bonus_score(additional_bonus)
    end
    @game.length == 9 ? strike_bonus = @current_frame.rolls[0..1].sum : (strike_bonus = @current_frame.rolls.sum)
    @game.last.add_bonus_score(strike_bonus)
  end

  def add_spare_bonus
    spare_bonus = @current_frame.rolls.first
    @game.last.add_bonus_score(spare_bonus)
  end

  def double_strike_bonus
    additional_bonus = @current_frame.rolls.first
    @game[-2].add_bonus_score(additional_bonus)
  end
end

my_game = Game.new

# 12.times { my_game.roll(10)}

my_game.roll(1)
my_game.roll(4)

# # puts my_game.score_total

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

my_game.roll(7)
my_game.roll(3)

my_game.roll(6)
my_game.roll(4)

my_game.roll(10)


my_game.roll(2)
my_game.roll(8)
my_game.roll(6)

# print my_game.game

# puts my_game.score_total
# puts "----"
# my_game.game.each { |frame| puts frame.frame_total }
# puts "-----"
# puts my_game.score_total
