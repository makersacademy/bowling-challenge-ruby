class Game

  def initialize
    @frames = []
    @current_frame = []
  end

  def current_frame
    @current_frame
  end

  def record_roll(roll)
    @current_frame << roll
  end

end
