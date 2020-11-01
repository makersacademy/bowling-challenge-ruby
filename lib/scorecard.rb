class Scorecard

  attr_reader :current_score, :current_roll, :game, :current_frame

  def initialize
    @current_score = 0
    @current_roll = 0
    @game = []
    @current_frame = Hash.new(0)
  end
  
  def add_score(score)
    reset_frame?
    strike_or_spare?(score)
    @current_score += score
    @current_roll += 1
    @current_frame['frame_roll'] += 1
    @current_frame['score'] += score
  end


  def frame?
    @game.length + 1
  end

  def strike_or_spare?(score)
    if score == 10 && @current_frame['frame_roll'] == 0
      @current_frame['strike'] = true
    elsif @current_frame['score'] + score == 10
      @current_frame['spare'] = true
     end
  end

  def reset_frame?
    if @current_frame['frame_roll'] == 2
      reset
    elsif @current_frame['strike'] == true
      reset
    end
  end

  def reset
    @game << @current_frame
    @current_frame = Hash.new(0)
  end

end
