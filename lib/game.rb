require 'frame'

class Game
  def self.create
    Game.new
  end

  def score(scores)
    @scores = scores
    scores_to_frames
    add_bonuses_to_frames
    cumulative_scores
  end

  private

  def initialize(frame_class = Frame)
    @frames = []
    @frame_class = frame_class
  end

  def scores_to_frames
    frame_index = 0
    @frames << @frame_class.new(frame_index)

    @scores.each do |score|
      if @frames[frame_index].complete?
        frame_index += 1
        @frames << @frame_class.new(frame_index)
      end

      @frames[frame_index].add_roll(score)
    end
  end

  def add_bonuses_to_frames
    @frames.each_with_index do |frame, frame_index|
      if frame_index == 9
        frame
      elsif frame.spare?
        frame.add_bonus(next_score(frame_index))
      elsif frame.strike?
        frame.add_bonus(next_score(frame_index))
        frame.add_bonus(second_next_score(frame_index))
      end
    end
  end

  def cumulative_scores
    prior_frame_total_score = 0

    @frames.map do |frame|
      prior_frame_total_score = frame.total_score(prior_frame_total_score)
    end
  end

  def next_score(frame_index)
    @frames[frame_index + 1].first_roll_score
  end

  def second_next_score(frame_index)
    if @frames[frame_index + 1].second_roll_score
      @frames[frame_index + 1].second_roll_score
    else
      @frames[frame_index + 2].first_roll_score
    end
  end
end
