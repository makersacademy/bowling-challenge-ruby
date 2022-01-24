class ScoreCard
  def initialize(frame: Frame)
    @frame = frame
  end

  def enter_pins(no_pins)
    return 'Invalid Entry' unless valid_entry?(no_pins)

    @frame.fallen_pins(no_pins)
  end

  def valid_entry?(no_pins)
    no_pins <= 10
  end
end
