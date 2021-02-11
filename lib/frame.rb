# frozen_string_literal: true

class Frame
  attr_reader :open, :rolls, :number, :bonus

  def initialize(num)
    @number = num
    @open = true
    @rolls = []
  end

  def add_roll(pins)
    raise 'Frame is closed.' if open != true
    pins = 0 if number == 10 && rolls.length >= 1 && rolls.sum >= 10
    @rolls << pins
    @bonus = 2 if strike?
    @bonus = 1 if spare?
    @open = false if close?
  end

  private

  def close?
    return true if number < 10 && rolls.length == 2
    return true if number < 10 && strike?
    return true if rolls.length == 3
    return true if number == 10 && rolls.length == 2 && !(strike? || spare?)
  end

  def strike?
    rolls[-1] == 10
  end

  def spare?
    rolls.length == 2 && rolls.sum == 10
  end
end
