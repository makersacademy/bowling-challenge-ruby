class ScoreBoard
  class << self
    def frame_scores(frames)
      frames.map(&:score)
    end

    def total_score(frames)
      frame_scores(frames).sum
    end

    def scores_and_rolls(frames)
      frames.map { |frame| { rolls: frame.rolls, score: frame.score } }
    end
  end
end
