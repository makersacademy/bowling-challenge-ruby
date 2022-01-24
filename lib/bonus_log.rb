class BonusLog
  @@bonuses = []

  def self.log_strike_bonus(roll_no, frame_no)
    self.log_bonus([roll_no + 1, frame_no])
    self.log_bonus([roll_no + 2, frame_no])
  end

  def self.log_spare_bonus(roll_no, frame_no)
    self.log_bonus([roll_no + 1, frame_no])
  end

  def self.log_bonus(roll_to_add_and_frame_to_add_to)
    @@bonuses << roll_to_add_and_frame_to_add_to
  end

  def self.check_for_frames(roll_no)
    frames = []
    @@bonuses.each { |x| frames << x[1] if x[0] == roll_no }
    frames
  end
end