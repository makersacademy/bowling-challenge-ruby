require 'frame'

class Game
  MAX_FRAMES = 10

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

  def initialize(frames_collection_class = FramesCollection)
    @frames = frames_collection_class.new
  end

  def scores_to_frames
    number = 1
    @frames.add_frame(number)

    @scores.each do |score|
      if @frames.frame(number).complete?
        number += 1
        @frames.add_frame(number)
      end

      @frames.frame(number).add_roll(score)
    end
  end

  def add_bonuses_to_frames
    @frames.collection.each do |frame|
      if frame.number == MAX_FRAMES
        frame
      elsif frame.spare?
        frame.add_bonus(next_score(frame.number))
      elsif frame.strike?
        frame.add_bonus(next_score(frame.number))
        frame.add_bonus(second_next_score(frame.number))
      end
    end
  end

  def cumulative_scores
    prior_frame_total_score = 0

    @frames.collection.map do |frame|
      prior_frame_total_score = frame.total_score(prior_frame_total_score)
    end
  end

  def next_score(number)
    @frames.frame(number + 1).first_roll_score
  end

  def second_next_score(number)
    if @frames.frame(number + 1).second_roll_score
      @frames.frame(number + 1).second_roll_score
    else
      @frames.frame(number + 2).first_roll_score
    end
  end
end
