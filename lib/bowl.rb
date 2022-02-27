# frozen_string_literal: true

class Bowl
  attr_reader :pins

  def initialize(pins:)
    @pins = pins
  end
end
