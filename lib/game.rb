require 'frame'

class Game
  def self.create
    Game.new
  end

  def initialize(frame_class = Frame)
    @frames = [[], [], [], [], [], [], [], [], [], []]
    @frame_class = frame_class
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
      frame_index += 1 if new_frame?(frame_index)
    end
  end

  def add_bonuses_to_frames
    @frames.each_with_index do |frame, frame_index|
      if frame_index == 9
        frame
      elsif spare?(frame)
        frame << next_score(frame_index)
      elsif strike?(frame)
        frame << next_score(frame_index)
        frame << second_next_score(frame_index)
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
    frame[0] == 10
  end

  def spare?(frame)
    frame.length == 2 && frame.sum == 10
  end

  def new_frame?(frame_index)
    (strike?(@frames[frame_index]) || @frames[frame_index].length == 2) && frame_index < 9
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
