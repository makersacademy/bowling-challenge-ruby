class Game
  NO_OF_PINS = 10
  FIRST_BALL_INDEX = 0
  FINAL_FRAME = 10
  
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
    @frames.each do |frame, _balls|
      @currentscore += frames[frame].sum
      if spare?(frame)
        @currentscore += frames[frame + 1][FIRST_BALL_INDEX]
      elsif strike?(frame)
        score_strike(frame)
      end
    end
  end

  def strike?(frame_number)
    @frames[frame_number].length == 1 && @frames[frame_number].sum == NO_OF_PINS
  end

  def spare?(frame_number)
    @frames[frame_number].sum == NO_OF_PINS && !strike?(frame_number)
  end

  private

  def increment_game
    if (@ball_number == 1 && @pins == NO_OF_PINS)
      @current_frame += 1
      @ball_number = 1
    elsif @ball_number == 2
      @current_frame += 1
      @ball_number = 1
    else 
      @ball_number += 1
    end
  end

  def score_strike(frame)
    if !strike?(frame + 1)
      @currentscore += frames[frame + 1].sum
    else
      @currentscore += frames[frame + 1][FIRST_BALL_INDEX] 
      @currentscore += frames[frame + 2][FIRST_BALL_INDEX]
    end
  end

end
