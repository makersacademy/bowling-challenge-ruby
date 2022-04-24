def roll(standing_pins, knocked_down)
  score = knocked_down.to_i
  remaining_pins = standing_pins - score
  { remaining_pins: remaining_pins, score: score }
end