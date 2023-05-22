# frozen_string_literal: true

class Frame
  attr_accessor :round, :score, :total_score, :status, :complete, :bonuses

  def initialize
    @complete = true
    @round = 0
    @score = 0
    @total_score = 0
    @bonuses = 0
  end
end
