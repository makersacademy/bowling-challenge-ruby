require 'scorecard'
require 'frame'

class Game 
  attr_reader :scorecard, :current_frame, :frames, :roll_count
  
  def initialize
    @scorecard = Scorecard.new
    @current_frame = Frame.new
    @frames = [@current_frame]
    @roll_count = 0
  end
end
