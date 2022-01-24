class ScoreCard
  def initialize
    @total_pins = []
  end

  def enter_pins(no_pins)
    return 'Invalid Entry' unless valid_entry?(no_pins)

    @total_pins << no_pins
    @total_pins.sum
  end

  def valid_entry?(no_pins)
    no_pins <= 10
  end
end
