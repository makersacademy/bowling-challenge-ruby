 # def bonus_rolls?
  #   strike? ? 2 : spare? ? 1 : 0
  # end

class Game

  attr_reader :total_score, :closed_frames, :awaiting_frames

  def initialize(closed_frames = [], awaiting_frames = [])
    @closed_frames = closed_frames
    @awaiting_frames = awaiting_frames
  end

  def check_status(frame)
    frame.bonus_rolls.nil? ? @closed_frames << frame : @awaiting_frames << frame
  end
end