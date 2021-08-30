class Game

  def initialize(frame = Frame.new)
    @no_of_frames_completed = 0
    @current_frame = frame
    @game = []
    run_game
  end

  def self.run_game
    until false
      print "Please bowl"
      score = gets.chomp
      process_move(score)
    end
  end

  def process_move(score)
    # check number of rolls in that frame using until
    # add 1 to number of rolls
    # adds score to relevant frame instance variable
    # if no_of_rolls is 2 (and frame isn't 10):
      # call calc_frame_total method on frame instance
      # call set_frame_total method on frame instance 
      # push frame into @game,print @current_frame score and then @current_frame = frame
  end

  def current_score
    # called after each frame
  end

  def score_game
    # called at the end of the game
  end


end

