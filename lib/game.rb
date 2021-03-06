require_relative 'frame'

class Game

  attr_reader :turn, :current_frame
 
class << self

  def create
    Game.new
  end

end

  def initialize
    @turn = 0
  end

  def begin_frame
    @turn += 1
    @current_frame = Frame.new
  end

end