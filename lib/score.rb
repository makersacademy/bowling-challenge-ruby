# frozen_string_literal: true

# Class for keeping track of the score
class Score
  def initialize
    @score_array = []
  end

  def add_score(num)
    score_array.push(num.to_i)
  end

  def total_score
    score_array.inject(0) { |sum, num| sum + num }
  end

  private #----------------------------------

  attr_accessor :score_array
end
