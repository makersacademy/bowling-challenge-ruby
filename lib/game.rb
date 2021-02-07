# frozen_string_literal: true

require 'player'
require 'score'

class Game
  attr_reader :progress

  def initialize
    @progress = 0
    @scores = Hash.new
  end

  def input_bowl(pins)
    @progress += 1
  end
end
