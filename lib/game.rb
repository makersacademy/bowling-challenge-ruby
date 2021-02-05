# frozen_string_literal: true

class Game
  attr_reader :score, :frame

  def initialize
    @frame = 0
    @score = []
  end

  def roll(pins)
    @score << pins
  end
end
