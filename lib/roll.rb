# frozen_string_literal: true

class Roll
  attr_reader  :hit_type, :pins_hit
  def initialize
    @pins_hit = 0
  end
  def roll_score(pins_hit,roll_count)
    @pins_hit = @pins_hit +  pins_hit
    @hit_type = hit_type_calculator(roll_count)
  end


  def hit_type_calculator(roll_count)
    case
    when (@pins_hit == 10) && (roll_count == 1)
      return "Strike"
    when (@pins_hit == 10) && (roll_count == 2)
      return "Spare"

    else
      # type code here
    end

  end
end
