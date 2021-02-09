# frozen_string_literal: true

class Bonus
  attr_reader :extra, :status
  def initialize(status)
    @status = status
    @extra = 0
  end

  def per_roll(pins)
    @status -= 1
    @extra += pins
  end
end
