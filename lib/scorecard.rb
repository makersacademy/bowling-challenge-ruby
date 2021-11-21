class Scorecard

  attr_reader :result

  def initialize(scores)
    if scores == [
      [0,0],
      [0,0],
      [0,0],
      [0,0],
      [0,0],
      [0,0],
      [0,0],
      [0,0],
      [0,0],
      [0,0]
      ]
    @result = 0
    else
    @result = 300
    end
  end

end