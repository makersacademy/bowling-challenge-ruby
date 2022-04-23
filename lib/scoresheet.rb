require_relative './frame'

class Scoresheet

  def initialize(frame = Frame.new)
    @frames = []
    @current_frame = frame
  end

  def new_frame(frame = Frame.new)
    @current_frame = frame
  end
  
  def current_frame
    if @current_frame.rolls == 2 || @current_frame.strike?
      @frames << @current_frame
      new_frame
    end
    @current_frame
  end

  def frame_score(num)
    score = 0
    score += strike_bonus(num - 1) if @frames[num - 1].strike?
    score += spare_bonus(num - 1) if @frames[num - 1].spare?
    score += @frames[num - 1].first_roll
    score += @frames[num - 1].second_roll unless @frames[num - 1].strike?
    score
  end

  def strike_bonus(num)
    if @frames[num+1].strike?
      @frames[num+1].first_roll + @frames[num+2].first_roll
    else
      @frames[num+1].first_roll + @frames[num+1].second_roll
    end
  end

  def spare_bonus(num)
    @frames[num+1].first_roll
  end

  def complete?
    
  end

  def total_score
    0
  end
end
