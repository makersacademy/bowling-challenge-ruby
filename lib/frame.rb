class Frame
  @@log = []

  def self.fallen_pins(no_pins)
    @@log << no_pins
    @@log.sum
  end
end