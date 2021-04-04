# frozen_string_literal: true

class Frame
  attr_reader :rolls

  def initialize
    @rolls = []
  end

  def roll(user_input)
    @rolls << user_input
  end

  def is_strike?
    @rolls.first == 10
  end

  def is_spare?
    @rolls.length == 2 && count == 10
  end

  def count
    @rolls.sum
  end
end
