# frozen_string_literal: true

class Bonus
  attr_reader :pins
  def initialize(num, pins, type)
    @pins = pins
    @roll = num
  end

end
