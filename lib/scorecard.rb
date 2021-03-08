class Scorecard
  attr_reader :scorecard

  def initialize
    @scorecard = []
  end

  def input_rolls(frame, roll1, roll2 = '-')
    @scorecard.push({frame => [roll1, roll2]})
  end

  # def input score

end
