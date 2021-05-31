# frozen_string_literal: true

class Scorecard
  attr_reader :current_frame, :current_roll, :frame_scores, :pending_bonus, :strike_bonus_holder

  def initialize
    @current_frame = 1
    @current_roll = 1
    @frame_scores = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    @pending_bonus = nil
    @strike_bonus_holder = []
  end

  def roll_1(pins)
    raise 'Max pins exceeded, recheck and try again' if pins > 10

    @roll_1 = pins
    normal_scoring(pins)
    spare_scoring(pins) if @pending_bonus == :spare
    @strike_bonus_holder << pins if @pending_bonus == :strike && @strike_bonus_holder.length < 2
    strike_scoring(@strike_bonus_holder.sum) if @pending_bonus == :strike && @strike_bonus_holder.length == 2

    if pins == 10
      @current_frame += 1
      @pending_bonus = :strike
    else @current_roll += 1
    end
  end

  def roll_2(pins)
    raise 'Max pins exceeded, recheck and try again' if pins + @roll_1 > 10

    normal_scoring(pins)
    @strike_bonus_holder << pins if @pending_bonus == :strike && @strike_bonus_holder.length < 2
    strike_scoring(@strike_bonus_holder.sum) if @pending_bonus == :strike && @strike_bonus_holder.length == 2
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

  def spare_scoring(spare_bonus)
    @frame_scores[@current_frame - 2] += spare_bonus
    @pending_bonus = nil
  end

  def strike_scoring(strike_bonus)
    @frame_scores[@current_frame - 2] += strike_bonus
    @pending_bonus = nil
    @strike_bonus_holder = []
  end
end
