class Scorecard

  attr_reader :current_roll, :game, :current_frame

  def initialize
   @game = Game.new
  end
  
  def add_score(score)
    @game.add_score(score)
  end


  def frame?
    @game.frame_number
  end

  def current_roll
    @game.roll_number
  end

  def current_score
    @game.score
  end

end
