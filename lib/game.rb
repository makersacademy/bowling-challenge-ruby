class Game
  def self.create
    Game.new
  end

  def initialize
    @frames = [[], [], [], [], [], [], [], [], [], []]
  end

  def score(scores)
    @scores = scores
    scores_to_frames
    add_bonuses_to_frames
    cumulative_scores
  end

  private

  def scores_to_frames
    frame_index = 0

    @scores.each do |score|
      @frames[frame_index] << score
      if new_frame?(frame_index)
        frame_index += 1
      end
    end
  end

  def add_bonuses_to_frames
    @frames.each_with_index do |frame, frame_index|
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

  def cumulative_scores
    prior_frame = 0

    @frames.map do |frame|
      frame = frame.sum + prior_frame
      prior_frame = frame
    end
  end

  def strike?(frame)
    true if frame[0] == 10
  end

  def new_frame?(frame_index)
    (strike?(@frames[frame_index]) || @frames[frame_index].length == 2) && frame_index < 9
  end
end
