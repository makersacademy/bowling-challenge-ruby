class Game

  attr_reader :currentscore, :frames
  def initialize
    @currentscore = 0
    @ball_number = 1
    @current_frame = 1
    @frames = {}
  end

  def playframe
    roll
  end

  def roll(pins)
    @pins = pins
    if @ball_number == 1
      @frames[@current_frame] = [pins]
      next_frame
      @ball_number += 1
    elsif @ball_number == 2
      @ball_number = 1
      @frames[@current_frame] << pins
      next_frame
    end
  end

  def score
    @frames.each do |_frame, balls|
      balls.each do |ball|
        @currentscore += ball
      end
    end
  end

  private

  def next_frame
    if (@ball_number == 1 && @pins == 10)
      @current_frame += 1
    elsif @ball_number == 2
      @current_frame += 1
    end
  end


end
