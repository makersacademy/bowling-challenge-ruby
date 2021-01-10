# frozen_string_literal: true

require_relative './frame'
require_relative './frame_ten'
class Game
  attr_reader :round, :score, :is_strike, :is_spare, :frames

  def initialize
    @round = 0
    @score = 0
    @frames = []
    @is_spare = false
    @is_strike = false
  end

  def play(current_frame)
    @round += 1
    check_previous_frame(current_frame)
    if @round < 10
      calculate_strike(current_frame)
      calculate_spare(current_frame)
      @frames.append(current_frame)
      calculate_score
    elsif @round == 10
      check_last_frame(current_frame)
    else
      raise 'You cannot play more than 10 frames'
    end
  end

  def check_last_frame(current_frame)
    # Roll 1 + Roll 2 < 10
    if (current_frame.frame_score) < 10
      @frames.append(current_frame)
      calculate_score
      return
    end

    #  Strike at Roll 1
    if current_frame.roll1 == 10
      current_frame.frame_score += current_frame.roll3
      @frames.append(current_frame)
      calculate_score
      return
    end

    # Spare
    if current_frame.frame_score == 10
      current_frame.frame_score += current_frame.roll3
      @frames.append(current_frame)
      calculate_score
      nil
    end
  end

  private

  def check_previous_frame(current_frame)
    if @is_strike == true
      previous_frame = @frames[-1]
      previous_frame.frame_score += (current_frame.roll1 + current_frame.roll2)

    elsif @is_spare == true
      previous_frame = @frames[-1]
      previous_frame.frame_score += current_frame.roll1
    end
  end

  def calculate_strike(current_frame)
    @is_strike = current_frame.roll1 == 10
  end

  def calculate_spare(current_frame)
    @is_spare = if current_frame.frame_score == 10 && current_frame.roll1 < 10
                  true
                else
                  false
                end
  end

  def calculate_score
    @score = 0
    @frames.each do |frame|
      @score += frame.frame_score
    end
    @score
  end
end
