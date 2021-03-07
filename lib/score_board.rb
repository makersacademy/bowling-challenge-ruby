# calculates overall scoring
class ScoreBoard
  class << self
    def total_score(frames)
      self.frames = frames
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

    def frame_scores
      frames.map(&:score)
    end

    attr_accessor :frames
  end
end
