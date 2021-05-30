# frozen_string_literal: true

class Scorecard
  attr_reader :current_frame, :current_roll, :frame_scores, :pending_bonus

  def initialize
    @current_frame = 1
    @current_roll = 1
    @frame_scores = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    @pending_bonus = nil
  end

  def roll_1(pins)
    raise 'Max pins exceeded, recheck and try again' if pins > 10

    @roll_1 = pins
    normal_scoring(pins)
    spare_scoring(pins) if @pending_bonus == :spare 

    if pins == 10
      @current_frame += 1
    else @current_roll += 1
    end
  end

  def roll_2(pins)
    raise 'Max pins exceeded, recheck and try again' if pins + @roll_1 > 10

    normal_scoring(pins)
    @pending_bonus = :spare if pins + @roll_1 == 10
    @current_frame += 1
    @current_roll = 1
  end

  def current_score
    @frame_scores.sum
  end

  def final_score
    raise 'You have not bowled 10 frames yet' if game_over? == false

    current_score
  end

  def game_over?
    @current_frame > 10
  end

  def normal_scoring(pins)
    @frame_scores[@current_frame - 1] += pins
  end

  def spare_scoring(pins)
    @frame_scores[@current_frame -2] += pins
    @pending_bonus = nil
  end
end
