require './lib/frame'
require './lib/scorecard'

class Game

  def run_game
    count = 0
    while count < 10
      count += 1
      puts "Frame #{count}"
      frame = Frame.new
      frame.run_frame
      Frame.frames << frame
      Scorecard.current_score
    end
    Scorecard.final_score
  end

end

