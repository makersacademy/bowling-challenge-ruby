class Gameplay
  attr_accessor :current_frame, :current_ball

  def initialize
    @current_frame = 1
    @current_ball = 1
  end

  def prompt

  end

  def next_ball
    if @current_frame < 10
      if @current_ball == 1
        @current_ball = 2
      else
        @current_frame = @current_frame + 1
        @current_ball = 1
      end
    else
      @current_ball = @current_ball + 1
    end
  end

  def continue?
    return true if @current_frame <= 10 && @current_ball <= 3
  end
end