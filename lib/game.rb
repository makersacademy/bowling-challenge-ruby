# frozen_string_literal: true

class Game
  attr_reader :rolls, :frame_scores

  def initialize
    @rolls = []
    @frame_scores = [] 
  end

  def roll(pins)
    @rolls << pins
  end

  def score
     @running_score = 0
     @frame_scores << @rolls.last(2).sum 
    @frame_scores.map { |frame| @running_score += frame}
  end
end
