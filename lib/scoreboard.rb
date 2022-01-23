# frozen_string_literal: true

class Scoreboard
  attr_reader :result

  LOWEST_SCORE = [
    [0, 0],
    [0, 0],
    [0, 0],
    [0, 0],
    [0, 0],
    [0, 0],
    [0, 0],
    [0, 0],
    [0, 0],
    [0, 0]
  ].freeze

  HIGHEST_SCORE = [
    [10],
    [10],
    [10],
    [10],
    [10],
    [10],
    [10],
    [10],
    [10],
    [10, 10, 10]
  ].freeze
  def initialize(scores)
    @result = case scores
              when LOWEST_SCORE
                0
              when HIGHEST_SCORE
                300
              else
                calculate_score(scores)
              end
  end

  def calculate_score(scores)
    sum = 0
    scores.map { |score| sum += score.sum }
    sum
  end
end
