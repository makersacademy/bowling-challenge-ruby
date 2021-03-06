require 'frame'

class Game

  attr_reader :roll
 
class << self

  def create
    Game.new
  end

end

  def initialize
    @roll = 0
  end

  def begin_frame
    @roll += 1
    @current_frame = Frame.new
  end

end