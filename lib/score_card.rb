# frozen_string_literal: true

class ScoreCard
  attr_reader :frames

  def initialize
    @frames = []
    @score = 0
  end

  def play(user_input)
    final_frame ? tenth_round(user_input) : roll(user_input)
  end

  def roll(user_input)
    if new_frame
      frame = Frame.new
      @frames << frame
    else
      frame = @frames.last
    end
    frame.roll(user_input)
    total
  end

  def total
    unless final_frame
      @score = @frames.map.with_index do |frame, index|
        bonus = 0
        bonus += frame.rolls.first if previous_two_frames_are_strikes(index)
        if previous_frame_is_strike(index)
          bonus += frame.count
        elsif previous_frame_is_spare(index)
          bonus += frame.rolls.first
        end
        bonus + frame.count
      end.sum
    end
  end

  def game_over 
    "Game ended! Your score was #{tenth_round_score + @score}"
  end 

  private

  def previous_frame_is_strike(index)
    @frames[index - 2] && @frames[index - 1].is_strike?
  end

  def previous_two_frames_are_strikes(index)
    @frames[index - 2]&.is_strike? && previous_frame_is_strike(index)
  end

  def previous_frame_is_spare(index)
    @frames[index - 1]&.is_spare?
  end

  def final_frame
    @frames.length > 9
  end

  def new_frame
    @frames.length.zero? || @frames.last.is_strike? || @frames.last.rolls.length == 2
  end 

  def tenth_round_no_bonus
    @frames.last.rolls.length >= 2 && !@frames.last.is_strike? && !@frames.last.is_spare?
  end 

  def tenth_round_with_bonus
    @frames.last.rolls.length >= 3
  end 

  def tenth_round(user_input)
    tenth_round_no_bonus || tenth_round_with_bonus ? game_over : @frames.last.roll(user_input) && tenth_round_score + @score
  end

  def tenth_round_score
    @frames.last.count
  end
end
