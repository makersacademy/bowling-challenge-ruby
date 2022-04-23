# frozen_string_literal: true

# Roll class: represents a single roll
# of the bowling ball into pins
class Roll
  attr_reader :standing_pins, :frame, :roll_score

  def initialize(standing_pins = 10)
    @standing_pins = standing_pins
  end

  def get_roll(user_input = gets.chomp)
    roll = user_input.to_i
    return 'Cannot knock more pins than were standing' if roll > @standing_pins

    @standing_pins -= roll
    @roll_score = roll
  end
end
