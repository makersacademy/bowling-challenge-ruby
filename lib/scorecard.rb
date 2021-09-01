class Scorecard

  def scorecard(frames)
    frames.map { |frame| print scorecard_string(frame) + "\n" }
  end

  private

  def scorecard_string(frame)
    "Frame: #{frame.frame_id.to_s.ljust(2)} | #{frame.roll_1}"\
    " | #{frame.roll_2.to_s.ljust(1)} | "\
    "#{"#{frame.roll_3}" if frame.roll_3}"\
  end

end
