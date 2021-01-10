def full_strike_frame
  subject.start_new_frame
  subject.roll_current_frame(10)
  subject.end_current_frame
end

def roll_normal_frame
  subject.start_new_frame
  subject.roll_current_frame(6, 3)
end


def full_spare_frame
  subject.start_new_frame
  subject.roll_current_frame(4, 6)
  subject.end_current_frame
end
