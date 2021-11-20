# frozen_string_literal: true

class Game
  def initialize
    @rolls = []
  end

  def roll(pins)
    @rolls << pins
  end

  def score
    @bonus = []

    # spare
    @rolls.each_with_index do |roll, index|
      next unless index.odd?

      @bonus << @rolls[index + 1] if roll + @rolls[index - 1] == 10
    end

    # strike
    @rolls.each_with_index do |roll, index|
      if roll == 10 && @rolls[index + 1] != nil && @rolls[index + 2] != nil && @rolls[index + 1] != 10
        @bonus << (@rolls[index + 1] + @rolls[index + 2])
      end
      @bonus << 20 if roll == 10 && @rolls[index + 1] == 10 && @rolls[index + 2] == 10
      @bonus << 10 + @rolls[index + 2] if roll == 10 && @rolls[index + 1] == 10 && @rolls[index + 2] != 10
    end

    @rolls.sum + @bonus.sum
  end
end
