# frozen_string_literal: true

# This class initializes with an array of pins knocked down with a series of bowls
class Scorecard
  DEFAULT_BOWLS = [1, 4, 4, 5, 6, 4, 5, 5, 10, 0, 1, 7, 3, 6, 4, 10, 2, 8, 6].freeze

  attr_reader :bowls

  def initialize(bowls = DEFAULT_BOWLS)
    @bowls = bowls
  end

  def frames
    framed_bowls = []
    i = 0
    while i < @bowls.length
      frame = []
      frame << @bowls[i]
      if @bowls[i] < 10
        i += 1
        frame << @bowls[i] unless @bowls[i].nil?
      end
      framed_bowls << frame
      i += 1
    end
    framed_bowls
  end
end
