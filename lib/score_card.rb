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
    frame = @frames[@current_frame_index]

    frame.add_roll(pins)
    
    if @current_frame_index == 9
      if frame.is_strike? || frame.is_spare?
        frame.complete = frame.rolls.length == 3
      else
        frame.complete = frame.rolls.length == 2
      end
    else
      frame.complete = frame.rolls.length == 2 || frame.is_strike?
    end

    @current_frame_index += 1 if @current_frame_index < 9 && frame.complete
  end

  def calculate_bonus_scores
    @frames.each_with_index do |frame, index|
      next_frame = @frames[index + 1]
      subsequent_frame = @frames[index + 2]
      
      case frame.frame_number
      when 10
        calculate_bonus_for_frame_10(frame)
      when 9
        calculate_bonus_for_frame_9(frame, next_frame)
      else
        calculate_bonus_for_other_frames(frame, next_frame, subsequent_frame)
      end
    end
  end

  def calculate_game_score
    calculate_bonus_scores

    frame_totals = 0
    @frames.each do |frame|
      frame.calculate_frame_score
      frame.calculate_total_score

      frame_totals += frame.total_score
    end

    return @game_score = frame_totals
  end

  private

  def calculate_bonus_for_frame_10(frame)
    if frame.is_spare?
      frame.bonus_score = frame.rolls[2]
    elsif frame.is_strike?
      frame.bonus_score = frame.rolls[1] + frame.rolls[2]
    end
  end
  
  def calculate_bonus_for_frame_9(frame, next_frame)
    if frame.is_spare?
      frame.bonus_score = next_frame.rolls[0]
    elsif frame.is_strike?
      frame.bonus_score = next_frame.rolls[0] + next_frame.rolls[1]
    end
  end
  
  def calculate_bonus_for_other_frames(frame, next_frame, subsequent_frame)
    if frame.is_spare?
      frame.bonus_score = next_frame.rolls[0]
    elsif frame.is_strike? && next_frame.is_strike?
      frame.bonus_score = next_frame.rolls[0] + subsequent_frame.rolls[0]
    elsif frame.is_strike?
      frame.bonus_score = next_frame.rolls[0] + next_frame.rolls[1]
    end
  end
end
