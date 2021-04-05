# frozen_string_literal: true

require_relative './roll'

class Frame
  attr_reader :pins_left, :result, :score

  def initialize
    @rolls = []
    @pins_left = 10
    @result = ''
    @score = 0
  end

  def roll(pins, bonus = false)
    pins_left = bonus ? 10 : @pins_left
    raise 'not enough pins left' unless pins_left >= pins

    @current_roll = Roll.new(pins_left)
    @current_roll.knock(pins)
    process_roll(pins, bonus)
  end

  def rolls
    @rolls.dup
  end

  def add_score(score)
    @score += score
  end

  private

  def process_roll(pins, bonus = false)
    @score += pins
    @pins_left -= pins unless bonus
    @rolls << @current_roll
    @result = 'Strike' if @pins_left.zero? && @rolls.length == 1
    @result = 'Spare' if @pins_left.zero? && @rolls.length == 2
  end
end
