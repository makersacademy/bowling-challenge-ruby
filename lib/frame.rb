def roll(standing_pins, knocked_down)
  score = knocked_down.to_i
  standing_pins = standing_pins - score
  { standing_pins: standing_pins, score: score }
end