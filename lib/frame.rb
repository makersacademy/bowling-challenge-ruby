# frozen_string_literal: true

# A class to store rolls of a bowling game within a frame object
class Frame
  attr_reader :roll1, :roll2, :roll3
  attr_accessor :score

  def initialize(turn)
    @roll1 = nil
    @roll2 = nil
    @roll3 = nil
    @score = 0
    @turn = turn
    @complete = 'incomplete'
  end

  def roll(score)
    raise 'You cannot roll more than 10' if score > 10
    raise 'You cannot roll less than 0' if score.negative?
    raise 'This frame is complete' if @complete == 'complete'

    if @roll1.nil?
      first_roll(score)
    elsif @turn < 10 && @roll2.nil?
      second_roll(score)
    elsif @roll2.nil?
      second_roll_turn10(score)
    else
      bonus_roll(score)
    end
  end

  def complete?
    @complete == 'complete'
  end

  def strike?
    @roll1 == 10
  end

  def spare?
    @roll1 != 10 && @roll1.to_i + @roll2.to_i == 10
  end

  def total
    @roll1.to_i + @roll2.to_i + @roll3.to_i
  end

  def calculate_total
    @score = @roll1.to_i + @roll2.to_i + @roll3.to_i
  end

  private

  def first_roll(score)
    @roll1 = score
    calculate_total
    @complete = 'complete' if score == 10 && @turn < 10
  end

  def second_roll(score)
    @roll2 = score
    calculate_total
    @complete = 'complete'
  end

  def second_roll_turn10(score)
    @roll2 = score
    calculate_total
    @complete = 'complete' if @roll1 + @roll2 < 10
  end

  def bonus_roll(score)
    @roll3 = score
    calculate_total
    @complete = 'complete'
  end
end
