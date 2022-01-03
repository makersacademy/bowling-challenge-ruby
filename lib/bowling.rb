# frozen_string_literal: true

class Bowling
  attr_reader :turn, :frame, :total_score, :score, :strike_frames

  def initialize
    @turn = 1
    @frame = 1
    @total_score = 0
    @score = []
    @strike_frames = []
  end

  def input(pins)
    game_over
    raise 'Invalid input' unless valid_input(pins)
  
    if strike?(pins)
      record_strike
    end
    bonus_points(pins)
    add_to_score(pins)
    add_to_total_score(pins)
    increase_turn
  end

  private

  def increase_frame
    @frame += 1
  end

  def increase_turn
    if check_strike(@frame)
      increase_frame
    elsif @turn == 1
      @turn += 1
    else
      increase_frame
      @turn = 1
    end
  end

  def valid_input(pins)
    return false unless (0..10).include? pins

    if @turn == 1
      true
    else 
      (0..10).include?(@score[-1] + pins)
    end
  end

  def add_to_score(pins)
    @score << pins
  end

  def add_to_total_score(pins)
    @total_score += pins
  end

  def check_spare
    if @frame == 1
      false
    elsif @score[-1] == 10
      false
    else
      @score[-1] + @score[-2] == 10
    end
  end

  def strike?(pins)
    @turn == 1 && pins == 10
  end

  def record_strike
    @strike_frames << @frame
  end

  def check_strike(given_frame)
    @strike_frames.include?(given_frame)
  end

  def bonus_points(pins)
    if check_spare && @turn == 1
      add_to_total_score(pins)
    elsif check_strike(@frame - 1) && @turn == 2
      add_to_total_score(pins + @score[-1])
    end
  end

  def game_over
    raise 'Game Over. 10 Frames completed' if @frame == 11
  end
end
