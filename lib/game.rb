require './lib/frame'
require './lib/scorecard'

class Game

  def initialize
    @current_score = 0
    @scorecard = Scorecard.new
  end

  def run_game
    count = 0
    while count < 10
      count += 1
      puts "Frame #{count}"
      frame = Frame.new
      frame.run_frame
      Frame.frames << frame
      @scorecard.current_score
    end
    @scorecard.final_score
  end

end

