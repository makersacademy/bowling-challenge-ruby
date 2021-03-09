# calculates overall scoring
class ScoreBoard
  class << self
    def total_score(game_frames = frames)
      self.frames = game_frames
      frame_scores.sum
    end

    def running_total
      frame_scores.map.with_index { |frame, i| frame_scores[0..i].sum }
    end

    private

    attr_accessor :frames

    def frame_scores
      frames.map(&:score)
    end
  end
end
