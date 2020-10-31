class Scorecard

  attr_reader :current_score, :current_roll, :game, :current_frame

  def initialize
    @current_score = 0
    @current_roll = 0
    @game = []
    @current_frame = Hash.new(0)
  end
  
  def add_score(score)
    @current_score += score
    @current_roll += 1
    @current_frame['frame_roll'] += 1
    reset_frame?
  end


  def frame?
    @game.length + 1
  end


  def reset_frame?
    if @current_frame['frame_roll'] == 2
      @game << @current_frame
      reset
    end
  end

  def reset
    @current_frame = Hash.new(0)
  end

end
