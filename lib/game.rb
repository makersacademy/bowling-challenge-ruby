require 'scorecard'
require 'frame'

class Game 
  def initialize
    @scorecard = Scorecard.new
    @current_frame = Frame.new
    @frames = [@current_frame]
    @roll_count = 0
  end
end