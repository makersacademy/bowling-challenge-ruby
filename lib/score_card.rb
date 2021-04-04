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
    if @frames.length.zero? || @frames.last.is_strike? || @frames.last.rolls.length == 2
      frame = Frame.new
      @frames << frame
    else
      frame = @frames.last
    end
    frame.roll(user_input)
    total
  end

  def tenth_round(user_input)
    if @frames.last.rolls.length >= 2 && !@frames.last.is_strike? && !@frames.last.is_spare?
      @score == 270 ? @score -= 30 : @score
      "Game ended! Your score was #{tenth_round_score + @score}"
    elsif @frames.last.rolls.length >= 3
      "Game ended! Your score was #{tenth_round_score + @score}"
    else
      @frames.last.roll(user_input)
      tenth_round_score + @score
    end
  end

  def tenth_round_score
    @frames.last.rolls.sum
  end

  def total
    unless final_frame
      @score = @frames.map.with_index do |frame, index|
        bonus = 0
        bonus += frame.rolls.first if previous_two_frames_are_strikes(index)
        if previous_frame_is_strike(index)
          bonus += frame.rolls.sum
        elsif previous_frame_is_spare(index)
          bonus += frame.rolls.first
        end
        bonus + frame.rolls.sum
      end.sum
    end
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
end
