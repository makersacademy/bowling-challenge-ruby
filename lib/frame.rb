# frozen_string_literal: true

class Frame
  attr_reader :open, :rolls, :number, :pins, :bonus

  def initialize(num)
    @number = num
    @open = true
    @rolls = []
  end

  def add_roll(pins)
    raise 'Frame is closed.' if open != true
    pins = 0 if number == 10 && rolls.length >= 1 && pins == 10
    @pins = pins
    @rolls << pins
    @open = false if close?
    @bonus = 2 if strike?
    @bonus = 1 if spare?
  end

  private

  def close?
    return true if number < 10 && rolls.length == 2
    return true if number < 10 && strike?
    return true if rolls.length == 3
    return true if number == 10 && rolls.length == 2 && !(strike? || spare?)
  end

  def strike?
    pins == 10
  end

  def spare?
    rolls.length == 2 && rolls.sum == 10
  end
end
