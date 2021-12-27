require './lib/frame'
require './lib/scorecard'

class Game

  def initialize
    @current_score = 0
    @frame_count = 0
    @scorecard = Scorecard.new
  end

  def run_game
    while @frame_count < 10
      @frame_count += 1
      puts "Frame #{@frame_count}\n--------"
      new_frame
      @scorecard.current_score
    end
    @scorecard.final_score
  end

  def new_frame
    @frame = Frame.new
    @frame.final_frame = true if @frame_count == 10
    @frame.run_frame
    Frame.frames << @frame
  end

end

