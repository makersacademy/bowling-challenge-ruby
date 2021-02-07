class Scorecard

  def initialize
    @frames = [[], [], [], [], [], [], [], [], [], []]
  end

  def self.create
    Scorecard.new
  end

  def score(roll_scores)
    @roll_scores = roll_scores
    roll_score
    frame_score
    running_cumulative_frame_scores
  end

  def roll_score
    frame_index = 0

    @roll_scores.each do | roll_score |
      @frames[frame_index] << roll_score
      frame_index += 1 if new_frame?(frame_index)
    end
  end

  def frame_score
    @frames.each_with_index do | frame, frame_index |
      if frame.sum < 10 || frame_index == 9
        frame
      elsif frame.length == 2
        frame << @frames[frame_index + 1][0]
      elsif @frames[frame_index + 1].length >= 2
        frame << @frames[frame_index + 1][0]
        frame << @frames[frame_index + 1][1]

      else
        frame << @frames[frame_index + 1][0]
        frame << @frames[frame_index + 2][0]
      end
    end
  end

  def running_cumulative_frame_scores
    prior_frame = 0
    @frames.map do | frame |
      frame = frame.sum + prior_frame
      prior_frame = frame
    end
  end

  def strike?(frame)
    true if frame[0] == 10
  end

  def new_frame?(frame_index)
    (@frames[frame_index].length == 2 || strike?(@frames[frame_index])) && frame_index < 9
  end

end