# frozen_string_literal: true

# this class is instatiated by the Game class
# on instatiation, and subsequently on every roll
# when the prior frame is complete
class Frame
  attr_reader :rolls

  def initialize
    @rolls = []
    @bonus = []
  end

  def add_roll(pins)
    @rolls << pins
  end

  def add_bonus(pins)
    # if spare and we haven't added a bonus yet
    @bonus << pins if spare? && @bonus.empty?
    # if strike
    @bonus << pins if strike? && @bonus.count < 2
  end

  def score
    if score_complete?
      total_score = @rolls + @bonus
      total_score.sum
    else
      0
    end
  end

  def complete?
    return true if @rolls[0] == 10 || @rolls.count == 2

    false
  end

  def score_complete?
    if !spare? && !strike? && complete?
      true
    elsif spare? && !@bonus.empty?
      true
    elsif strike? && @bonus.count == 2
      true
    else
      false
    end
  end

  def strike?
    @rolls[0] == 10
  end

  def spare?
    @rolls.sum == 10 && @rolls.length == 2
  end
end
