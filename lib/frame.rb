# frozen_string_literal: true

class Frame
  FRAME_PINS = 10

  def initialize
    @rolls = []
    @bonuses = []
  end

  def score
    @rolls.reduce(0, :+) + @bonuses.reduce(0, :+)
  end

  def roll(pinfall)
    @rolls << pinfall
  end

  def pinfall
    @rolls.reduce(0, :+)
  end

  def rolls
    @rolls.length
  end

  def strike?
    @rolls.first == FRAME_PINS
  end

  def spare?
    return false if @rolls.length < 2

    !strike? && @rolls[0] + @rolls[1] == FRAME_PINS
  end

  def add_bonus(pinfall)
    @bonuses << pinfall
  end
end
