# frozen_string_literal: true

# This class initializes with an array of pins knocked down with a series of bowls
class Scorecard
  DEFAULT_BOWLS = [1, 4, 4, 5, 6, 4, 5, 5, 10, 0, 1, 7, 3, 6, 4, 10, 2, 8, 6].freeze

  attr_reader :bowls

  def initialize(bowls = DEFAULT_BOWLS)
    @bowls = bowls
  end

  def frames
    check_strikes(@bowls).each_slice(2).to_a
  end

  private

  # Ensures each frame will have two values by adding a 0 after each 10
  def check_strikes(bowls)
    bowls.each_with_index { |v, i| bowls.insert(i + 1, 0) if v == 10 }
  end
end
