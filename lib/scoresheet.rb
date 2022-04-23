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

  def total_score
    0
  end

end
