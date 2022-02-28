class Frame
end

class LastFrame < Frame
  # A strike or spare in the ninth frame gives the player three balls in the tenth and final frame
  def bowled?
    (@rolls.length == SECOND_ROLL && total_pins_from_rolls(SECOND_ROLL) < 10) || @rolls.length == THIRD_ROLL
  end

  def total_pins_from_rolls(count)
    return 0 if @rolls.empty?

    @rolls.first(count).reduce(&:+)
  end
end
