class BowlingScore
  attr_reader :all_frames

  def initialize(all_frames)
      @all_frames = all_frames
      unfinished_game if all_frames.length < 10
  end

  def result
    score = []
    all_frames.each_with_index do |frame, index| 
      score << frame.sum

      if spare?(frame)
        score << spare_bonus(index)
      elsif strike?(frame)
        score << strike_bonus(index)
      end
    end

    score.sum
  end

  private

  def spare?(frame)
    frame.length == 2 && frame.sum == 10
  end

  def spare_bonus(index)
    all_frames[index + 1][0]
  end

  def strike?(frame)
    frame.length == 1 && frame.sum == 10
  end

  def strike_bonus(index)
    next_frame = all_frames[index + 1]
    if strike?(next_frame)
      next_frame[0] + all_frames[index + 2][0] # adds the next strike points, plus the first roll of the frame after that
    else
      next_frame[0] + next_frame[1] # just adds first two rolls of the next frame
    end
  end

  def unfinished_game
    all_frames << [0, 0]
  end
end
