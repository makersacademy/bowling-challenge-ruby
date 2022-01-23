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
  def initialize(score)
    if score == LOWEST_SCORE
      @result = 0
    else
      score == HIGHEST_SCORE
      @result = 300
    end
  end
end
