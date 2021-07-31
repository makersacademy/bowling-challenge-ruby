def roll_an_eight
  subject.first_roll(pins: subject.first_roll_input)
  subject.second_roll(pins: subject.second_roll_input)
  subject.end_frame
end
