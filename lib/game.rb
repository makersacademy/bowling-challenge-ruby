require_relative 'frame'

class Game

  attr_reader :current_frame, :game

  def initialize(frame = Frame.new)
    @no_of_frames_completed = 0
    @current_frame = frame
    @game = []
    run_game
  end

  def run_game
    until @game.length == 10
      print "Please bowl"
      score = gets.chomp.to_i
      process_move(score)
    end
  end

  def process_move(score, frame = Frame.new)
    @current_frame.add_roll
    if @current_frame.no_of_rolls == 1 #don't take 10th frame into account yet
      @current_frame.roll_1_score = score
    else
      @current_frame.roll_2_score = score
      @current_frame.frame_number = @game.length + 1
      @current_frame.calc_frame_total
      @current_frame.set_frame_total
      @game << @current_frame
      @current_frame = frame
    end
  end

  def current_score
    # called after each frame
  end

  def score_game
    # called at the end of the game
  end
end
test_game = Game.new
print test_game.game

