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
        score << handle_spare(index)
      end
    end
    score.sum
  end

  private

  def spare?(frame)
    frame.length == 2 && frame.sum == 10
  end

  def handle_spare(index)
    all_frames[index + 1][0]
  end
end
