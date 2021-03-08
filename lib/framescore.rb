# frozen_string_literal: true

class FrameScore
  attr_reader :total, :final

  def initialize(frame:, score_table:)
    @frame = frame
    @final = false
    @total = 0
    @bonus_bowls = 0
    @bonus = []
    @score_table = score_table
    score_frame
  end

  def add_bonus_bowl(pins:)
    @bonus.push(pins)
    @bonus_bowls -= 1
    complete_bonus if @bonus_bowls.zero?
  end

  private

  def score_frame
    if complete?
      @total += @frame.pins_total
      finalise_score
    end
    bonus unless complete?
  end

  def complete?
    @frame.pins_total < 10 || @frame.number == 10
  end

  def bonus
    @bonus_bowls = 2 if strike?
    @bonus_bowls = 1 if spare?
  end

  def strike?
    @frame.bowls.length == 1
  end

  def spare?
    @frame.bowls.length == 2
  end

  def complete_bonus
    @total += @frame.pins_total
    @total += @bonus.sum
    finalise_score
  end

  def finalise_score
    @final = true
    @score_table.update(frame_number: @frame.number, score: @total)
  end
end
