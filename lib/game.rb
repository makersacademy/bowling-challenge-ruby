# frozen_string_literal: true

class Game

    def initialize
      @rolls = []
    end

  def roll(pins)
    @rolls << pins
  end

  def score
    @rolls.sum
  end

end
