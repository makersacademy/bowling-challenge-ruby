class Scorecard

  def initialize
    @frames = [[], [], [], [], [], [], [], [], [], []]
  end

  def self.create
    Scorecard.new
  end

  def score(roll_scores)
    @roll_scores = roll_scores
    roll_score_to_frame_index # puts the roll scores in the corresponding frame index
    roll_scores_in_frames_with_bonus # puts the roll scores in the frame subarrays and adds bonus points if necessary
    running_cumulative_frame_scores # sums the individual scores in each frames and adds it to earlier frames
  end

  def roll_score_to_frame_index
    frame_index = 0

    @roll_scores.each do | roll_score |
      @frames[frame_index] << roll_score
      frame_index += 1 if new_frame?(frame_index)
    end
  end

  def roll_scores_in_frames_with_bonus
    @frames.each_with_index do | frame, frame_index |
      if last_frame?(frame_index)
        frame
      elsif spare?(frame)
        frame << next_score(frame_index)
      elsif strike?(frame)
        frame << next_score(frame_index)
        frame << second_next_score(frame_index)
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

  def spare?(frame)
    frame.length == 2 && frame.sum == 10
  end

  def last_frame?(frame_index)
    frame_index == 9
  end

  def new_frame?(frame_index)
    (@frames[frame_index].length == 2 || strike?(@frames[frame_index])) && frame_index < 9
  end


  def next_score(frame_index)
    @frames[frame_index + 1][0]
  end

  def second_next_score(frame_index)
    if @frames[frame_index + 1].length >= 2
      @frames[frame_index + 1][1]
    else
      @frames[frame_index + 2][0]
    end
  end

end