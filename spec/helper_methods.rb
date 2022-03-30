def roll_an_eight
  subject.first_roll(pins: subject.first_roll_input)
  subject.second_roll(pins: subject.second_roll_input)
  subject.end_frame
end

def roll_a_spare
  subject.first_roll(pins: 6)
  subject.second_roll(pins: 4)
  subject.end_frame
end

def roll_a_strike
  subject.first_roll(pins: 10)
  subject.second_roll(pins: 0)
  subject.end_frame
end