# frozen_string_literal: true

class Roll
  attr_accessor  :pins_hit
  attr_reader :roll_count, :hit_type
  def initialize
    @pins_hit = 0
    @roll_count = 0
  end
  def roll_score(pins_hit)
    roll_count_check
    @roll_count = @roll_count + 1
    @pins_hit = @pins_hit + pins_hit
    @hit_type = self.hit_type_calculator
    if @hit_type == "Strike"
      print "You got a Strike you now move onto your next Frame"
    end
  end

  private

  def roll_count_check
    if @roll_count > 1
      raise("You can only roll twice a frame")
    end
  end
  def hit_type_calculator

    case
    when @pins_hit == 0
      return "Gutter"
    when @pins_hit < 10
      return "Base"
    when (@pins_hit == 10) && (@roll_count == 1)
      return "Strike"
    else
      return "Spare"

    end

  end
end
