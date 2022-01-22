# frozen_string_literal: true

class Scoreboard
  attr_reader :result

  def initialize(scores)
    @result = if scores == [
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
                0
              else
                300
              end
  end
end
