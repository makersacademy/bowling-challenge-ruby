class ScoreCard
  @@total_pins = []

  def enter_pins(no_pins)
    @@total_pins << no_pins
    @@total_pins.sum
  end
end