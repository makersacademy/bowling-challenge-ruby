# frozen_string_literal: true

class Frame
  attr_reader :open, :rolls, :number

  def initialize(num)
    @number = num
    @open = true
    @rolls = []
  end

  def add_roll(pins)
    @rolls << pins
    @open = false if @rolls.length == 2
    @open = false if pins == 10
  end
end
