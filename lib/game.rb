class Game

  attr_reader :currentscore, :frames, :current_frame
  def initialize
    @currentscore = 0
    @ball_number = 1
    @current_frame = 1
    @frames = {}
  end

  def roll(pins)
    @pins = pins
    if @ball_number == 1
      @frames[@current_frame] = [pins]
      increment_game
    elsif @ball_number == 2
      @frames[@current_frame] << pins
      increment_game
    end
  end

  def score
    @currentscore = 0
    @frames.each do |frame, balls|
      @currentscore += frames[frame].sum
      if spare?(frame)
        @currentscore += frames[frame+1][0]
      end
    end
  end

  def strike?(frame_number)
    @frames[frame_number].length == 1
  end

  def spare?(frame_number)
    @frames[frame_number].sum == 10 && !strike?(frame_number)
  end

  private

  def increment_game
    if (@ball_number == 1 && @pins == 10)
      @current_frame += 1
      @ball_number = 1
    elsif @ball_number == 2
      @current_frame += 1
      @ball_number = 1
    else 
      @ball_number += 1
    end
  end

end
