# frozen_string_literal: true

# Roll class: represents a single roll
# of the bowling ball into pins
class Roll
  attr_reader :remaining_pins, :frame, :hit

  def initialize(remaining_pins = 10)
    @hit = 0
    @remaining_pins = remaining_pins
  end

  def knock_down(user_input = gets.chomp)
    roll = user_input.to_i
    return 'Cannot knock more pins than were standing' if roll > @remaining_pins
    @remaining_pins -= roll
    @hit = roll
  end
end
