class ScoreCard
  attr_reader :frames

  def initialize
    @frames = []
  end

  def add_frame(frame)
    @frames << frame
  end

 
  def score
    score = 0
    frame_index = 0
    10.times do
      frame = frames[frame_index]
      if frame.strike?
        score += 10 + strike_bonus(frame_index)
        frame_index += 1
      elsif frame.spare?
        score += 10 + spare_bonus(frame_index)
        frame_index += 1
      else
        score += frame.score
        frame_index += 1
      end
    end
    score
  end

  private

  
  def strike_bonus(frame_index)
    frames[frame_index + 1].score + frames[frame_index + 2].roll1
  end

  def spare_bonus(frame_index)
    frames[frame_index + 1].roll1
  end
end


