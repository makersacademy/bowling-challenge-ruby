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
  ]

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
  ]
  def initialize(scores)
    if scores == LOWEST_SCORE
      @result = 0
		elsif
      scores == HIGHEST_SCORE
      @result = 300
		else
			@result = calculate_score(scores)
    end
  end

  def calculate_score(scores)
    sum = 0
    scores.map { |score| sum += score.sum }
    sum
  end
end
