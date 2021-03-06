# frozen_string_literal: true

class Frame
  attr_reader :number, :bowls

  def initialize(number:)
    @number = number
    @bowls = []
  end

  def add(bowl:)
    @bowls.push(bowl)
  end

  def pins
    @bowls.map(&:pins).sum
  end

  # private methods - add defers to normal_frame method or final_frame method?
end
