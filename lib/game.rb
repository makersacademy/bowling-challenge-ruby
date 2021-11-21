require './lib/frame'
require './lib/scorecard'

class Game
  
  @@current_score = 0

  def self.run_game
    count = 0
    while count < 10
      count += 1
      puts "Frame #{count}"
      frame = Frame.new
      Frame.all_frames << frame
      puts @@frames
      Scorecard.current_score
    end
  end

end

