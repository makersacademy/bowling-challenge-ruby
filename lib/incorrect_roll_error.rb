# frozen_string_literal: true

# Error class for entering rolls incorrectly
class IncorrectRollError < StandardError
  attr_reader :thing

  def initialize(msg = 'Incorrect number of pins entered')
    super(msg)
  end
end
