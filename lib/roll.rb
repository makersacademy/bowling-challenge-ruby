# frozen_string_literal: true

class Roll
  attr_accessor :roll_count, :pins_hit, :hit_type
  def initialize(roll_count,pins_hit)
    if roll_count > 1
      raise("You can only roll twice a frame")

    end
    @roll_count = roll_count + 1
    @pins_hit = pins_hit
    # @hit_type = self.hit_type_calculator
  end

  def next_roll

  end
  private
  def hit_type_calculator


  end
end
