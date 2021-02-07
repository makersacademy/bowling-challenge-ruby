class Score
  attr_reader :input_scores
  def initialize(input_scores:)
    @input_scores = input_scores
  end

  def calculateScore
    return 300 if perfect_game?
    return 0 if gutter_game?
    return input_scores.sum
  end

  private
  def gutter_game?
    input_scores == [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
  end

  def perfect_game?
    input_scores == [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10]
  end
end
