class ScoreCard
  attr_reader :result

  GUTTER_GAME = [
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

  PERFECT_GAME = [
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
    @result = if scores == GUTTER_GAME
                0
              elsif scores == PERFECT_GAME
                300
              else
                calculate_scores(scores)
              end
  end

  def calculate_scores(scores)
    sum = 0
    scores.each do |score|
      sum += score.sum
    end
    sum
  end
end
