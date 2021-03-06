class Game
  attr_reader :total_frames, :frames
  FRAMES = 10

  def initialize
    @total_frames = FRAMES
    @frames = []
  end

  def played(frame_score)
    @frames << frame_score
  end 
end