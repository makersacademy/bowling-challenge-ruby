def roll(standing_pins, knocked_down)
  raise "Cannot knock down more pins than are standing" if knocked_down > standing_pins
  score = knocked_down.to_i
  remaining_pins = standing_pins - score
  { remaining_pins: remaining_pins, score: score }
end