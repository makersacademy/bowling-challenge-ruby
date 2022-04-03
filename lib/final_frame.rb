# frozen_string_literal: true

# this class is instatiated by the Game class
# whenever it reaches the 10th frame
class FinalFrame
  attr_reader :strike, :spare, :rolls

  def initialize
    @rolls = []
    @strike = false
    @spare = false
    @bonus = []
  end

  def add_roll(pins)
    if @rolls.count < 2 && !@strike
      @rolls << pins
      if @rolls[0] == 10
        @strike = true
      elsif @rolls.sum == 10
        @spare = true
      end
    else
      add_bonus(pins)
    end
  end

  def add_bonus(pins)
    # if spare and we haven't added a bonus yet
    @bonus << pins if @spare && @bonus.empty?
    # if strike
    @bonus << pins if @strike && @bonus.count < 2
  end

  def frame_score
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
    if !@spare && !@strike && complete?
      true
    elsif @spare && !@bonus.empty?
      true
    elsif @strike && @bonus.count == 2
      true
    else
      false
    end
  end
end
