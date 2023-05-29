require_relative 'frame'

class ScoreCard
  attr_reader :frames, :current_frame_index

  def initialize
    @frames = []
    @current_frame_index = 0
    @game_score = 0

    10.times do
      frame = Frame.new
      frame.frame_number = @frames.length + 1
      @frames << frame
    end
  end

  def roll_current_frame(pins)
    @frames[@current_frame_index].add_roll(pins)
    
    mark_complete_on_conditions

    # incrementing current_frame_index if completed
    if @current_frame_index < 9 && @frames[@current_frame_index].complete == true 
      @current_frame_index += 1 
    end
  end

  def calculate_bonus_scores
    # for spares on regular frames
    # for strikes on regular when next not strike
    # for strikes on regular when next strike
    # TODO spares on tenth
    # TODO strikes on tenth
    @frames.each_with_index do |frame, index|
      next_frame = @frames[index + 1]
      subsequent_frame = @frames[index + 2]
      
      if frame.is_spare?
        frame.bonus_score = next_frame.rolls[0]
      elsif frame.is_strike? && next_frame.is_strike?
        frame.bonus_score = next_frame.rolls[0] + subsequent_frame.rolls[0]
      elsif frame.is_strike?
        frame.bonus_score = next_frame.rolls[0] + next_frame.rolls[1]
      end

    end
  end

  def calculate_game_score
    @frames.each do |frame|
      @game_score += frame.calculate_frame_score
    end

    return @game_score
  end

  def mark_complete_on_conditions
    # handling completion
    case @current_frame_index
    when 9
      frame = @frames[@current_frame_index]
  
      if frame.is_strike? || frame.is_spare?
        if frame.rolls.length == 3
          frame.complete = true
        end
      else
        if frame.rolls.length == 2
          frame.complete = true
        end
      end
    else
      if @frames[@current_frame_index].rolls.length == 2 || @frames[@current_frame_index].is_strike?
        @frames[@current_frame_index].complete = true
      end
    end
  end
end
