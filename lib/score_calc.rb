class BowlingScore
  attr_reader :all_frames

  def initialize(all_frames)
    @all_frames = all_frames
  end

  def result
    score = []
    all_frames.each_with_index do |frame, index| 
      # add calculate score without bonuses
      score << frame.sum
      # apply logic for spare
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
    (spare_bonus(index)) + all_frames[index + 1][1] ||= all_frames[index + 2][0]
  end
end
