class Scorecard

  attr_reader :current_roll, :game, :current_frame

  def initialize
    @current_roll = 0
    @game = Array.new(0)
    @current_frame = Hash.new(0)
  end
  
  def add_score(score)
    reset_frame?
    strike_or_spare?(score)
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
      p "you got a strike"
    elsif @current_frame['score'] + score == 10
      @current_frame['spare'] = true
      p "you got a spare"
     end
  end

  def reset_frame?
    if @current_frame['frame_roll'] == 2
      reset
      p "frame has been reset because you had two rolls"
    elsif @current_frame['strike'] == true
      reset
      p "frame has been reset because you got a stike"
    end
  end

  def reset
    @game << @current_frame
    @current_frame = Hash.new(0)
  end

  # calculates the score from completed frames
  def current_score
    if game.empty?
      @current_frame['score']
    else
      @current_frame['score'] + @game.map {|frame| frame['score']}.reduce(:+)
    end
  end

end
