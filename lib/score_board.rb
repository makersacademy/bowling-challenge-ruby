# calculates overall scoring
class ScoreBoard
  class << self
    def total_score(game_frames = frames)
      self.frames = game_frames
      frame_scores.sum
    end

    def scores_and_rolls
      frames.map { |frame| { rolls: frame.rolls, score: frame.score } }
    end

    def running_total
      scores = []
      i = 0
      while i < frames.count
        scores << frame_scores[0..i].sum
        i += 1
      end
      scores
    end

    private

    attr_accessor :frames

    def frame_scores
      frames.map(&:score)
    end
  end
end
